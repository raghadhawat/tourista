import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotels_cubit/hotels_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_list_view.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotels_shimmer.dart';

class CustomScrollViewWithBlocBuilder extends StatelessWidget {
  const CustomScrollViewWithBlocBuilder({
    Key? key,
    required this.width,
    required this.height,
    required this.tripId,
  }) : super(key: key);

  final double width;
  final double height;
  final int tripId;

  Future<void> _refreshData(context) async {
    await Future.delayed(Duration(seconds: 2));

    BlocProvider.of<HotelsCubit>(context).fetchHotelsCubitFun(tripId: tripId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(
      builder: (context, state) {
        if (state is HotelsSuccess) {
          return RefreshIndicator(
            onRefresh: () => _refreshData(context),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      '${state.hotelsModel.numberOfHotel} ${LocaleKeys.properties.tr()}',
                      style: AppStyles.styleInterRegular14(context),
                    ),
                  ),
                ),
                state.hotelsModel.numberOfHotel == 0
                    ? SliverToBoxAdapter(
                        child: ErrAnimation(errMessage: 'No Hotels Found!'))
                    : HotelMainListView(
                        tripId: tripId,
                        width: width,
                        height: height,
                        hotels: state.hotelsModel.hotel!,
                      )
              ],
            ),
          );
        } else if (state is HotelsFailure) {
          return ErrAnimation(
            errMessage: state.errMessage,
            onPressed: () {
              BlocProvider.of<HotelsCubit>(context)
                  .fetchHotelsCubitFun(tripId: tripId);
            },
          );
        } else {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return HotelsShimmer(screenWidth: width, height: height);
            },
          );
        }
      },
    );
  }
}
