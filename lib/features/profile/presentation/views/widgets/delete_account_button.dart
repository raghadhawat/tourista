import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:tourista/core/utlis/app_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/functions/custom_snack_bar.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../manager/delete_account_cubit/delete_account_cubit.dart';
import '../../../../../core/utlis/functions/show_dialog.dart';
import 'profile_text_button.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccess) {
          Hive.box(kTokenBox).delete(kTokenRef);

          if (kDebugMode) {
            print(Hive.box(kTokenBox).get(kTokenRef));
          }
          GoRouter.of(context).pushReplacement(AppRouter.kSignIN);
        } else if (state is DeleteAccountFailure) {
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
        onPressed: () async {
          CustomShowDialog().showConfirmationDialog(
            titleText: LocaleKeys.are_you_sure.tr(),
            contentText: LocaleKeys.you_will_lose_all_of_your_data.tr(),
            context: context,
            onConfirmPressed: () async {
              await BlocProvider.of<DeleteAccountCubit>(context)
                  .deleteAccount();
            },
            cancel: true,
            deleteProfile: true,
          );
        },
        width: 23,
        height: 23,
        data: LocaleKeys.Delete_Account.tr(),
        assetName: Assets.imagesIconsDeleteAccountIcon,
      ),
    );
  }
}
