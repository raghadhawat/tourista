import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class HotelsShimmer extends StatelessWidget {
  const HotelsShimmer({
    super.key,
    required this.screenWidth,
    required this.height,
  });

  final double screenWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        period: const Duration(milliseconds: 500),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth * .31,
              child: AspectRatio(
                aspectRatio: 2.5 / 4.75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                      color: Colors.grey[300]!,
                      width: screenWidth * .30,
                      height: height * 0.25),
                ),
              ),
            ),
            const Gap(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: Colors.grey[300]!,
                    width: screenWidth * .55,
                    height: height * 0.02),
                const Gap(5),
                Container(
                    color: Colors.grey[300]!,
                    width: screenWidth * .45,
                    height: height * 0.02),
                const Gap(5),
                Container(
                    color: Colors.grey[300]!,
                    width: screenWidth * .20,
                    height: height * 0.02),
              ],
            )
          ],
        ),
      ),
    );
  }
}
