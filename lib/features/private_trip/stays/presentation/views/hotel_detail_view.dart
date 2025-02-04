import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotel_info_cubit/hotel_info_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_detail_view_body.dart';

class HotelDetailView extends StatefulWidget {
  const HotelDetailView({super.key, required this.info});

  final Map<String, dynamic> info;

  @override
  State<HotelDetailView> createState() => _HotelDetailViewState();
}

class _HotelDetailViewState extends State<HotelDetailView> {
  HotelInfoCubit? _hotelInfoCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _hotelInfoCubit = context.read<HotelInfoCubit>();
  }

  @override
  void dispose() {
    _hotelInfoCubit!.resetCubit(); // Access _hotelInfoCubit if it's not null
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.read<HotelInfoCubit>().resetCubit();
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: kPrimaryColor,
        ),
        body: HotelDetailViewBody(
          tripId: widget.info['tripId'],
          hotel: widget.info['hotel'],
        ),
      ),
    );
  }
}
