import 'quastion_and_answer.dart';

class AllQuestionsWithTybeModel {
  List<QuastionAndAnswer>? quastionAndAnswers;

  AllQuestionsWithTybeModel({this.quastionAndAnswers});

  factory AllQuestionsWithTybeModel.fromJson(Map<String, dynamic> json) {
    return AllQuestionsWithTybeModel(
      quastionAndAnswers: (json['quastionAndAnswers'] as List<dynamic>?)
          ?.map((e) => QuastionAndAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'quastionAndAnswers':
            quastionAndAnswers?.map((e) => e.toJson()).toList(),
      };
}
