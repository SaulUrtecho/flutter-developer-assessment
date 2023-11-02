import 'package:get_it/get_it.dart';
import 'package:http/http.dart' show Client;
import 'package:thrones_app/data/datasources/characters_remote_datasource.dart';
import 'package:thrones_app/data/repositories/character_repository_impl.dart';
import 'package:thrones_app/domain/repositories/characters_repository_contract.dart';
import 'package:thrones_app/domain/use_cases/get_characters_use_case.dart';
import 'package:thrones_app/ui/bloc/fetch_characters_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // External services
  getIt.registerLazySingleton<Client>(() => Client());

  // Datasources
  getIt.registerLazySingleton<CharactersRemoteDataSource>(() => CharactersRemoteDataSourceImpl(getIt<Client>()));

  // Repositories
  getIt.registerLazySingleton<CharactersRepositoryContract>(
      () => CharactersRepositoryImpl(getIt<CharactersRemoteDataSource>()));

  // Use cases
  getIt.registerFactory<GetCharactersUseCase>(() => GetCharactersUseCase(getIt<CharactersRepositoryContract>()));

  // Blocs
  getIt.registerFactory<FetchCharactersBloc>(() => FetchCharactersBloc(getIt<GetCharactersUseCase>()));
}
