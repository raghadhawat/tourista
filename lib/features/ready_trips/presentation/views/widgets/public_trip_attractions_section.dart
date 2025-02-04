import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/attractions/data/models/public_trip_attractions/public_trip_attractions_model.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/points_attraction_check_box.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/vip_features.dart';

class PublicTripAttractionsSection extends StatelessWidget {
  const PublicTripAttractionsSection({
    super.key,
    required this.publicTripAttractionsModel,
  });
  final PublicTripAttractionsModel publicTripAttractionsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${publicTripAttractionsModel.attractions![0].type!} :',
          style: AppStyles.styleSourceBold20(context)
              .copyWith(color: kPrimaryColor, fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            publicTripAttractionsModel.attractions![0].description!,
            style: AppStyles.styleSourceRegular20(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        publicTripAttractionsModel.attractions![0].type == 'Points Discount'
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 6),
                    child: Column(
                      children: [
                        VIPFeatures(
                          text:
                              '${publicTripAttractionsModel.attractions![0].discountPoints} Points ${publicTripAttractionsModel.attractions![0].discount} %',
                        ),
                        const VIPFeatures(
                          text: 'you can use it by check the box',
                        ),
                      ],
                    ),
                  ),
                  const Gap(8),
                  const PointsAttractionCheckBox()
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
