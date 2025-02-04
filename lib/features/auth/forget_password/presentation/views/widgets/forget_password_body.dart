import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/enter_number_card.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.forget_password.tr(),
                style: AppStyles.styleInterBold25(context),
              ),
              Gap(screenheight * .1),
              SvgPicture.asset(Assets.imagesForegetPassword),
              Gap(screenheight * .08),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Text(
                  LocaleKeys.DontWorry.tr(),
                  style: AppStyles.styleInterMedium18(context),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(screenheight * .03),
              EnterNumberCard(
                screenWidth: screenWidth,
              )
            ],
          ),
        ),
      ),
    );
  }
}
