import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

import '../../../../../constants.dart';

class SelectLanguageButton extends StatelessWidget {
  const SelectLanguageButton({
    super.key,
    required this.data,
    required this.iconAssetName,
    required this.onPressed,
  });
  final String data;
  final String iconAssetName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return kPrimaryColor.withOpacity(0.5);
              }
              return null;
            },
          ),
          alignment: Localizations.localeOf(context).languageCode == 'en'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          minimumSize: MaterialStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width, 50),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        onPressed: onPressed,
        icon:
            SizedBox(width: 25, height: 25, child: Image.asset(iconAssetName)),
        label: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            data,
            style: AppStyles.styleInterSemiBold18(context),
          ),
        ));
  }
}
