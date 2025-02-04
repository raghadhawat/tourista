import 'package:flutter/material.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ForgetPasswordBody(),
      ),
    );
  }
}
