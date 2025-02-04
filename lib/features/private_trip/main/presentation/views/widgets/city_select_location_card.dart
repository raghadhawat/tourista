import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/main/data/models/all_city_model/the_city.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/icon_container.dart';

class CitySelectLocationCard extends StatelessWidget {
  const CitySelectLocationCard({
    super.key,
    required this.theCity,
  });
  final TheCity theCity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: ListTile(
        leading: IconContainer(
          padding: 6,
          icon: SvgPicture.asset(
            Assets.imagesIconsSelectLocation,
            color: kPrimaryColor,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              theCity.name!,
              style: AppStyles.styleInterSemiBold18(context)
                  .copyWith(fontSize: 15.5),
            ),
            Text(
              theCity.country!,
              style: AppStyles.styleInterMedium16(context),
            )
          ],
        ),
      ),
    );

    //  Row(
    //   children: [
    //     IconContainer(
    //       padding: 6,
    //       icon: SvgPicture.asset(
    //         Assets.imagesIconsSelectLocation,
    //         color: kPrimaryColor,
    //       ),
    //     ),
    //     Gap(16),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           theCity.name!,
    //           style: AppStyles.styleInterSemiBold18(context)
    //               .copyWith(fontSize: 15.5),
    //         ),
    //         Text(
    //           theCity.country!,
    //           style: AppStyles.styleInterMedium16(context),
    //         )
    //       ],
    //     )
    //   ],
    // );
  }
}
