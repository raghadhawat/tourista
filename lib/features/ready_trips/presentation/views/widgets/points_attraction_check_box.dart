import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/ready_trips/presentation/manager/trip_info_cubit/trip_info_cubit.dart';

class PointsAttractionCheckBox extends StatefulWidget {
  const PointsAttractionCheckBox({
    super.key,
  });

  @override
  State<PointsAttractionCheckBox> createState() =>
      _PointsAttractionCheckBoxState();
}

class _PointsAttractionCheckBoxState extends State<PointsAttractionCheckBox> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TripInfoCubit>();

    return Row(
      children: [
        Gap(8),
        Checkbox(
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            activeColor: kPrimaryColor,
            checkColor: Colors.white,
            hoverColor: Colors.black,
            tristate: true,
            value: isCheck,
            onChanged: (value) {
              isCheck = !isCheck;
              setState(() {});
              cubit.setPointsOrNot(isCheck);
            }),
        Text(
          'Points Discount',
          style: AppStyles.styleSourceRegular23(context),
        ),
      ],
    );
  }
}
