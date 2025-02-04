import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/room_features_model.dart';

class SingleRoomFeatures extends StatelessWidget {
  const SingleRoomFeatures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<RoomFeaturesModel> features = [
      RoomFeaturesModel(
          title: LocaleKeys.flatScreen.tr(),
          icon: Assets.imagesIconsFlatscreenRoom),
      RoomFeaturesModel(
          title: LocaleKeys.freeWifi.tr(),
          icon: Assets.imagesIconsFreeWifiRoom),
      RoomFeaturesModel(
          title: LocaleKeys.privateBathroom.tr(),
          icon: Assets.imagesIconsBathroomRoom),
      RoomFeaturesModel(
          title: LocaleKeys.airCondition.tr(),
          icon: Assets.imagesIconsAirConditionRoom),
    ];
    return Wrap(
      spacing: 8,
      children: List.generate(
        features.length,
        (index) => IntrinsicWidth(
          child: ListTile(
            visualDensity: VisualDensity(horizontal: -2, vertical: -4),
            dense: true,
            horizontalTitleGap: 0,
            contentPadding: const EdgeInsets.only(
              left: 0.0,
              right: 0.0,
            ),
            leading: SvgPicture.asset(
              features[index].icon,
            ),
            title: Text(
              features[index].title,
              style: AppStyles.styleInterRegular14(context),
            ),
          ),
        ),
      ),
    );
  }
}
