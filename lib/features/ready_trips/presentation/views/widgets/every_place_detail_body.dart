import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/tourism_place.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/places_image_page_view.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/places_text_desc.dart';

class EveryPlaceDetailBody extends StatelessWidget {
  const EveryPlaceDetailBody({super.key, required this.tourismPlace});
  final TourismPlace tourismPlace;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlacesImagePageView(
            images: tourismPlace.images!,
          ),
          PlacesTextDesc(
            title: tourismPlace.name!,
            desc: tourismPlace.description!,
            openingHour: tourismPlace.openingHours,
          ),
          Padding(
            padding: const EdgeInsets.all(36),
            child: CustomButton(
                text: LocaleKeys.seeOnGoogleMap.tr(),
                width: MediaQuery.sizeOf(context).width,
                borderRadius: 24,
                height: 50,
                style: AppStyles.styleSourceBold20(context)
                    .copyWith(color: Colors.white),
                color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}
