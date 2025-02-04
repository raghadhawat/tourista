import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/select_number_widget.dart';
import 'package:tourista/features/private_trip/stays/data/models/room_hotel_model/room.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotel_info_cubit/hotel_info_cubit.dart';

class SelectRoomButtomSheet extends StatelessWidget {
  const SelectRoomButtomSheet({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HotelInfoCubit>();

    int? num = 0;
    return FractionallySizedBox(
      widthFactor: 1.0,
      heightFactor: .65,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              room.typeOfRoom!,
              style: AppStyles.styleInterSemiBold20(context),
            ),
            Gap(34),
            Row(
              children: [
                Text(
                  'Number Of Room',
                  style: AppStyles.styleInterRegular16(context),
                ),
                Spacer(),
                SelectNumberWidget(onNumberChanged: (int number) {
                  num = number;
                })
              ],
            ),
            Gap(36),
            Divider(
              color: Colors.black12,
            ),
            Row(
              children: [
                Spacer(),
                CustomButton(
                    onTap: () {
                      if (num != 0) {
                        cubit.setRooms(room.id!, {
                          room.id!: [num, room.price]
                        });
                        cubit.getPrice();
                      }

                      Navigator.pop(context);
                    },
                    text: 'Done',
                    width: 80,
                    borderRadius: 4,
                    height: 45,
                    style: AppStyles.styleInterBold20(context)
                        .copyWith(color: Colors.white),
                    color: kPrimaryColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
