import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/modules/home/domain/entities/character.dart';
import 'package:marvel_app/modules/home/domain/repositories/fetch_characters_repository.dart';
import 'package:marvel_app/shared/models/failure.dart';
import 'package:marvel_app/shared/utils/usecase.dart';

part 'fetch_characters.g.dart';

@Injectable()
class FetchCharacters implements UseCase<List<Character>, NoParams> {
  final FetchCharactersRepository repository;

  FetchCharacters(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(NoParams params) async {
    return await repository.getCharacters();
  }
}
