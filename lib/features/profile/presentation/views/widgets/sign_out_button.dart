import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:tourista/core/utlis/functions/show_dialog.dart';
import '../../../../../constants.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/app_router.dart';
import '../../../../../core/utlis/functions/custom_snack_bar.dart';
import '../../../../../core/utlis/styles.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../auth/sign_in_and_up/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'profile_text_button.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          Hive.box(kTokenBox).delete(kTokenRef);
          GoRouter.of(context).pushReplacement(AppRouter.kSignIN);
        } else if (state is SignOutFailure) {
          Navigator.of(context).popUntil((route) => route.isFirst);
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
      child: ProfileTextButton(
        onPressed: () {
          CustomShowDialog().showConfirmationDialog(
            titleText: LocaleKeys.Confirmation.tr(),
            contentText: LocaleKeys.Are_you_sure_you_want_to_sign_out.tr(),
            context: context,
            onConfirmPressed: () {
              BlocProvider.of<SignOutCubit>(context).signOut();
            },
            cancel: true,
          );
        },
        width: 23,
        height: 23,
        data: LocaleKeys.Sign_out.tr(),
        assetName: Assets.imagesIconsSignOutIcon,
        textStyle: AppStyles.styleInterRegular18(context).copyWith(
          color: Colors.red,
        ),
        iconColor: Colors.red,
      ),
    );
  }
}
