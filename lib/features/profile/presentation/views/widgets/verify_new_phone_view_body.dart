import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/enter_verify_code_section.dart';
import 'package:tourista/features/profile/presentation/manager/update_phone_cubit/update_phone_cubit.dart';
import 'package:tourista/features/profile/presentation/manager/verify_new_phone_cubit/verify_new_phone_cubit.dart';

import '../../../../auth/sign_in_and_up/presentation/views/widgets/custom_text_button.dart';
import '../../../../../core/utlis/functions/show_dialog.dart';

class VerifyNewPhoneViewBody extends StatefulWidget {
  const VerifyNewPhoneViewBody({
    super.key,
    required this.phoneNumber,
  });
  final String phoneNumber;

  @override
  State<VerifyNewPhoneViewBody> createState() => _VerifySignUpBodyState();
}

class _VerifySignUpBodyState extends State<VerifyNewPhoneViewBody> {
  late TextEditingController controller;

  String codeNumber = '';

  @override
  void initState() {
    listenNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenheight = MediaQuery.sizeOf(context).height;
    bool isLoading = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EnterVerifyCodeSection(
          screenWidth: screenWidth,
          screenheight: screenheight,
          controller: controller,
        ),
        Gap(screenheight * .04),
        Text(
          LocaleKeys.DidntRecieveTheCode.tr(),
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.grey),
        ),
        Gap(screenheight * .01),
        CustomTextButton(
          data: LocaleKeys.ResendPassword.tr(),
          style: AppStyles.styleInterBold16(context)
              .copyWith(color: kPrimaryColor),
          onPressed: () {
            BlocProvider.of<UpdatePhoneCubit>(context)
                .updatePhone(phone: widget.phoneNumber);
          },
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Gap(screenheight * .25),
        BlocConsumer<VerifyNewPhoneCubit, VerifyNewPhoneState>(
          listener: (context, state) {
            if (state is VerifyNewPhoneSuccess) {
              isLoading = false;
              CustomShowDialog().showConfirmationDialog(
                  context: context,
                  titleText: LocaleKeys.congratulations.tr(),
                  contentText:
                      LocaleKeys.phone_has_been_modified_successfully.tr(),
                  onConfirmPressed: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                  },
                  cancel: false);
              Hive.box(kUserInfoBox).put(kUserPhoneRef, widget.phoneNumber);
            } else if (state is VerifyNewPhoneFailure) {
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
                    size: 40,
                  )
                : CustomButton(
                    onTap: () {
                      BlocProvider.of<VerifyNewPhoneCubit>(context)
                          .verifyNewPhone(
                              code: codeNumber, phone: widget.phoneNumber);
                    },
                    text: LocaleKeys.verify.tr(),
                    width: screenWidth * .80,
                    borderRadius: 10,
                    height: screenheight * .08,
                    style: AppStyles.styleInterBold20(context)
                        .copyWith(color: Colors.white),
                    color: kPrimaryColor);
          },
        ),
      ],
    );
  }

  void listenNumber() {
    controller = TextEditingController();
    controller.addListener(() {
      codeNumber = controller.text;
      setState(() {});
    });
  }
}
