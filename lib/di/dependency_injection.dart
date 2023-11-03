import 'package:get_it/get_it.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thrones_app/data/datasources/authentication/authentication_data_source.dart';
import 'package:thrones_app/data/datasources/characters/characters_datasource.dart';
import 'package:thrones_app/data/repositories/authentication/authentication_repository.dart';
import 'package:thrones_app/data/repositories/characters/character_repository.dart';
import 'package:thrones_app/domain/repositories/authentication/authentication_repository_contract.dart';
import 'package:thrones_app/domain/repositories/characters/characters_repository_contract.dart';
import 'package:thrones_app/domain/use_cases/get_characters_use_case.dart';
import 'package:thrones_app/ui/blocs/authentication/authentication_bloc.dart';
import 'package:thrones_app/ui/screens/characters/bloc/fetch_characters_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // External services
  getIt.registerLazySingleton<Client>(() => Client());

  // Datasources
  getIt.registerLazySingleton<CharactersDataSource>(() => CharactersRemoteDataSource(getIt<Client>()));
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AuthenticationDataSource>(() => AuthenticationLocalDataSource(prefs));

  // Repositories
  getIt.registerLazySingleton<CharactersRepositoryContract>(() => CharactersRepository(getIt<CharactersDataSource>()));
  getIt.registerLazySingleton<AuthenticationRepositoryContract>(
      () => AuthenticationRepository(getIt<AuthenticationDataSource>()));

  // Use cases
  getIt.registerFactory<GetCharactersUseCase>(() => GetCharactersUseCase(getIt<CharactersRepositoryContract>()));

  // Blocs
  getIt.registerFactory<FetchCharactersBloc>(() => FetchCharactersBloc(getIt<GetCharactersUseCase>()));
  getIt.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(getIt<AuthenticationRepositoryContract>()));
}
