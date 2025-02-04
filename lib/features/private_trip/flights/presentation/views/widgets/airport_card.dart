import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/flights/data/models/airport_where_from_model/air_port.dart';

class AirportCard extends StatelessWidget {
  const AirportCard({
    super.key,
    required this.airPort,
  });
  final AirPort airPort;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesIconsAirport,
        ),
        const Gap(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              airPort.name!,
              style: AppStyles.styleInterSemiBold18(context),
            ),
            Text(
              '${airPort.city!.name!},${airPort.city!.country!}',
              style: AppStyles.styleInterRegular16(context),
            ),
          ],
        )
      ],
    );
  }
}
