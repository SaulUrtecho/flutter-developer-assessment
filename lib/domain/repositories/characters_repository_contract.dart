import 'package:either_dart/either.dart';
import 'package:thrones_app/core/failures.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';

abstract class CharactersRepositoryContract {
  Future<Either<Failures, List<CharacterEntity>>> getCharacters();
}
