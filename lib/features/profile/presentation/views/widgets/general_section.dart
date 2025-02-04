import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/profile/presentation/views/widgets/wallet_button.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/styles.dart';
import 'password_and_security_button.dart';
import 'personal_details_button.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hive.box(kUserInfoBox).get(kUserPhoneRef) != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.General.tr(),
                style: AppStyles.styleInterBold20(context),
              ),
              const Gap(15),
              const PersonalDetailsButton(),
              const Gap(25),
              const PasswordAndSecurityButton(),
              const Gap(25),
              const WalletButton(),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.General.tr(),
                style: AppStyles.styleInterBold20(context),
              ),
              const Gap(15),
              const PersonalDetailsButton(),
              const Gap(25),
              const WalletButton(),
            ],
          );
  }
}
