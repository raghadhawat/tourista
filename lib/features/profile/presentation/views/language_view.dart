import 'package:flutter/material.dart';
import 'widgets/language_view_body.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    double scereenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LanguageViewBody(scereenWidth: scereenWidth),
        ),
      ),
    );
  }
}
