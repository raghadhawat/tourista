import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/features/profile/presentation/views/widgets/password_and_security_view_body.dart';

import '../../../../../constants.dart';
import '../../../../../core/translations/locale_keys.g.dart';

class PasswordAndSecurityView extends StatelessWidget {
  const PasswordAndSecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 5,
        iconTheme: const IconThemeData(color: Colors.white, size: 25),
        backgroundColor: kPrimaryColor,
        title: Text(
          LocaleKeys.password_and_security.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: PasswordAndSecurityViewBody(),
        ),
      ),
    );
  }
}
