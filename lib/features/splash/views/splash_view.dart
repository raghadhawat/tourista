import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/splash/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kPrimaryColor, body: SplashViewBody());
  }
}
