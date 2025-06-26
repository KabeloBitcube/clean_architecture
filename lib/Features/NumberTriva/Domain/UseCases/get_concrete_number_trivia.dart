import 'package:dartz/dartz.dart';
import 'package:tutorial_1/Core/Error/failures.dart';
import 'package:tutorial_1/Features/NumberTriva/Domain/Entities/number_trivia.dart';
import 'package:tutorial_1/Features/NumberTriva/Domain/Repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia({
    required this.repository,
  });

  Future<Either<Failure, NumberTrivia>> execute ({
    required int number
  }) async {
    return repository.getConcreteNumberTrivia(number);
  }
}
