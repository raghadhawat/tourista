import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/widgets/custom_text_form_field.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    super.key,
    required this.textEditingController,
  });
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: textEditingController,
      color: kPrimaryColor,
      icon: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          Assets.imagesIconsPerson,
        ),
      ),
      hintText: LocaleKeys.user_name.tr(),
    );
  }
}
