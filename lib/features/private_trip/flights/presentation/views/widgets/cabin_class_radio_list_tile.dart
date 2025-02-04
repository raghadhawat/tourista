import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';

class CabinCalssRadioListTile extends StatefulWidget {
  const CabinCalssRadioListTile({
    super.key,
    required this.onCabinChanged,
    required this.onValueChanged,
  });
  final ValueChanged<String> onCabinChanged;
  final ValueChanged<String> onValueChanged;
  @override
  State<CabinCalssRadioListTile> createState() =>
      _CabinCalssRadioListTileState();
}

class _CabinCalssRadioListTileState extends State<CabinCalssRadioListTile> {
  String? cabinClass;

  @override
  Widget build(BuildContext context) {
    List<String> cabinClassNamelist = [
      LocaleKeys.economy.tr(),
      LocaleKeys.premiumEconomy.tr(),
      LocaleKeys.business.tr(),
      LocaleKeys.firstClass.tr()
    ];
    List<String> valueList = [
      'Economy',
      'PremiumEconomy',
      'Business',
      'FirstClass'
    ];
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(4, (index) {
          return RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              cabinClassNamelist[index],
              style:
                  AppStyles.styleInterMedium18(context).copyWith(fontSize: 16),
            ),
            value: valueList[index],
            groupValue: cabinClass,
            onChanged: (value) {
              setState(() {
                cabinClass = value;
                widget.onCabinChanged(cabinClassNamelist[index]);
                widget.onValueChanged(cabinClass!);
              });
            },
          );
        }));
  }
}
