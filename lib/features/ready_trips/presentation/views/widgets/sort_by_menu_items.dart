import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';

class SortByMenuItems extends StatefulWidget {
  final void Function(String? value)? onItemSelected;

  const SortByMenuItems({Key? key, this.onItemSelected}) : super(key: key);

  @override
  _SortByMenuItemsState createState() => _SortByMenuItemsState();
}

class _SortByMenuItemsState extends State<SortByMenuItems> {
  List<String> readyTripsNamelist = [
    LocaleKeys.General.tr(),
    LocaleKeys.newest.tr(),
    LocaleKeys.closet.tr(),
    LocaleKeys.pricehightolow.tr(),
    LocaleKeys.pricelowtohigh.tr(),
  ];
  List<String?> valueList = [
    null,
    'Newest',
    'Closet',
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
