import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    offset: const Offset(2, 2),
                    color: Colors.black.withOpacity(.1)),
                BoxShadow(
                    blurRadius: 1,
                    offset: const Offset(0, -2),
                    color: Colors.black.withOpacity(.1)),
                BoxShadow(
                    blurRadius: 1,
                    offset: const Offset(-2, 0),
                    color: Colors.black.withOpacity(.1)),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: AppStyles.styleInterRegular16(context),
                ),
                const Gap(10),
                Text(
                  Hive.box(kUserInfoBox).get(kUserWalletRef) == null
                      ? '0'
                      : '${Hive.box(kUserInfoBox).get(kUserWalletRef)} \$',
                  style: AppStyles.styleInterBold25(context),
                )
              ],
            ),
          ),
        ),
        const Gap(30),
        Text(
          'History',
          style: AppStyles.styleInterSemiBold18(context),
        )
      ],
    );
  }
}
