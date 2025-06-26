import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:tutorial_1/Core/Error/failures.dart';
import 'package:tutorial_1/Core/UseCases/usecase.dart';
import 'package:tutorial_1/NumberTrivia/Domain/Entities/number_trivia.dart';
import 'package:tutorial_1/NumberTrivia/Domain/Repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia({required this.repository});

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;
  const Params({required this.number});
  
  @override
  List<Object?> get props => [number];
}
