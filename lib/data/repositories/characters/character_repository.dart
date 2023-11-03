import 'package:either_dart/either.dart';
import 'package:thrones_app/core/failures.dart';
import 'package:thrones_app/data/datasources/characters/characters_datasource.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';
import 'package:thrones_app/domain/repositories/characters/characters_repository_contract.dart';

// The contract is implemented for get all characters
// it needs a CharacterDataSource dependency
class CharactersRepository implements CharactersRepositoryContract {
  final CharactersDataSource charactersDataSource;

  CharactersRepository(this.charactersDataSource);
  @override
  Future<Either<Failures, List<CharacterEntity>>> getCharacters() {
    return charactersDataSource.getCharacters();
  }
}
