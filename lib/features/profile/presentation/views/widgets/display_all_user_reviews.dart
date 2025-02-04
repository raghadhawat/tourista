import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/profile/presentation/manager/all_reviews_cubit/all_reviews_cubit.dart';
import 'package:tourista/features/profile/presentation/views/widgets/user_review_post.dart';

class DisplayAllUserReviews extends StatelessWidget {
  const DisplayAllUserReviews({
    super.key,
    required this.screenWidth,
  });
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllReviewsCubit, AllReviewsState>(
      builder: (context, state) {
        if (state is AllReviewsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return UserReviewPost(
                  screenWidth: screenWidth,
                  circleAvatarName:
                      '${state.allReviewsModel.reviews![index].user!.name}'
                          .substring(0, 2)
                          .toUpperCase(),
                  userName:
                      state.allReviewsModel.reviews![index].user!.name ?? '',
                  starsCount: state.allReviewsModel.reviews![index].review ?? 5,
                  userComment:
                      '${state.allReviewsModel.reviews![index].comment}'
                          .toLowerCase(),
                  userCommentCreatedDate:
                      '${state.allReviewsModel.reviews![index].createdAt}'
                          .substring(0, 11),
                );
              },
              childCount: state.allReviewsModel.reviewsCount,
            ),
          );
        } else if (state is AllReviewsFailure) {
          return SliverFillRemaining(
            child: Center(
              child: Text(state.errMessage),
            ),
          );
        } else {
          return const SliverFillRemaining(
            child: LoadingWidget(),
          );
        }
      },
    );
  }
}
