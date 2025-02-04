import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/features/profile/presentation/views/widgets/profile_text_button.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/app_router.dart';

class CustomerSupportButton extends StatelessWidget {
  const CustomerSupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileTextButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kCustomerSupportView);
      },
      width: 27,
      height: 27,
      data: LocaleKeys.Customer_Support.tr(),
      assetName: Assets.imagesIconsCustomerSupportIcon,
    );
  }
}
