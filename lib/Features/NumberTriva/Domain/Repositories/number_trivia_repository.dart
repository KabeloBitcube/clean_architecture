import 'package:tutorial_1/Core/Error/failures.dart';
import 'package:tutorial_1/Features/NumberTriva/Domain/Entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
