import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class HeartRatingBar extends StatelessWidget {
  const HeartRatingBar({
    super.key,
    required this.initialRating,
    required this.onRatingUpdate,
  });
  final double initialRating;
  final Function(double) onRatingUpdate;
  @override
  Widget build(BuildContext context) {
    return RatingBar(
        itemSize: 25,
        initialRating: initialRating,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        ratingWidget: RatingWidget(
          full: Image.asset(
            Assets.imagesIconsHeart,
            color: Colors.redAccent,
          ),
          half: Image.asset(
            Assets.imagesIconsHeartHalf,
            color: Colors.redAccent,
          ),
          empty: Image.asset(
            Assets.imagesIconsHeartBorder,
            color: Colors.redAccent,
          ),
        ),
        itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
        onRatingUpdate: onRatingUpdate);
  }
}
