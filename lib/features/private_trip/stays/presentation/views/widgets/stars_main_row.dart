import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class StarsMainRow extends StatelessWidget {
  const StarsMainRow({
    super.key,
    required this.hotel,
  });
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          hotel.hotelInfo!.rate!,
          (index) => Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: SvgPicture.asset(Assets.imagesIconsYellowStars),
              )),
    );
  }
}
