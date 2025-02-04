import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/profile/presentation/manager/all_questions_cubit/all_questions_cubit.dart';
import 'package:tourista/features/profile/presentation/views/widgets/question_answer_widget.dart';

class AllQuestionsSection extends StatelessWidget {
  const AllQuestionsSection({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AllQuestionsCubit>(context).getAllQuestions();

    return BlocBuilder<AllQuestionsCubit, AllQuestionsState>(
      builder: (context, state) {
        if (state is AllQuestionsSuccess) {
          return ListView.builder(
            itemCount: state.allQuestionsModel.quastionAndAnswers!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: QuestionAnswerWidget(
                  question: state
                      .allQuestionsModel.quastionAndAnswers![index].quastion!,
                  answer: state
                      .allQuestionsModel.quastionAndAnswers![index].answer!,
                  screedWidth: screenWidth,
                ),
              );
            },
          );
        } else if (state is AllQuestionsFailure) {
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
