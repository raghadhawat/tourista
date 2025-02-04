import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/room_hotel_model/room.dart';

class RoomPriceColumn extends StatelessWidget {
  const RoomPriceColumn({
    super.key,
    required this.room,
  });
  final Room room;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.PriceForOneNight.tr(),
          style: AppStyles.styleInterRegular18(context),
        ),
        Gap(12),
        Text(
          'US\$ ${room.price}',
          style: AppStyles.styleInterBold20(context),
        ),
        Gap(12),
        Text(
          maxLines: 3,
          room.description!,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.styleInterRegular14(context)
              .copyWith(color: Colors.black.withOpacity(.7)),
        )
      ],
    );
  }
}
