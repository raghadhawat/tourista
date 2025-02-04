import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/widgets/custom_divider.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/add_hotel_button.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/check_in_check_out_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/column_details_review.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/features_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_details_average_price.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_details_location.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_details_photos_down_grid.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_details_photos_up_grid.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/room_section.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/stars_main_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/title_details_hotel.dart';
import 'hotel_details_reviews.dart';

class HotelDetailViewBody extends StatelessWidget {
  const HotelDetailViewBody(
      {super.key, required this.hotel, required this.tripId});
  final Hotel hotel;
  final int tripId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TitleDetailsHotel(hotel: hotel),
                ),
                const SliverToBoxAdapter(child: Gap(14)),
                SliverToBoxAdapter(
                  child: StarsMainRow(hotel: hotel),
                ),
                const SliverToBoxAdapter(child: Gap(20)),
                HotelDetailsPhotosUpGrid(hotel: hotel),
                const SliverToBoxAdapter(child: Gap(6)),
                HotelDetailsPhotosDownGrid(hotel: hotel),
                const SliverToBoxAdapter(child: Gap(16)),
                SliverToBoxAdapter(
                  child: FeaturesRow(hotel: hotel),
                ),
                const SliverToBoxAdapter(child: Gap(16)),
                const SliverToBoxAdapter(
                  child: CheckInCheckOutRow(),
                ),
                const SliverToBoxAdapter(child: Gap(20)),
                SliverToBoxAdapter(
                  child: HotelDetailsAveragePrice(hotel: hotel),
                ),
                const SliverToBoxAdapter(child: Gap(20)),
                const SliverToBoxAdapter(child: CustomDivider()),
                const SliverToBoxAdapter(child: Gap(15)),
                const SliverToBoxAdapter(
                  child: HotelDetailsLocation(),
                ),
                const SliverToBoxAdapter(child: Gap(10)),
                const SliverToBoxAdapter(child: CustomDivider()),
                SliverToBoxAdapter(
                  child: HotelDetailsReviews(hotel: hotel),
                ),
                const SliverToBoxAdapter(child: CustomDivider()),
                SliverToBoxAdapter(
                  child: ColumnDetailsReview(hotel: hotel),
                ),
                const SliverToBoxAdapter(child: CustomDivider()),
                const SliverToBoxAdapter(
                  child: RoomSection(),
                )
              ],
            ),
          ),
        ),
        AddHotelButton(tripId: tripId)
      ],
    );
  }
}
