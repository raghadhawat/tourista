import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/features/profile/presentation/views/widgets/reviews_view_body.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

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
          LocaleKeys.Reviews.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ReviewsViewBody(
            scereenWidth: scereenWidth,
          ),
        ),
      ),
    );
  }
}
