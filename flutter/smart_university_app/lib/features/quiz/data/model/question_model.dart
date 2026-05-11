class QuestionModel {
  final int id;
  final String text;
  final List<OptionModel> options;

  QuestionModel({required this.id, required this.text, required this.options});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: int.parse(json['id'].toString()),
      text: json['text'],
      options:
          (json['options'] as List?)
              ?.map((e) => OptionModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class OptionModel {
  final int id;
  final String text;
  final bool isCorrect;

  OptionModel({required this.id, required this.text, required this.isCorrect});

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      text: json['text'],
      isCorrect: json['isCorrect'] == true || json['isCorrect'] == 1,
    );
  }
}
