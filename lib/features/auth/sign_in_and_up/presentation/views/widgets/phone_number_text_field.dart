import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/widgets/custom_text_form_field.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      color: kPrimaryColor,
      keyboardType: TextInputType.number,
      icon: Padding(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(Assets.imagesIconsPhone),
      ),
      hintText: LocaleKeys.phone_number.tr(),
    );
  }
}
