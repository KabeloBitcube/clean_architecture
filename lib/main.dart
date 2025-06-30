import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_1/NumberTrivia/Presentation/Bloc/number_trivia_bloc.dart';
import 'package:tutorial_1/NumberTrivia/Presentation/Pages/number_trivia_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.serviceLocator<NumberTriviaBloc>(),
      child: MaterialApp(
        title: 'Number Trivia',
        theme: ThemeData(
          primaryColor: Colors.green.shade800,
        ),
        home: NumberTriviaPage(),
      ),
    );
  }
}
