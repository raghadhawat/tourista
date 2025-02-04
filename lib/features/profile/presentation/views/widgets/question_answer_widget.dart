import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class QuestionAnswerWidget extends StatefulWidget {
  final String question;
  final String answer;

  const QuestionAnswerWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.screedWidth,
  });
  final double screedWidth;
  @override
  QuestionAnswerWidgetState createState() => QuestionAnswerWidgetState();
}

class QuestionAnswerWidgetState extends State<QuestionAnswerWidget> {
  bool isAnswerVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isAnswerVisible ? Colors.green.withOpacity(.1) : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isAnswerVisible = !isAnswerVisible;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: widget.screedWidth * .7,
                      child: Text(
                        widget.question,
                        style: AppStyles.styleInterSemiBold18(context),
                      ),
                    ),
                    Icon(
                      isAnswerVisible
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            if (isAnswerVisible)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        width: widget.screedWidth * .8,
                        child: Divider(
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                    Text(
                      widget.answer,
                      style: AppStyles.styleInterRegular18(context),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
