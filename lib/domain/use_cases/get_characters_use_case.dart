import 'package:either_dart/either.dart';
import 'package:thrones_app/core/failures.dart';
import 'package:thrones_app/core/use_cases.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';
import 'package:thrones_app/domain/repositories/characters/characters_repository_contract.dart';

// the use case contract for GetData is implemented
// it needs a CharactersRepository contract as a dependency
class GetCharactersUseCase implements GetDataUseCase {
  final CharactersRepositoryContract _characterRepositoryContract;

  GetCharactersUseCase(this._characterRepositoryContract);
  @override
  Future<Either<Failures, List<CharacterEntity>>> run() async {
    return await _characterRepositoryContract.getCharacters();
  }
}
