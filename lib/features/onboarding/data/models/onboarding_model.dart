import 'package:flutter/material.dart';

class OnboardingModel {
  final bool padding;
  final Color color;
  final String desc;
  final String imageUrl;
  final int pageIndex;

  const OnboardingModel({
    required this.padding,
    required this.color,
    required this.desc,
    required this.imageUrl,
    required this.pageIndex,
  });
}
