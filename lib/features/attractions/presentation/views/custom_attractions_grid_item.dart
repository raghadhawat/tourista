import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/attractions/data/models/attractions_model/attractions_model.dart';
import 'package:tourista/features/ready_trips/presentation/manager/ready_trip_details_cubit/ready_trip_details_cubit.dart';

class CustomAttractionsGridItem extends StatelessWidget {
  const CustomAttractionsGridItem({
    super.key,
    required this.attractionsModel,
    required this.attractionIndex,
  });
  final AttractionsModel attractionsModel;
  final int attractionIndex;
  @override
  Widget build(BuildContext context) {
    String attractionIndexTybe =
        attractionsModel.attraction![attractionIndex].type!;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 8,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * .5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Column(
                children: [
                  attractionIndexTybe == 'Discount On The Ticket'
                      ? Container(
                          height: 25,
                          width: MediaQuery.of(context).size.width * .5,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              '${attractionsModel.attraction![attractionIndex].discount!} % ${attractionsModel.attraction![attractionIndex].type!}',
                              style: AppStyles.styleSourceBold12(context),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  attractionIndexTybe == 'Points Discount'
                      ? Container(
                          height: 25,
                          color: kYellowColor,
                          child: Center(
                            child: Text(
                              '${attractionsModel.attraction![attractionIndex].discount!} % ${attractionsModel.attraction![attractionIndex].type!}',
                              style: AppStyles.styleSourceBold12(context),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Image.network(
                    '$kBaseUrl${attractionsModel.attraction![attractionIndex].image!}',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * .5,
                    height: 170,
                  ),
                  attractionIndexTybe == 'Special Event'
                      ? Container(
                          height: 25,
                          width: MediaQuery.of(context).size.width * .5,
                          color: kGreenColor,
                          child: Center(
                            child: Text(
                              attractionsModel
                                  .attraction![attractionIndex].type!,
                              style: AppStyles.styleSourceBold16(context)
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const Gap(5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(5),
                const Icon(
                  Icons.location_on_outlined,
                  weight: 5,
                  size: 17,
                  color: Colors.grey,
                ),
                const Gap(5),
                Text(attractionsModel.attraction![attractionIndex].diraction!,
                    style: AppStyles.styleInterSemiBold20(context)),
              ],
            ),
            const Gap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                  attractionsModel.attraction![attractionIndex].description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleInterRegular14(context)),
            ),
            const Gap(5),
            GestureDetector(
              onTap: () {
                BlocProvider.of<ReadyTripDetailsCubit>(context)
                    .getReadyTripDetailsFun(
                        tripId: attractionsModel
                            .attraction![attractionIndex].publicTripId!);
                GoRouter.of(context).push(AppRouter.kReadyTripDetailsView);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'See more',
                    style: AppStyles.styleInterBold16(context),
                  ),
                  const Gap(5),
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                  ),
                  const Gap(5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
