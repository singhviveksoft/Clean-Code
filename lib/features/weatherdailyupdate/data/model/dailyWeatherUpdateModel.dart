import 'package:clean_code_architecture/features/weatherdailyupdate/domain/entities/dailyweatherupdate.dart';

class NumberModel extends NumberEntities {
  String text;
  int number;
  bool found;
  String trivia;

  NumberModel({
    required this.text,
    required this.number,
    required this.found,
    required this.trivia,
  }) : super(
          text: text,
          number: number,
        );

  factory NumberModel.fromJson(dynamic json) {
    return NumberModel(
        text: json['text'],
        number: (json['number'] as num).toInt(),
        found: json['found'],
        trivia: json['type']);
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'number': number, 'found': found, 'trivia': trivia};
  }
}
