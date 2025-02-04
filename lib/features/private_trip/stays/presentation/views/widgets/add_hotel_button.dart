import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/widgets/add_to_plan_button.dart';
import 'package:tourista/features/private_trip/stays/data/repos/stays_repo_impl.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/add_hotel_cubit/add_hotel_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotel_info_cubit/hotel_info_cubit.dart';

class AddHotelButton extends StatelessWidget {
  const AddHotelButton({
    super.key,
    required this.tripId,
  });

  final int tripId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelInfoCubit, HotelInfoState>(
      builder: (context, hotelInfostate) {
        return BlocProvider(
          create: (context) => AddHotelCubit(getIt.get<StaysRepoImpl>()),
          child: BlocConsumer<AddHotelCubit, AddHotelState>(
            listener: (context, state) {
              if (state is AddHotelFailure) {
                customSnackBar(context, state.errMessage);
              }
              if (state is AddHotelSuccess) {
                customSuccessSnackBar(context, "Room Added Successfully");
              }
            },
            builder: (context, state) {
              return state is AddHotelLoading
                  ? const SpinKitThreeBounce(
                      color: kPrimaryColor,
                      size: 30,
                    )
                  : AddToPlanButton(
                      price: hotelInfostate.price,
                      screenWidth: MediaQuery.sizeOf(context).width,
                      onTap: () {
                        List<dynamic> rooms = [];
                        hotelInfostate.rooms?.forEach((key, value) {
                          rooms.addAll([
                            {
                              "roomHotel_id": key,
                              "numberOfRoom": value[key][0]
                            },
                          ]);
                        });

                        BlocProvider.of<AddHotelCubit>(context)
                            .addHotelCubitFun(
                                tripId: tripId,
                                checkIn: hotelInfostate.checkIn == null
                                    ? ''
                                    : '${hotelInfostate.checkIn}'
                                        .substring(0, 10),
                                checkOut: hotelInfostate.checkOut == null
                                    ? ''
                                    : '${hotelInfostate.checkOut}'
                                        .substring(0, 10),
                                rooms: rooms);
                      });
            },
          ),
        );
      },
    );
  }
}
