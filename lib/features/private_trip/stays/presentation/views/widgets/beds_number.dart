import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/features/private_trip/stays/data/models/room_hotel_model/room.dart';

class BedsNumber extends StatelessWidget {
  const BedsNumber({
    super.key,
    required this.room,
  });
  final Room room;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesIconsBedRoom),
        Gap(8),
        Text(
          room.typeOfRoom == "DeluxeRoom"
              ? '2 ${LocaleKeys.singleBed.tr()}'
              : room.typeOfRoom == "SuiteRoom"
                  ? '1 ${LocaleKeys.doubleBed.tr()}'
                  : '1 ${LocaleKeys.singleBed.tr()}',
        )
      ],
    );
  }
}
