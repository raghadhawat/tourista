import 'quastion_and_answer.dart';

class AllQuestionsModel {
  List<QuastionAndAnswer>? quastionAndAnswers;

  AllQuestionsModel({this.quastionAndAnswers});

  factory AllQuestionsModel.fromJson(Map<String, dynamic> json) {
    return AllQuestionsModel(
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
