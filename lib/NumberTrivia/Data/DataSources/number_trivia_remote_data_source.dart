import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tutorial_1/Core/Error/exceptions.dart';
import 'package:tutorial_1/NumberTrivia/Data/Models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({required this.client});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    final response = await client.get(
      Uri.parse('http://numbersapi.com/$number'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200){
       return NumberTriviaModel.fromJson(json.decode(response.body));
    }
    else {
      throw ServerException();
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async{
    final response = await client.get(
      Uri.parse('http://numbersapi.com/random'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200){
       return NumberTriviaModel.fromJson(json.decode(response.body));
    }
    else {
      throw ServerException();
    }
  }
}
