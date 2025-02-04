import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotels_cubit/hotels_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotels_main_appbar_card.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/sort_by_hotels.dart';

class HotelMainAppBar extends StatefulWidget {
  const HotelMainAppBar({
    super.key,
    required this.tripId,
  });
  final int tripId;
  @override
  State<HotelMainAppBar> createState() => _HotelMainAppBarState();
}

class _HotelMainAppBarState extends State<HotelMainAppBar> {
  bool isSearchVisible = false;
  String? hotelSort;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 4),
              color: Colors.grey.withOpacity(.1))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSearchVisible
              ? SizedBox()
              : PopupMenuButton<String?>(
                  offset: Offset(0, 45),
                  constraints: BoxConstraints.expand(
                      width: double.infinity, height: 250),
                  icon: HotelsMainAppBarCard(
                    title: LocaleKeys.sort.tr(),
                    icon: Assets.imagesIconsSortBy,
                  ),
                  itemBuilder: (context) => <PopupMenuEntry<String?>>[
                    PopupMenuItem<String?>(
                      child: SortByHotels(
                        onItemSelected: (value) {
                          setState(() {
                            hotelSort = value;
                            BlocProvider.of<HotelsCubit>(context)
                                .fetchHotelsCubitFun(
                                    tripId: widget.tripId, sortBy: hotelSort);
                          });
                        },
                      ),
                    ),
                  ],
                ),
          isSearchVisible
              ? SizedBox()
              : HotelsMainAppBarCard(
                  title: LocaleKeys.map.tr(),
                  icon: Assets.imagesIconsGooglemap,
                ),
          Visibility(
            visible: isSearchVisible,
            child: Expanded(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                constraints: BoxConstraints(
                  maxHeight:
                      isSearchVisible ? MediaQuery.sizeOf(context).width : 0,
                ),
                child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      BlocProvider.of<HotelsCubit>(context)
                          .fetchHotelsCubitFun(tripId: widget.tripId);
                    } else {
                      BlocProvider.of<HotelsCubit>(context).fetchHotelsCubitFun(
                          tripId: widget.tripId, search: value);
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          HotelsMainAppBarCard(
            onTap: () {
              setState(() {
                isSearchVisible = !isSearchVisible;
              });
            },
            title: LocaleKeys.search.tr(),
            icon: Assets.imagesIconsSearch,
          ),
        ],
      ),
    );
  }
}
