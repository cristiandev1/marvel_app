import 'package:dartz/dartz.dart';
import 'package:marvel_app/modules/home/domain/entities/character.dart';
import 'package:marvel_app/shared/models/failure.dart';

abstract class FetchCharactersRepository {
  Future<Either<Failure, List<Character>>> getCharacters();
}
