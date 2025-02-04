import 'package:flutter/material.dart';
import '../../../../../core/utlis/styles.dart';
import 'display_all_user_reviews.dart';
import 'rating_column.dart';

class ReviewsViewBody extends StatefulWidget {
  const ReviewsViewBody({
    super.key,
    required this.scereenWidth,
  });
  final double scereenWidth;

  @override
  State<ReviewsViewBody> createState() => _ReviewsViewBodyState();
}

class _ReviewsViewBodyState extends State<ReviewsViewBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: RatingColumn(
            scereenWidth: screenWidth,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Most Recent:',
              style: AppStyles.styleInterMedium19(context),
            ),
          ),
        ),
        DisplayAllUserReviews(
          screenWidth: screenWidth,
        )
      ],
    );
  }
}
