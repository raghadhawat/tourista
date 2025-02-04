import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/ready_trips_details_model.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/compact_calendar_widget.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_details_card.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_hotel.dart';

class ReadyTripDetailsWithoutButton extends StatelessWidget {
  const ReadyTripDetailsWithoutButton({
    super.key,
    required this.readyTripsDetailsModel,
  });

  final ReadyTripsDetailsModel readyTripsDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompactCalendarWidget(
          readyTripsDetailsModel: readyTripsDetailsModel,
        ),
        Gap(24),
        ReadyTripHotel(
          citiesHotel: readyTripsDetailsModel.publicTrip!.citiesHotel!,
        ),
        Gap(14),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: readyTripsDetailsModel.publicTrip!.publicTripPlace!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: ReadyTripDetailsCard(
                tourismPlace: readyTripsDetailsModel
                    .publicTrip!.publicTripPlace![index].tourismPlace!,
                isEnd: index ==
                    readyTripsDetailsModel.publicTrip!.publicTripPlace!.length -
                        1,
              ),
            );
          },
        ),
      ],
    );
  }
}
