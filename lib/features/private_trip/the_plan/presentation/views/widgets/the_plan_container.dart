import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class ThePlanContainer extends StatelessWidget {
  const ThePlanContainer(
      {super.key,
      required this.child,
      required this.data,
      required this.screenwidth,
      this.onTap,
      required this.withDeleteIcon});
  final Widget child;
  final String data;
  final double screenwidth;
  final void Function()? onTap;
  final bool withDeleteIcon;
  // final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        width: screenwidth,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 4,
                  color: Colors.grey.shade300,
                  offset: const Offset(-2, 2)),
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 4,
                  color: Colors.grey.shade300,
                  offset: const Offset(2, -2))
            ],
            borderRadius: BorderRadius.circular(2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        Assets.imagesIconsTheplanIcon,
                        color: kPrimaryColor,
                      ),
                      const Gap(5),
                      Text(
                        data,
                        style: AppStyles.styleInterBold20(context)
                            .copyWith(color: kPrimaryColor),
                      ),
                    ],
                  ),
                  withDeleteIcon == true
                      ? GestureDetector(
                          onTap: onTap,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SvgPicture.asset(
                              Assets.imagesIconsDelete,
                              width: 16,
                              height: 16,
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
