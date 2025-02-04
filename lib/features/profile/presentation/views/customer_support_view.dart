import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../core/translations/locale_keys.g.dart';
import 'widgets/customer_support_view_body.dart';

class CustomerSupportView extends StatelessWidget {
  const CustomerSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    double scereenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 5,
        iconTheme: const IconThemeData(color: Colors.white, size: 25),
        backgroundColor: kPrimaryColor,
        title: Text(
          LocaleKeys.Customer_Support.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: CusrtomerSupportViewBody(
          scereenWidth: scereenWidth,
        ),
      ),
    );
  }
}
