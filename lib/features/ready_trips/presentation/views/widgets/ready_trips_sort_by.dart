import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/features/ready_trips/presentation/manager/all_ready_trips_cubit/all_ready_trips_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/sort_by_menu_items.dart';

class ReadyTripsSortBy extends StatefulWidget {
  const ReadyTripsSortBy({
    Key? key,
    required this.classificationId,
  }) : super(key: key);
  final int classificationId;
  @override
  State<ReadyTripsSortBy> createState() => _ReadyTripsSortByState();
}

class _ReadyTripsSortByState extends State<ReadyTripsSortBy> {
  String? readySort;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        PopupMenuButton<String?>(
          offset: Offset(0, 45),
          constraints:
              BoxConstraints.expand(width: double.infinity, height: 300),
          icon: Row(
            children: [
              Text(LocaleKeys.sort.tr()),
              const Gap(2),
              SvgPicture.asset(Assets.imagesIconsSortDown),
            ],
          ),
          itemBuilder: (context) => <PopupMenuEntry<String?>>[
            PopupMenuItem<String?>(
              child: SortByMenuItems(
                onItemSelected: (value) {
                  setState(() {
                    readySort = value;
                    print(readySort);
                    if (widget.classificationId == 0) {
                      BlocProvider.of<AllReadyTripsCubit>(context)
                          .getAllReadyTripsFun(sortBy: readySort);
                    } else {
                      BlocProvider.of<AllReadyTripsCubit>(context)
                          .getAllReadyTripsFun(
                              classificationId: widget.classificationId,
                              sortBy: readySort);
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
