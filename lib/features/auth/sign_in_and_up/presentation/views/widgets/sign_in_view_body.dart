// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/custom_auth_button.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/earth_logo_with_text.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/forget_passord_button.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/or_divider.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/password_text_field.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/phone_number_text_field.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/custom_text_button.dart';
import 'package:tourista/features/profile/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

import 'active_sign_uin_with_google_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;

  @override
  void initState() {
    listenController();
    super.initState();
  }

  String phoneNumber = '';
  String password = '';
  bool showPass = true;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    bool isLoading = false;
    return BlocListener<GetUserInfoCubit, GetUserInfoState>(
      listener: (context, state) {
        if (state is GetUserInfoSuccess) {
          isLoading = false;
          print('the token: ${Hive.box(kTokenBox).get(kTokenRef)}'.toString());

          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);

          Hive.box(kUserInfoBox)
              .put(kUserPointsRef, state.userInfoModel.user!.points);
          if (kDebugMode) {
            print('points: ${Hive.box(kUserInfoBox).get(kUserPointsRef)}');
          }
          Hive.box(kUserInfoBox)
              .put(kUserWalletRef, state.userInfoModel.user!.wallet);
          if (kDebugMode) {
            print('wallet: ${Hive.box(kUserInfoBox).get(kUserWalletRef)}');
          }
          Hive.box(kUserInfoBox)
              .put(kUserNameRef, state.userInfoModel.user!.name);
          if (kDebugMode) {
            print('username: ${Hive.box(kUserInfoBox).get(kUserNameRef)}');
          }
          Hive.box(kUserInfoBox)
              .put(kUserPhoneRef, state.userInfoModel.user?.normalUser?.phone);
          if (kDebugMode) {
            print('phoneNumber: ${Hive.box(kUserInfoBox).get(kUserPhoneRef)}');
          }
          state.userInfoModel.user?.googleUser != null
              ? Hive.box(kUserInfoBox).put(
                  kUserEmailRef, state.userInfoModel.user!.googleUser!.email)
              : Hive.box(kUserInfoBox).put(kUserEmailRef, null);
          if (kDebugMode) {
            print('email: ${Hive.box(kUserInfoBox).get(kUserEmailRef)}');
          }
        } else if (state is GetUserInfoFailure) {
          customSnackBar(context, state.errMessage);
          isLoading = false;
        } else {
          isLoading = true;
        }
      },
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Column(
              children: [
                Gap(screenheight * 0.05),
                EartLogoWithText(
                  data: LocaleKeys.sign_in_to_your_account.tr(),
                ),
                Gap(screenheight * 0.07),
                PhoneNumberTextField(
                  controller: phoneNumberController,
                ),
                Gap(screenheight * 0.03),
                PasswordTextField(
                  controller: passwordController,
                  showPass: showPass,
                  onTap: () {
                    showPass = !showPass;
                    setState(() {});
                  },
                ),
                Gap(screenheight * .005),
                const ForgetPasswordButton(),
                Gap(screenheight * 0.03),
                BlocConsumer<SignInCubit, SignInState>(
                  listener: (context, state) async {
                    if (state is SignInSuccess) {
                      isLoading = false;
                      await BlocProvider.of<GetUserInfoCubit>(context)
                          .getUserInfo();
                    } else if (state is SignInFailure) {
                      isLoading = false;

                      customSnackBar(context, state.errMessage);
                    } else {
                      isLoading = true;
                    }
                  },
                  builder: (context, state) {
                    return isLoading == true
                        ? const SpinKitThreeBounce(
                            color: kGreenColor,
                            size: 30,
                          )
                        : CustomAuthButton(
                            text: LocaleKeys.sign_in.tr(),
                            width: screenWidth * .80,
                            onTap: () {
                              BlocProvider.of<SignInCubit>(context).signIn(
                                phone: phoneNumber,
                                password: password,
                              );
                            },
                          );
                  },
                ),
                Gap(screenheight * .07),
                const ORDivider(),
                Gap(screenheight * .03),
                const ActiveSigninWithGoogleButton(),
                Gap(screenheight * .03),
                CustomTextButton(
                  data: LocaleKeys.dont_have_an_account.tr(),
                  textButtondata: LocaleKeys.sign_up.tr(),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kSignUp);
                  },
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void listenController() {
    phoneNumberController = TextEditingController();
    phoneNumberController.addListener(() {
      phoneNumber = phoneNumberController.text;
      setState(() {});
    });

    passwordController = TextEditingController();
    passwordController.addListener(() {
      password = passwordController.text;
      setState(() {});
    });
  }
}
