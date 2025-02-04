import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/verification_code_text_field.dart';

class EnterVerifyCodeSection extends StatelessWidget {
  const EnterVerifyCodeSection({
    super.key,
    required this.screenWidth,
    required this.controller,
    required this.screenheight,
  });

  final double screenWidth, screenheight;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(screenheight * .05),
        Text(
          LocaleKeys.verify.tr(),
          style: AppStyles.styleInterBold25(context).copyWith(fontSize: 28),
        ),
        Gap(screenheight * .02),
        Text(
          LocaleKeys.pleaseEnterTheCode.tr(),
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.grey),
        ),
        Gap(screenheight * .08),
        VeriificationCodeTextField(
            controller: controller, screenWidth: screenWidth),
      ],
    );
  }
}
