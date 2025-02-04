import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField(
      {super.key, this.onChanged, this.onPressed, this.onSubmitted});
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: LocaleKeys.search_an_activity.tr(),
        suffixIcon: IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              Assets.imagesIconsSearch,
              width: 22,
            )),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.black.withOpacity(0.4), width: 2),
    );
  }
}
