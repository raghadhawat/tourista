import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/functions/verify_app_bar.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/verify_sign_up_body.dart';

class VerifySignUpView extends StatelessWidget {
  const VerifySignUpView({super.key, required this.signUpInfo});
  final Map<String, dynamic> signUpInfo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: verifyAppBar(context, appBarText: 'Confirm Code'),
        body: VerifySignUpBody(
          userid: signUpInfo['userId'],
          userName: signUpInfo['userName'],
          phoneNumber: signUpInfo['phoneNumber'],
          password: signUpInfo['password'],
          confirmPassword: signUpInfo['confirmPassword'],
        ),
      ),
    );
  }
}
