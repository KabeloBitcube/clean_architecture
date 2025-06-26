import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tutorial_1/Core/Error/failures.dart';
import 'package:tutorial_1/Core/UseCases/usecase.dart';
import 'package:tutorial_1/NumberTrivia/Domain/Entities/number_trivia.dart';
import 'package:tutorial_1/NumberTrivia/Domain/Repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}