import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/features/private_trip/activities/data/models/tourism_activities/activity_model.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/activity_card_cubit/activity_card_cubit.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utlis/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'custom_check_box.dart';

class CustomActivityCard extends StatefulWidget {
  const CustomActivityCard({
    super.key,
    required this.screenWidth,
    required this.activityName,
    required this.activityDescription,
    required this.activityImages,
    required this.activityModel,
    required this.dayId,
    required this.dayDate,
  });

  final double screenWidth;
  final String? activityImages;
  final String? activityName;
  final String? activityDescription;
  final ActivityModel? activityModel;
  final int? dayId;
  final String dayDate;

  @override
  State<CustomActivityCard> createState() => _CustomActivityCardState();
}

class _CustomActivityCardState extends State<CustomActivityCard> {
  bool isChecked = false;
  @override
  void initState() {
    super.initState();

    final cubit = context.read<ActivityCardCubit>();
    final activityData =
        cubit.getActivityCardData(widget.dayId!, widget.activityModel?.id ?? 0);

    if (activityData.isNotEmpty) {
      isChecked = true;
    } else {
      isChecked = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final cubit = context.read<ActivityCardCubit>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: widget.screenWidth * .9,
        height: height * 0.17,
        child: Row(
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomCheckbox(
                value: isChecked,
                onChanged: (value) {
                  isChecked = !isChecked;
                  setState(() {
                    if (isChecked) {
                      // Add the activity data to the state
                      cubit.setactivitiesCardData(widget.dayId!, {
                        'id': widget.activityModel?.id,
                        'name': widget.activityName,
                        'description': widget.activityDescription,
                        'images': widget.activityImages,
                      });
                    } else {
                      // Remove the activity data from the state
                      cubit.removeActivityCardData(
                          widget.dayId!, widget.activityModel?.id ?? 0);
                    }
                  });
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .85,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage(
                                '$kBaseUrl${widget.activityImages!}'),
                            fit: BoxFit.cover)),
                    width: MediaQuery.of(context).size.width * .3,
                  ),
                  const Gap(8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 2,
                              widget.activityName!,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.styleQuickBold22(context),
                            ),
                            const Gap(5),
                            Text(
                              maxLines: 3,
                              widget.activityDescription!,
                              style: AppStyles.styleInterRegular14(context),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CustomButton(
                                onTap: () {
                                  GoRouter.of(context).push(
                                      AppRouter.kActivityDetailsView,
                                      extra: {
                                        'activityModel': widget.activityModel,
                                        'dayDate': widget.dayDate,
                                        'dayIndex': widget.dayId
                                      });
                                },
                                text: LocaleKeys.details.tr(),
                                width: 55,
                                borderRadius: 10,
                                height: 23,
                                style: AppStyles.styleSourceBold12(context),
                                color: kPrimaryColor),
                          ),
                        ),
                        const Gap(15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
