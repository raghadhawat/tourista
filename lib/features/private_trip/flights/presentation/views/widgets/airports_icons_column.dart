import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class AirportsIconsColumn extends StatelessWidget {
  const AirportsIconsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SvgPicture.asset(Assets.imagesIconsWhereFrom),
          Container(
            width: 1, // Set a fixed width for the container
            height: 30, // Set a fixed height for the container
            color: Colors.black
                .withOpacity(.6), // Specify the color for the container
          ),
          SvgPicture.asset(Assets.imagesIconsWhereTo),
        ],
      ),
    );
  }
}
