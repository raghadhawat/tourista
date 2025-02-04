import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/profile/presentation/manager/add_review_cubit/add_review_cubit.dart';

import '../../manager/all_reviews_cubit/all_reviews_cubit.dart';

class AddReviewButton extends StatelessWidget {
  const AddReviewButton({
    super.key,
    required this.communtController,
    required this.rating,
    required this.comment,
    required this.scereenWidth,
  });
  final double scereenWidth;

  final TextEditingController communtController;
  final double rating;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddReviewCubit, AddReviewState>(
      listener: (context, state) {
        if (state is AddReviewSuccess) {
          BlocProvider.of<AllReviewsCubit>(context).getAllReviews();

          communtController.clear();
          customSuccessSnackBar(context, 'Your Review Added Successfully');
        } else if (state is AddReviewFailure) {
          if (kDebugMode) {
            print(rating);
          }
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return state is AddReviewLoading
            ? const SpinKitThreeBounce(
                color: kGreenColor,
                size: 30,
              )
            : CustomButton(
                onTap: () {
                  BlocProvider.of<AddReviewCubit>(context)
                      .addReview(review: rating.toString(), comment: comment);
                },
                text: 'Submit Review',
                width: scereenWidth,
                borderRadius: 10,
                height: 40,
                style: AppStyles.styleSourceRegular23(context)
                    .copyWith(color: Colors.white),
                color: kPrimaryColor);
      },
    );
  }
}
