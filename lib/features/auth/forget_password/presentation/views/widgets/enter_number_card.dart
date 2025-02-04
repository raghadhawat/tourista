import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/auth/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/enter_number_column.dart';

class EnterNumberCard extends StatefulWidget {
  const EnterNumberCard({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<EnterNumberCard> createState() => _EnterNumberCardState();
}

class _EnterNumberCardState extends State<EnterNumberCard> {
  late TextEditingController textEditingController;
  String number = '';
  @override
  void initState() {
    listenNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.1),
              blurRadius: 4,
              offset: const Offset(0, -6),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          right: 16,
        ),
        child: Row(
          children: [
            EnterNumberColumn(
              textEditingController: textEditingController,
            ),
            const Spacer(),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                isLoading = checkStates(state, isLoading, context, number);
              },
              builder: (context, state) {
                return isLoading == true
                    ? const LoadingWidget()
                    : CustomButton(
                        onTap: () {
                          BlocProvider.of<ForgetPasswordCubit>(context)
                              .forgetPasswordCubitFun(phoneNumber: number);
                        },
                        text: LocaleKeys.continueButton.tr(),
                        width: widget.screenWidth * .25,
                        borderRadius: 8,
                        height: 46,
                        style: AppStyles.styleSourceBold20(context)
                            .copyWith(color: Colors.white),
                        color: kPrimaryColor);
              },
            ),
          ],
        ),
      ),
    );
  }

  bool checkStates(ForgetPasswordState state, bool isLoading,
      BuildContext context, String number) {
    if (state is ForgetPasswordSuccess) {
      isLoading = false;
      GoRouter.of(context).push(AppRouter.kVerifyView, extra: {
        'userId': state.forgetPasswordModel.userId,
        'phoneNumber': number
      });
    } else if (state is ForgetPasswordFailure) {
      isLoading = false;
      customSnackBar(context, state.errMessage);
    } else if (state is ForgetPasswordLoading) {
      isLoading = true;
    }
    return isLoading;
  }

  void listenNumber() {
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      number = textEditingController.text;
      setState(() {});
    });
  }
}
