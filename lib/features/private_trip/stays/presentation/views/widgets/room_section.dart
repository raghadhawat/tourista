import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/room_hotel_cubit/room_hotel_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/room_widget.dart';

class RoomSection extends StatelessWidget {
  const RoomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16),
        Text(
          LocaleKeys.chooseRoom.tr(),
          style: AppStyles.styleInterBold20(context),
        ),
        Gap(8),
        BlocBuilder<RoomHotelCubit, RoomHotelState>(
          builder: (context, state) {
            if (state is RoomHotelSuccess) {
              return Column(
                children: List.generate(
                    state.roomHotelModel.room!.length,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: RoomWidget(
                            room: state.roomHotelModel.room![index],
                          ),
                        )),
              );
            } else {
              return SizedBox();
            }
          },
        )
      ],
    );
  }
}
