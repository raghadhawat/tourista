import 'package:flutter/material.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignInViewBody(),
      ),
    );
  }
}
