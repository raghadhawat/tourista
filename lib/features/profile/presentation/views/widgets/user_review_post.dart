import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/views/widgets/custom_circle_avatar.dart';

import '../../../../../core/utlis/app_assets.dart';

class UserReviewPost extends StatelessWidget {
  const UserReviewPost({
    super.key,
    required this.screenWidth,
    required this.circleAvatarName,
    required this.userName,
    required this.starsCount,
    required this.userComment,
    required this.userCommentCreatedDate,
  });

  final double screenWidth;
  final String circleAvatarName;
  final String userName;
  final int starsCount;
  final String userComment;
  final String userCommentCreatedDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomCircleAvatar(
              circleAvatarName: circleAvatarName,
            ),
            const Gap(10),
            SizedBox(
              width: screenWidth * .3,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: AppStyles.styleInterBold25(context),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: starsCount,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Image.asset(
                              Assets.imagesIconsHeart,
                              color: Colors.redAccent,
                              width: 15,
                              height: 15,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(15),
        Text(
          userComment,
          style: AppStyles.styleSourceRegular20(context),
        ),
        const Gap(10),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            userCommentCreatedDate,
            style: AppStyles.styleInterRegular14(context),
          ),
        ),
        const Gap(5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Divider(
            color: Colors.black.withOpacity(.7),
          ),
        ),
        const Gap(5),
      ],
    );
  }
}
