import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/sent_google_user_info_cubit/sent_google_user_info_cubit.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/sign_in_with_google_cubit/sign_in_with_google_cubit.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/continue_with_google_button.dart';
import 'package:tourista/features/profile/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class ActiveSigninWithGoogleButton extends StatelessWidget {
  const ActiveSigninWithGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SentgoogleUserinfoCubit, SentGoogleUserInfoState>(
      listener: (context, state) async {
        if (state is SentGoogleUserInfoSuccess) {
          Hive.box(kTokenBox).put(kTokenRef, state.signInWithGoogleModel.token);
          print(Hive.box(kTokenBox)
              .put(kTokenRef, state.signInWithGoogleModel.token));
          await BlocProvider.of<GetUserInfoCubit>(context).getUserInfo();
        } else if (state is SentGoogleUserInfoFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      child: BlocBuilder<SentgoogleUserinfoCubit, SentGoogleUserInfoState>(
        builder: (context, state) {
          if (state is SentGoogleUserInfoLoading) {
            return const SpinKitThreeBounce(
              color: kGreenColor,
              size: 40,
            );
          } else {
            return BlocListener<SignInWithGoogleCubit, SignInWithGoogleState>(
              listener: (context, state) {
                if (state is SignInWithGoogleSuccess) {
                  BlocProvider.of<SentgoogleUserinfoCubit>(context)
                      .sentSignInWithGoogleUserInfo(
                          nama: state.googleUser.displayName!,
                          email: state.googleUser.email,
                          googleUserId: state.googleUser.id);
                } else if (state is SignInWithGoogleFailure) {
                  customSnackBar(context, state.errMessage);
                } else {
                  const LoadingWidget();
                }
              },
              child: GoogleButton(
                onTap: () {
                  BlocProvider.of<SignInWithGoogleCubit>(context)
                      .signInWithGoogle();
                },
              ),
            );
          }
        },
      ),
    );
  }
}
