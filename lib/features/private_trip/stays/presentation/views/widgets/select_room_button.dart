import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/room_hotel_model/room.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotel_info_cubit/hotel_info_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/select_room_buttom_sheet.dart';

class SelectRoomButton extends StatelessWidget {
  const SelectRoomButton({
    super.key,
    required this.room,
  });
  final Room room;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelInfoCubit, HotelInfoState>(
      builder: (context, state) {
        print(state.rooms);
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SelectRoomButtomSheet(room: room);
              },
            );
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(4),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  state.rooms == null
                      ? LocaleKeys.select.tr()
                      : state.rooms!.containsKey(room.id) &&
                              state.rooms![room.id][room.id][0] != 0
                          ? '${state.rooms![room.id][room.id][0]} ${LocaleKeys.roomSelected.tr()}' // Display the map associated with the room ID
                          : LocaleKeys.select.tr(),
                  style: AppStyles.styleSourceSemiBold20(context)
                      .copyWith(color: kPrimaryColor, fontSize: 18),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
