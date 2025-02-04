import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_text_form_field.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/show_password_row.dart';

class CreateANewPasswordColumn extends StatefulWidget {
  const CreateANewPasswordColumn(
      {super.key,
      required this.screenWidth,
      required this.controller,
      required this.controller2,
      required this.screenheight});
  final double screenWidth, screenheight;
  final TextEditingController controller;
  final TextEditingController controller2;

  @override
  State<CreateANewPasswordColumn> createState() =>
      _CreateANewPasswordColumnState();
}

class _CreateANewPasswordColumnState extends State<CreateANewPasswordColumn> {
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * .065),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.CreateANewPassword.tr(),
            style: AppStyles.styleInterBold20(context),
          ),
          Gap(widget.screenheight * .04),
          CustomTextFormField(
              showPass: !showPass,
              icon: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(Assets.imagesIconsLockBlack),
              ),
              hintText: LocaleKeys.NewPassword.tr(),
              color: Colors.black,
              controller: widget.controller),
          Gap(widget.screenheight * .02),
          CustomTextFormField(
              showPass: !showPass,
              icon: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(Assets.imagesIconsFillLockBlack),
              ),
              hintText: LocaleKeys.confirm_password.tr(),
              color: Colors.black,
              controller: widget.controller2),
          Gap(widget.screenheight * .01),
          ShowPasswordRow(
            shoPass: showPass,
            onChanged: (value) {
              showPass = !showPass;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
