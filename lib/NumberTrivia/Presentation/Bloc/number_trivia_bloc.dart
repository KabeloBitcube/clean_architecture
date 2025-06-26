import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tutorial_1/NumberTrivia/Domain/Entities/number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  NumberTriviaBloc() : super(NumberTriviaInitial()) {
    on<NumberTriviaEvent>((event, emit) {
    });
  }
}
