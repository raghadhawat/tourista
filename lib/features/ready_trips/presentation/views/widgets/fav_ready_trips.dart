import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/features/ready_trips/data/models/all_ready_trips_model/the_trip.dart';
import 'package:tourista/features/ready_trips/presentation/manager/add_favorit_trip_cubit/add_favorit_trip_cubit.dart';

class FavReadyTrips extends StatefulWidget {
  const FavReadyTrips({
    super.key,
    required this.theTrip,
    required this.value,
  });
  final TheTrip theTrip;
  final int value;

  @override
  State<FavReadyTrips> createState() => _FavReadyTripsState();
}

class _FavReadyTripsState extends State<FavReadyTrips> {
  bool? isFav;
  @override
  void initState() {
    isFav = widget.theTrip.favorite!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: Container(
        transformAlignment: Alignment.center,
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: BlocListener<AddFavoritTripCubit, AddFavoritTripState>(
          listener: (context, state) {
            if (state is AddFavoritTripFailure) {
              customSnackBar(context, state.errMessage);
            }
          },
          child: GestureDetector(
            onTap: () {
              isFav = !isFav!;
              setState(() {});
              BlocProvider.of<AddFavoritTripCubit>(context)
                  .addFavouriteTripFun(tripId: widget.theTrip.id!);
            },
            child: Icon(
              isFav! ? Icons.favorite : Icons.favorite_border_rounded,
              color: Colors.red,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
