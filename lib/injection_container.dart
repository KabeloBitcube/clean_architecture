import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_1/Core/Network/network_info.dart';
import 'package:tutorial_1/Core/Util/input_converter.dart';
import 'package:tutorial_1/NumberTrivia/Data/DataSources/number_trivia_local_data_source.dart';
import 'package:tutorial_1/NumberTrivia/Data/DataSources/number_trivia_remote_data_source.dart';
import 'package:tutorial_1/NumberTrivia/Data/Repositories/number_trivia_repository_impl.dart';
import 'package:tutorial_1/NumberTrivia/Domain/Repositories/number_trivia_repository.dart';
import 'package:tutorial_1/NumberTrivia/Domain/UseCases/get_concrete_number_trivia.dart';
import 'package:tutorial_1/NumberTrivia/Domain/UseCases/get_random_number_trivia.dart';
import 'package:tutorial_1/NumberTrivia/Presentation/bloc/number_trivia_bloc.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Number Trivia
  serviceLocator.registerFactory(
    () =>
        NumberTriviaBloc(serviceLocator(), serviceLocator(), serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => GetConcreteNumberTrivia(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetRandomNumberTrivia(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(client: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(sharedPreferences: serviceLocator()),
  );

  // Core
  serviceLocator.registerLazySingleton(() => InputConverter());
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: serviceLocator()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker);
}
