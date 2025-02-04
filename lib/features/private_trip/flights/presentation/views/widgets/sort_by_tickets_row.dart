import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/sort_by_tickets.dart';

class SortByTicketsRow extends StatelessWidget {
  const SortByTicketsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SortByTickets(
          backgroundColor: kPrimaryColor.withOpacity(.4),
          textColor: kPrimaryColor,
          text: LocaleKeys.best.tr(),
        ),
        const Gap(4),
        SortByTickets(
          backgroundColor: kBlueColor,
          textColor: const Color(0xff285896),
          text: LocaleKeys.fastest.tr(),
        ),
      ],
    );
  }
}
