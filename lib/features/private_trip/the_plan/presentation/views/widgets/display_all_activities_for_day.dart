import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/date_text.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/delete_activities_for_day_cubit/delete_activities_for_day_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/display_activities_card_list_view.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/empty_text_widget.dart';
import 'package:tourista/core/utlis/functions/show_dialog.dart';

import '../../../../../../core/translations/locale_keys.g.dart';
import '../../../../../../core/utlis/app_assets.dart';

class DisplayAllActivitiesForDay extends StatefulWidget {
  const DisplayAllActivitiesForDay({
    super.key,
    required this.state,
    required this.index,
    required this.screenWidth,
    required this.showConfirmationDialog,
    required this.text,
    required this.withDeleteIcon,
  });

  final GetUserPrivatePlanSuccess state;
  final int index;
  final double screenWidth;
  final CustomShowDialog showConfirmationDialog;
  final String text;
  final bool withDeleteIcon;
  @override
  State<DisplayAllActivitiesForDay> createState() =>
      _DisplayAllActivitiesForDayState();
}

class _DisplayAllActivitiesForDayState
    extends State<DisplayAllActivitiesForDay> {
  @override
  Widget build(BuildContext context) {
    bool isActivitiesEmpty = widget.state.getUserPrivatePlanModel
        .tourismPlaces![widget.index].tripDayPlace!.isEmpty;
    DateTime theDate = DateFormat('yyyy-MM-dd').parse(widget
        .state.getUserPrivatePlanModel.tourismPlaces![widget.index].date!);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateText(
                theDateString: widget.state.getUserPrivatePlanModel
                    .tourismPlaces![widget.index].date!,
              ),
              widget.withDeleteIcon
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          Assets.imagesIconsDelete,
                          width: 16,
                          height: 16,
                        ),
                        onTap: () {
                          widget.showConfirmationDialog.showConfirmationDialog(
                              context: context,
                              titleText: LocaleKeys.Confirmation.tr(),
                              contentText:
                                  'Are You sure you want to delete the Activities for ${DateFormat('EEEE d MMMM ').format(theDate)}',
                              onConfirmPressed: () {
                                isActivitiesEmpty == true
                                    ? GoRouter.of(context).pop()
                                    : BlocProvider.of<
                                                DeleteActivitiesForDayCubit>(
                                            context)
                                        .deleteActivities(
                                            tripDayId: widget
                                                .state
                                                .getUserPrivatePlanModel
                                                .tourismPlaces![widget.index]
                                                .id!);
                              },
                              cancel: true);
                        },
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
        isActivitiesEmpty == false
            ? DisplayActivitiesCardListView(
                state: widget.state,
                index: widget.index,
              )
            : EmptyTextWidget(data: widget.text)
      ],
    );
  }
}
