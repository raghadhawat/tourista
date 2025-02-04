import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class CustomAddedActivityCard extends StatelessWidget {
  const CustomAddedActivityCard({
    super.key,
    required this.activitiesForDay,
  });

  final dynamic activitiesForDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: activitiesForDay.map<Widget>((activity) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              height: 200,
              imageUrl: kBaseUrl + activity['images'],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.1),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(activity['name'],
                        style: AppStyles.styleInterBold20(context)
                            .copyWith(color: kPrimaryColor)),
                    const Gap(5),
                    Text(activity['description'],
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleInterMedium16(context)),
                    const Gap(10),
                  ],
                ),
              ),
            ),
          ),
          const Gap(10),
        ]);
      }).toList(),
    );
  }
}
