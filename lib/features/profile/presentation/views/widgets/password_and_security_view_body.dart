import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/custom_auth_button.dart';
import 'package:tourista/features/profile/presentation/manager/change_password_cubit/change_password_cubit.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/functions/custom_success_snack_bar.dart';
import '../../../../../core/utlis/styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../auth/forget_password/presentation/views/widgets/show_password_row.dart';

class PasswordAndSecurityViewBody extends StatefulWidget {
  const PasswordAndSecurityViewBody({super.key});

  @override
  State<PasswordAndSecurityViewBody> createState() =>
      _PasswordAndSecurityViewBodyState();
}

class _PasswordAndSecurityViewBodyState
    extends State<PasswordAndSecurityViewBody> {
  late TextEditingController controller;
  late TextEditingController controller1;
  late TextEditingController controller2;

  String password = '';
  String currentPassword = '';
  String confirmPassword = '';
  bool showPass = false;

  @override
  void initState() {
    listenController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double scereenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.Change_password.tr(),
                style: AppStyles.styleInterBold25(context)
                    .copyWith(color: Colors.black),
              ),
              Gap(screenheight * .02),
              Text(
                '${LocaleKeys.password_must_include.tr()}(!\$#@).',
                style: AppStyles.styleInterRegular16(context)
                    .copyWith(color: Colors.black),
              ),
              Gap(screenheight * .02),
              SizedBox(
                height: 55,
                child: CustomTextFormField(
                    outlinedborder: true,
                    focusedBordercolor: Colors.black,
                    showPass: !showPass,
                    hintText: LocaleKeys.Current_password.tr(),
                    color: Colors.black,
                    controller: controller),
              ),
              Gap(screenheight * .02),
              SizedBox(
                height: 55,
                child: CustomTextFormField(
                    outlinedborder: true,
                    focusedBordercolor: Colors.black,
                    showPass: !showPass,
                    hintText: LocaleKeys.NewPassword.tr(),
                    color: Colors.black,
                    controller: controller1),
              ),
              Gap(screenheight * .02),
              SizedBox(
                height: 55,
                child: CustomTextFormField(
                    outlinedborder: true,
                    focusedBordercolor: Colors.black,
                    showPass: !showPass,
                    hintText: LocaleKeys.confirm_password.tr(),
                    color: Colors.black,
                    controller: controller2),
              ),
              Gap(screenheight * .01),
              ShowPasswordRow(
                horizontal: 0,
                color: Colors.black,
                shoPass: showPass,
                onChanged: (value) {
                  showPass = !showPass;
                  setState(() {});
                },
              ),
              Gap(screenheight * .09),
            ],
          ),
          BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
            listener: (context, state) {
              if (state is ChangePasswordSuccess) {
                customSuccessSnackBar(context, LocaleKeys.password_update.tr());
              } else if (state is ChangePasswordFailure) {
                customSnackBar(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return state is ChangePasswordLoading
                  ? const SpinKitThreeBounce(
                      color: kGreenColor,
                      size: 30,
                    )
                  : CustomAuthButton(
                      text: LocaleKeys.confirm.tr(),
                      width: scereenWidth,
                      onTap: () {
                        BlocProvider.of<ChangePasswordCubit>(context)
                            .changePassword(
                                password: currentPassword,
                                newPassword: password,
                                confirnPassword: confirmPassword);
                      },
                    );
            },
          ),
        ],
      ),
    );
  }

  void listenController() {
    controller = TextEditingController();
    controller.addListener(() {
      currentPassword = controller.text;
      setState(() {});
    });
    controller1 = TextEditingController();
    controller1.addListener(() {
      password = controller1.text;
      setState(() {});
    });

    controller2 = TextEditingController();
    controller2.addListener(() {
      confirmPassword = controller2.text;
      setState(() {});
    });
  }
}
