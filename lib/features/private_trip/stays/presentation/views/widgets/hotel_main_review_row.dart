import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class HotelMainReviewRow extends StatelessWidget {
  const HotelMainReviewRow({
    super.key,
    required this.hotel,
  });
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    double rate = double.parse(hotel.review!.cleanliness!) +
        double.parse(hotel.review!.comfort!) +
        double.parse(hotel.review!.facilities!) / 3;
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: Center(
            child: Text(
              '${rate.toStringAsFixed(1)}',
              style: AppStyles.styleQuickSemiBold18(context),
            ),
          ),
        ),
        Gap(6),
        Text(
          getRatingDescription(rate),
          style: AppStyles.styleSourceSemiBold18(context),
        )
      ],
    );
  }

  String getRatingDescription(double rate) {
    if (rate >= 1 && rate < 2.5) {
      return 'normal';
    } else if (rate >= 2.5 && rate < 5) {
      return 'good';
    } else if (rate >= 5 && rate < 7.5) {
      return 'very good';
    } else if (rate >= 7.5 && rate <= 10) {
      return 'super';
    } else {
      return 'invalid rate'; // في حال كان التقييم خارج النطاق المحدد
    }
  }
}
