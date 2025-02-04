import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/ready_trips/presentation/manager/trip_info_cubit/trip_info_cubit.dart';

class SelectTicketNumberBox extends StatefulWidget {
  const SelectTicketNumberBox({
    super.key,
  });

  @override
  State<SelectTicketNumberBox> createState() => _SelectTicketNumberBoxState();
}

class _SelectTicketNumberBoxState extends State<SelectTicketNumberBox> {
  int selectedNumber = 0;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TripInfoCubit>();

    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: kYellowColor),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                if (selectedNumber > 0) {
                  setState(() {
                    selectedNumber--;
                  });
                  cubit.setTicketNumber(selectedNumber);
                }
              },
              icon: const Icon(
                Icons.remove_circle_outline,
              )),
          const Gap(16),
          Text(
            '$selectedNumber',
            style: AppStyles.styleInterBold25(context),
          ),
          const Gap(16),
          IconButton(
              onPressed: () {
                setState(() {
                  selectedNumber++;
                });
                cubit.setTicketNumber(selectedNumber);
              },
              icon: const Icon(
                Icons.add_circle_outline_outlined,
              )),
        ],
      ),
    );
  }
}
