import 'package:tutorial_1/NumberTrivia/Domain/Entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  // ignore: use_super_parameters
  const NumberTriviaModel({required int number, required String text})
    : super(number: number, text: text);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(number: (json['number'] as num).toInt(), text: json['text']);
  }

  Map<String, dynamic> toJson () {
    return {
      'text' : text,
      'number' : number
    };
  }
}
