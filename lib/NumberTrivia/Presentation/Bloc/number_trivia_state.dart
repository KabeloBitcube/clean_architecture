// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'number_trivia_bloc.dart';

sealed class NumberTriviaState extends Equatable {
  const NumberTriviaState();
  
  @override
  List<Object> get props => [];
}

class NumberTriviaInitial extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;
  
  const Loaded({
    required this.trivia,
  }) : super();
}

class Error extends NumberTriviaState {
  final String message;
  
  const Error({
    required this.message,
  }) : super();
}

