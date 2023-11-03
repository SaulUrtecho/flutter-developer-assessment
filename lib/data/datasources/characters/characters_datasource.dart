import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:thrones_app/core/failures.dart';
import 'package:thrones_app/data/models/character_model.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';

// CharactersDataSource Contract
abstract class CharactersDataSource {
  Future<Either<Failures, List<CharacterEntity>>> getCharacters();
}

/*With this class the data is received from the API,
and then the data is validated and converted to a CharacterModel and
then immediately to a CharacterEntity in order to use this type in the app */
class CharactersRemoteDataSource implements CharactersDataSource {
  final Client client;

  CharactersRemoteDataSource(this.client);
  @override
  Future<Either<Failures, List<CharacterEntity>>> getCharacters() async {
    try {
      final response = await client.get(Uri.parse('https://thronesapi.com/api/v2/Characters'));

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        return Right(result.map((i) => CharacterModel.fromJson(i)).map((i) => CharacterEntity.fromModel(i)).toList());
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
