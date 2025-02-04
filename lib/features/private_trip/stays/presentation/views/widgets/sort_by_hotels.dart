import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';

class SortByHotels extends StatefulWidget {
  final void Function(String? value)? onItemSelected;

  const SortByHotels({Key? key, this.onItemSelected}) : super(key: key);

  @override
  _SortByHotelsState createState() => _SortByHotelsState();
}

class _SortByHotelsState extends State<SortByHotels> {
  List<String> readyTripsNamelist = [
    LocaleKeys.General.tr(),
    'Rating',
    LocaleKeys.pricehightolow.tr(),
    LocaleKeys.pricelowtohigh.tr(),
  ];
  List<String?> valueList = [
    null,
    'Rating',
    'Price High to Low',
    'Price Low to High'
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<PopupMenuEntry<String?>>.generate(
        valueList.length,
        (index) => PopupMenuItem<String?>(
          value: valueList[index],
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              readyTripsNamelist[index],
              style:
                  AppStyles.styleInterMedium18(context).copyWith(fontSize: 16),
            ),
            value: valueList[index],
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              widget.onItemSelected?.call(value);
            },
          ),
        ),
      ),
    );
  }
}
