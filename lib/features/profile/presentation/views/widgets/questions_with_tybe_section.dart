import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/profile/presentation/manager/all_questions_with_tybe_cubit/all_questions_with_tybe_cubit.dart';
import 'package:tourista/features/profile/presentation/views/widgets/question_answer_widget.dart';

class QuestionsWithTybeSection extends StatelessWidget {
  const QuestionsWithTybeSection({
    super.key,
    required this.screenWidth,
    required this.tybe,
  });

  final double screenWidth;
  final String tybe;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AllQuestionsWithTybeCubit>(context)
        .getAllQuestionsWithtybe(tybe: tybe);

    return BlocBuilder<AllQuestionsWithTybeCubit, AllQuestionsWithTybeState>(
      builder: (context, state) {
        if (state is AllQuestionsWithTybeSuccess) {
          return Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView.builder(
                itemCount:
                    state.allQuestionsWithTybeModel.quastionAndAnswers!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: QuestionAnswerWidget(
                      question: state.allQuestionsWithTybeModel
                          .quastionAndAnswers![index].quastion!,
                      answer: state.allQuestionsWithTybeModel
                          .quastionAndAnswers![index].answer!,
                      screedWidth: screenWidth,
                    ),
                  );
                },
              ));
        } else if (state is AllQuestionsWithTybeFailure) {
          return Align(
            alignment: Alignment.center,
            child: Text(
              state.errMessage,
              style: AppStyles.styleSourceSemiBold22(context),
            ),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
