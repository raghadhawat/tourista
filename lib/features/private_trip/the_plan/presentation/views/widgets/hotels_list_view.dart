import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_review_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/stars_main_row.dart';

import '../../../../stays/presentation/views/widgets/hotel_main_card_price_and_description.dart';
import '../../manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';

class HotelsListView extends StatelessWidget {
  const HotelsListView({
    super.key,
    required this.state,
    required this.tripId,
    required this.width,
    required this.height,
  });
  final GetUserPrivatePlanSuccess state;
  final int tripId;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.getUserPrivatePlanModel.hotels!.length,
        itemBuilder: (context, hotelindex) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                        '$kBaseUrl${state.getUserPrivatePlanModel.hotels![hotelindex].images![0]}',
                        fit: BoxFit.cover,
                        height: 200,
                        width: MediaQuery.of(context).size.width * .35),
                  ),
                  Gap(MediaQuery.of(context).size.width * .01),
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
                              state.getUserPrivatePlanModel.hotels![hotelindex]
                                  .hotelInfo!.name!,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.styleQuickBold22(context),
                            ),
                            const Gap(10),
                            StarsMainRow(
                              hotel: state
                                  .getUserPrivatePlanModel.hotels![hotelindex],
                            ),
                            const Gap(10),
                            HotelMainReviewRow(
                              hotel: state
                                  .getUserPrivatePlanModel.hotels![hotelindex],
                            ),
                            const Gap(10),
                            SizedBox(
                              width: width * .3,
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                state.getUserPrivatePlanModel
                                    .hotels![hotelindex].description!,
                                style: AppStyles.styleSourceRegular18(context),
                              ),
                            ),
                            const Gap(14),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: HotelMainCardPriceAndDescription(
                                tripId: tripId,
                                width: width,
                                height: height,
                                hotel: state.getUserPrivatePlanModel
                                    .hotels![hotelindex],
                                showButton: false,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          );
        });
  }
}
