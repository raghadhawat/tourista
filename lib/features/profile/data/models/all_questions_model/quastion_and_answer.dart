class QuastionAndAnswer {
  int? id;
  String? quastion;
  String? answer;
  String? type;

  QuastionAndAnswer({this.id, this.quastion, this.answer, this.type});

  factory QuastionAndAnswer.fromJson(Map<String, dynamic> json) {
    return QuastionAndAnswer(
      id: json['id'] as int?,
      quastion: json['quastion'] as String?,
      answer: json['answer'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'quastion': quastion,
        'answer': answer,
        'type': type,
      };
}
