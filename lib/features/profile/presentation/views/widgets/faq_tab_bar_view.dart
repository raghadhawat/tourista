import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/views/widgets/questions_with_tybe_section.dart';
import 'all_questions_section.dart';
import 'custom_questions_tybe_tab_bar.dart';

class FaqTabBarView extends StatefulWidget {
  const FaqTabBarView({
    super.key,
    required this.tabController2,
  });

  final TabController tabController2;

  @override
  State<FaqTabBarView> createState() => _FaqTabBarViewState();
}

class _FaqTabBarViewState extends State<FaqTabBarView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Text(
            LocaleKeys.Frequently_asked_questions.tr(),
            style: AppStyles.styleInterSemiBold20(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: CustomQuestionsTybeTabBar(widget: widget),
        ),
        Expanded(
          child: TabBarView(
            controller: widget.tabController2,
            children: [
              AllQuestionsSection(screenWidth: screenWidth),
              QuestionsWithTybeSection(
                  screenWidth: screenWidth, tybe: 'Flights'),
              QuestionsWithTybeSection(screenWidth: screenWidth, tybe: 'Stays'),
              QuestionsWithTybeSection(
                  screenWidth: screenWidth, tybe: 'Activities'),
            ],
          ),
        ),
      ],
    );
  }
}
