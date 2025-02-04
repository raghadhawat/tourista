import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/auth/forget_password/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/create_a_new_password.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/reset_succefully_widget.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/verify_button_and_range.dart';
import 'package:tourista/features/profile/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key, required this.userId});
  final int userId;
  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  late TextEditingController controller;
  late TextEditingController controller1;
  String password = '';
  String confirmPassword = '';
  @override
  void initState() {
    listenController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenheight = MediaQuery.sizeOf(context).height;
    bool isLoading = false;
    bool isOkLoading = false;
    return BlocListener<GetUserInfoCubit, GetUserInfoState>(
      listener: (context, state) {
        if (state is GetUserInfoSuccess) {
          Navigator.of(context).popUntil((route) => route.isFirst);

          GoRouter.of(context).push(AppRouter.kHomeView);

          Hive.box(kUserInfoBox)
              .put(kUserPointsRef, state.userInfoModel.user!.points);
          if (kDebugMode) {
            print('points: ${Hive.box(kUserInfoBox).get(kUserPointsRef)}');
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
          Navigator.of(context).pop();
          customSnackBar(context, state.errMessage);
        } else {
          isOkLoading = true;
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          CreateANewPasswordColumn(
            screenheight: screenheight,
            screenWidth: screenWidth,
            controller: controller,
            controller2: controller1,
          ),
          const Spacer(
            flex: 13,
          ),
          BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              isLoading = checkStates(state, isLoading, context, isOkLoading);
            },
            builder: (context, state) {
              return isLoading == true
                  ? const LoadingWidget()
                  : VerifyRangeAndButton(
                      onTap: () {
                        BlocProvider.of<ResetPasswordCubit>(context)
                            .resetPasswordCubitFun(
                                password: password,
                                confirmPassword: confirmPassword,
                                userId: widget.userId);
                      },
                      screenheight: screenheight,
                      screenWidth: screenWidth,
                      numberOfSteps: "2 of 2",
                      start: 0,
                      end: 1);
            },
          ),
          const Spacer()
        ],
      ),
    );
  }

  bool checkStates(ResetPasswordState state, bool isLoading,
      BuildContext context, bool isOkLoading) {
    if (state is ResetPasswordSuccess) {
      isLoading = false;
      showSuccessDialog(context, isOkLoading);

      Hive.box(kUserInfoBox).deleteAll(
          [kUserNameRef, kUserPhoneRef, kUserEmailRef, kUserPointsRef]);
    } else if (state is ResetPasswordFailure) {
      isLoading = false;
      customSnackBar(context, state.errMessage);
    } else if (state is ResetPasswordLoading) {
      isLoading = true;
    }
    return isLoading;
  }

  void listenController() {
    controller = TextEditingController();
    controller.addListener(() {
      password = controller.text;
      setState(() {});
    });
    controller1 = TextEditingController();
    controller1.addListener(() {
      confirmPassword = controller1.text;
      setState(() {});
    });
  }
}

Future<dynamic> showSuccessDialog(BuildContext context, bool isOkLoading) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: SvgPicture.asset(Assets.imagesSuccessReset),
          content: const IntrinsicHeight(
            child: ResetSuccessfullyWidget(),
          ),
          actions: [
            Center(
              child: isOkLoading == true
                  ? const LoadingWidget()
                  : CustomButton(
                      onTap: () {
                        BlocProvider.of<GetUserInfoCubit>(context)
                            .getUserInfo();
                      },
                      text: LocaleKeys.ok.tr(),
                      width: MediaQuery.sizeOf(context).width * .2,
                      borderRadius: 8,
                      height: 40,
                      style: AppStyles.styleInterBold20(context)
                          .copyWith(color: Colors.white),
                      color: kPrimaryColor),
            )
          ],
        );
      });
}
