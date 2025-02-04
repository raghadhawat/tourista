import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/cities_hotel.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/places_image_page_view.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/places_text_desc.dart';

class ReadyTripHotelDtailsViewBody extends StatelessWidget {
  const ReadyTripHotelDtailsViewBody({super.key, required this.citiesHotel});
  final CitiesHotel citiesHotel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlacesImagePageView(
            images: citiesHotel.images!,
          ),
          PlacesTextDesc(
            title: citiesHotel.hotel!.name!,
            desc: citiesHotel.description!,
            features: citiesHotel.hotel!.rate.toString(),
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
