import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/views/widgets/add_review_button.dart';
import 'package:tourista/features/profile/presentation/views/widgets/heart_rating_bar.dart';

class RatingColumn extends StatefulWidget {
  const RatingColumn({
    super.key,
    required this.scereenWidth,
  });

  final double scereenWidth;

  @override
  State<RatingColumn> createState() => _RatingColumnState();
}

class _RatingColumnState extends State<RatingColumn> {
  late TextEditingController communtController;

  bool isclose = false;
  String comment = '';
  double rating = 0.0;

  @override
  void initState() {
    super.initState();
    listenController();
  }

  @override
  void dispose() {
    super.dispose();
    communtController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isclose == false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    isclose = true;

                    setState(() {});
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Share Your Experience',
                  style: AppStyles.styleInterBold25(context),
                ),
              ),
              const Gap(10),
              Text(
                'How Would you rate us?',
                style: AppStyles.styleInterRegular18(context),
              ),
              const Gap(20),
              HeartRatingBar(
                initialRating: rating,
                onRatingUpdate: (updatedRating) {
                  setState(() {
                    rating = updatedRating;
                  });
                },
              ),
              const Gap(15),
              Container(
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.transparent)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: TextField(
                    controller: communtController,
                    maxLines: null,
                    expands: true,
                    decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      hintText: 'Write Your experience with us!',
                      labelStyle: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              AddReviewButton(
                communtController: communtController,
                rating: rating,
                comment: comment,
                scereenWidth: widget.scereenWidth,
              ),
              const Gap(15),
            ],
          )
        : const SizedBox(
            height: 0,
            width: 0,
          );
  }

  void listenController() {
    communtController = TextEditingController();
    communtController.addListener(() {
      comment = communtController.text;
    });
  }
}
