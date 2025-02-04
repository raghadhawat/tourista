import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/features/ready_trips/presentation/manager/all_ready_trips_cubit/all_ready_trips_cubit.dart';

class ReadyTripsAppBar extends StatefulWidget {
  const ReadyTripsAppBar({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  State<ReadyTripsAppBar> createState() => _ReadyTripsAppBarState();
}

class _ReadyTripsAppBarState extends State<ReadyTripsAppBar> {
  bool isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isSearchVisible
            ? SizedBox()
            : SvgPicture.asset(Assets.imagesTouristaLogoGreen),
        isSearchVisible ? SizedBox() : const Spacer(),
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
                  if (widget.index == 0) {
                    BlocProvider.of<AllReadyTripsCubit>(context)
                        .getAllReadyTripsFun(search: value);
                  } else {
                    BlocProvider.of<AllReadyTripsCubit>(context)
                        .getAllReadyTripsFun(
                            classificationId: widget.index, search: value);
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
        IconButton(
          icon: const Icon(
            Icons.search,
            color: kPrimaryColor,
          ),
          onPressed: () {
            setState(() {
              isSearchVisible = !isSearchVisible;
            });
          },
        ),
      ],
    );
  }
}
