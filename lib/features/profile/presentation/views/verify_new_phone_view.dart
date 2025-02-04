import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/functions/verify_app_bar.dart';
import 'package:tourista/features/profile/presentation/views/widgets/verify_new_phone_view_body.dart';

class VerifyNewPhoneView extends StatelessWidget {
  const VerifyNewPhoneView({super.key, required this.updatePhoneinfo});
  final Map<String, dynamic> updatePhoneinfo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: verifyAppBar(context, appBarText: 'Confirm Code'),
          body: VerifyNewPhoneViewBody(
              phoneNumber: updatePhoneinfo['phoneNumber'])),
    );
  }
}
