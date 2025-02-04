import 'package:flutter/material.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/sign_up_view_body.dart';

class SignUPView extends StatelessWidget {
  const SignUPView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: SignUpViewBody()));
  }
}
