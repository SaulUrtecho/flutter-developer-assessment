import 'package:either_dart/either.dart';
import 'package:thrones_app/core/failures.dart';
import 'package:thrones_app/data/datasources/characters_remote_datasource.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';
import 'package:thrones_app/domain/repositories/characters_repository_contract.dart';

class CharactersRepositoryImpl implements CharactersRepositoryContract {
  final CharactersRemoteDataSource charactersRemoteDataSource;

  CharactersRepositoryImpl(this.charactersRemoteDataSource);
  @override
  Future<Either<Failures, List<CharacterEntity>>> getCharacters() {
    return charactersRemoteDataSource.getCharacters();
  }
}
