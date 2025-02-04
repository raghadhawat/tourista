import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'widgets/personal_details_view_body.dart';

class PersonalDetailsView extends StatelessWidget {
  const PersonalDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double scereenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kHomeView);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 25),
        backgroundColor: kPrimaryColor,
        title: Text(
          LocaleKeys.personal_details.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PersonalDetailsViewBody(
            scereenWidth: scereenWidth,
          ),
        ),
      ),
    );
  }
}
