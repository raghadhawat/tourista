import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/profile/presentation/manager/change_language_cubit/change_language_cubit.dart';
import 'package:tourista/features/profile/presentation/views/widgets/select_language_button.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/styles.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({
    super.key,
    required this.scereenWidth,
  });

  final double scereenWidth;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeLanguageCubit, ChangeLanguageState>(
      listener: (context, state) {
        if (state is ChangeLanguageSuccess) {
          GoRouter.of(context).pop();
          customSuccessSnackBar(context, 'Language changed successfully');
        } else if (state is ChangeLanguageFailure) {
          customSnackBar(context, state.errMessage);
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const LoadingWidget();
            },
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Localizations.localeOf(context).languageCode == 'en'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Gap(scereenWidth * .15),
          Center(
            child: Text(
              LocaleKeys.Choose_Your_Language.tr(),
              style: AppStyles.styleInterBold27(context),
            ),
          ),
          const Gap(20),
          Center(
            child: Text(
              LocaleKeys.Select_Your_Preferred_language_to_use.tr(),
              style: AppStyles.styleInterRegular18(context),
            ),
          ),
          const Gap(50),
          SelectLanguageButton(
            data: 'English',
            iconAssetName: Assets.imagesIconsUnitedKingdomIcon,
            onPressed: () async {
              await BlocProvider.of<ChangeLanguageCubit>(context)
                  .changeLanguage(language: 'en');
              context.setLocale(const Locale('en'));

              //  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
            },
          ),
          const Gap(20),
          SelectLanguageButton(
            data: 'العربية',
            iconAssetName: Assets.imagesIconsSyriaIcon,
            onPressed: () async {
              await BlocProvider.of<ChangeLanguageCubit>(context)
                  .changeLanguage(language: 'ar');
              context.setLocale(const Locale('ar'));

              //   GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
            },
          ),
        ],
      ),
    );
  }
}
