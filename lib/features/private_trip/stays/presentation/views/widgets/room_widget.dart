import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/room_hotel_model/room.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/beds_number.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/breakfast_room.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/delux_room_features.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/room_features.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/room_price_column.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/select_room_button.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/suite_room_features.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({
    super.key,
    required this.room,
  });
  final Room room;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: kPrimaryColor, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(4),
            Text(
              room.typeOfRoom == "DeluxeRoom"
                  ? 'Deluxe Room'
                  : room.typeOfRoom == "SuiteRoom"
                      ? "Suite Room"
                      : 'Single Room',
              style: AppStyles.styleInterBold20(context)
                  .copyWith(color: kPrimaryColor),
            ),
            const Gap(24),
            BedsNumber(
              room: room,
            ),
            const Gap(24),
            const BreakfastRoom(),
            const Gap(24),
            room.typeOfRoom == "DeluxeRoom"
                ? const DeluxRoomFeatures()
                : room.typeOfRoom == "SuiteRoom"
                    ? const SuiteRoomFeatures()
                    : const SingleRoomFeatures(),
            const Gap(24),
            RoomPriceColumn(
              room: room,
            ),
            const Gap(20),
            SelectRoomButton(
              room: room,
            ),
          ],
        ),
      ),
    );
  }
}
