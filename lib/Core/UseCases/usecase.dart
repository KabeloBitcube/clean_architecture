import 'package:dartz/dartz.dart';
import 'package:tutorial_1/Core/Error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}