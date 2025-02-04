import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';

class TicketDuration extends StatelessWidget {
  const TicketDuration({
    super.key,
    required this.width,
    required this.duratoin,
  });

  final double width;
  final String duratoin;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${duratoin.substring(0, 2)}h ${duratoin.substring(3)}min',
          style: AppStyles.styleInterRegular16(context)
              .copyWith(color: Colors.black.withOpacity(.5)),
        ),
        SizedBox(
            width: width * .4,
            child: Divider(
              color: Colors.black.withOpacity(.5),
            )),
        Text(
          LocaleKeys.direct.tr(),
          style: AppStyles.styleInterRegular16(context)
              .copyWith(color: Colors.black.withOpacity(.5)),
        ),
      ],
    );
  }
}
