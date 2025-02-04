import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/widgets/custom_text_form_field.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/show_pass_button.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.onTap,
    this.showPass = false,
  });
  final TextEditingController controller;
  final bool showPass;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      showPass: showPass,
      suffix: ShowPasswordButton(onTap: onTap, showPass: showPass),
      controller: controller,
      color: kPrimaryColor,
      icon: Padding(
        padding: const EdgeInsets.all(11),
        child: SvgPicture.asset(Assets.imagesIconsOutlineLock),
      ),
      hintText: LocaleKeys.password.tr(),
    );
  }
}
