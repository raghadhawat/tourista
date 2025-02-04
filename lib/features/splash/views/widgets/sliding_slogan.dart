import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class SlidingSlogan extends StatelessWidget {
  const SlidingSlogan({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, Widget) {
          return SlideTransition(
            position: slidingAnimation,
            child: SvgPicture.asset(Assets.imagesSlogan),
          );
        });
  }
}
