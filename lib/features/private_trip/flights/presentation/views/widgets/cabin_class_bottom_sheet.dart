import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/cabin_class_radio_list_tile.dart';

class CabinClassBottomSheet extends StatelessWidget {
  const CabinClassBottomSheet({
    super.key,
    required this.onCabinChanged,
    required this.onValueChanged,
  });
  final ValueChanged<String> onCabinChanged;
  final ValueChanged<String> onValueChanged;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: .8,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.cabinClass.tr(),
              style: AppStyles.styleInterBold25(context)
                  .copyWith(color: kPrimaryColor),
            ),
            const Gap(10),
            CabinCalssRadioListTile(
              onCabinChanged: onCabinChanged,
              onValueChanged: onValueChanged,
            )
          ],
        ),
      ),
    );
  }
}
