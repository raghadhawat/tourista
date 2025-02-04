import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/check_in_column.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/check_out_column.dart';

class CheckInCheckOutRow extends StatelessWidget {
  const CheckInCheckOutRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(6),
        const CheckInColumn(),
        Gap(MediaQuery.sizeOf(context).width * .25),
        const CheckOutColumn()
      ],
    );
  }
}
