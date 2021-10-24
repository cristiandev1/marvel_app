import 'package:dartz/dartz.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/modules/home/data/models/character_model.dart';
import 'package:marvel_app/modules/home/domain/entities/character.dart';
import 'package:marvel_app/shared/client/client_http.dart';
import 'package:marvel_app/shared/models/failure.dart';
import 'package:marvel_app/shared/utils/config.dart';

part 'fetch_characters_datasource.g.dart';

abstract class FetchCharactersDatasource {
  Future<Either<Failure, List<Character>>> getCharacters();
}

@Injectable()
class FetchCharactersDatasourceImpl implements FetchCharactersDatasource {
  final IHttpClient httpClient;

  FetchCharactersDatasourceImpl(this.httpClient);
  @override
  Future<Either<Failure, List<Character>>> getCharacters() async {
    List<Character> listCharacter = [];
    try {
      final response = await httpClient.get(
          url:
              "http://gateway.marvel.com/v1/public/characters?ts=${Config.timestamp}&apikey=${Config.apiKey}&hash=${Config.hash}");

      if (response['code'] == 200) {
        for (var character in response['data']['results']) {
          listCharacter.add(CharacterModel.fromJson(character));
        }
        return Right(listCharacter);
      } else {
        return Left(Failure(message: 'Erro ao buscar informacoes'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
