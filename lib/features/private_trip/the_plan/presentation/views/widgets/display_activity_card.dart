import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class DisplayActivityCard extends StatelessWidget {
  const DisplayActivityCard({
    super.key,
    required this.imageUrl,
    required this.activityName,
    required this.activityDescription,
  });
  final String imageUrl;
  final String activityName;
  final String activityDescription;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.grey.shade100,
                offset: const Offset(-2, 2)),
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.grey.shade100,
                offset: const Offset(2, -2))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 130,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
                child: Image.network('$kBaseUrl$imageUrl',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * .33),
              ),
            ),
            const Gap(8),
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 2,
                        activityName,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleQuickBold22(context),
                      ),
                      const Gap(8),
                      Text(
                        maxLines: 3,
                        activityDescription,
                        style: AppStyles.styleInterRegular14(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
