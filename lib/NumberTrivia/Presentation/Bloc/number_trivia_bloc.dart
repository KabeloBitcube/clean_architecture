// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tutorial_1/Core/Util/input_converter.dart';
import 'package:tutorial_1/NumberTrivia/Domain/Entities/number_trivia.dart';
import 'package:tutorial_1/NumberTrivia/Domain/UseCases/get_concrete_number_trivia.dart';
import 'package:tutorial_1/NumberTrivia/Domain/UseCases/get_random_number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

const String SERVER_FAILURE_MESSAGE = "Server Failure";
const String CACHE_FAILURE_MESSAGE = "Cache Failure";
const String INVALID_INPUT_FAILURE_MESSAGE = "Invalid Input - The number must be a positive integer or zero";

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc(
    this.getConcreteNumberTrivia,
    this.getRandomNumberTrivia,
    this.inputConverter,
  ) : super(NumberTriviaInitial()) {
    on<NumberTriviaEvent>((event, emit) {
      if (event is GetTriviaForConcreteNumber) {
        final inputEither = inputConverter.stringToUnsignedInteger(
          event.numberString,
        );

        emit(
          inputEither.fold((failure) => Error(message: INVALID_INPUT_FAILURE_MESSAGE), (integer) => throw UnimplementedError()),
        );
      }
    });
  }
}
