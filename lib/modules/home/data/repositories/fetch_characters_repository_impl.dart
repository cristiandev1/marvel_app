import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/modules/home/data/datasources/fetch_characters_datasource.dart';
import 'package:marvel_app/modules/home/domain/entities/character.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel_app/modules/home/domain/repositories/fetch_characters_repository.dart';
import 'package:marvel_app/shared/models/failure.dart';

part 'fetch_characters_repository_impl.g.dart';

@Injectable()
class FetchCharactersRepositoryImpl implements FetchCharactersRepository {
  final FetchCharactersDatasource datasource;

  FetchCharactersRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<Character>>> getCharacters() async {
    try {
      final result = await datasource.getCharacters();
      return result.fold(
        (failure) => Left(Failure(message: failure.message)),
        (success) => Right(success),
      );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
