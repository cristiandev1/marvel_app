import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/modules/home/domain/entities/character.dart';
import 'package:marvel_app/modules/home/domain/repositories/fetch_characters_repository.dart';
import 'package:marvel_app/shared/models/failure.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchCharactersRepository extends Mock
    implements FetchCharactersRepository {}

void main() {
  final repository = MockFetchCharactersRepository();

  group('FetchCharactersRepository Test', () {
    test('FetchCharactersRepository - success', () async {
      when(() => repository.getCharacters())
          .thenAnswer((_) async => Right(<Character>[]));

      final response = await repository.getCharacters();
      expect(response.getOrElse(() => []), isInstanceOf<List<Character>>());
    });

    test('FetchCharactersRepository - failure', () async {
      when(() => repository.getCharacters())
          .thenAnswer((_) async => Left(Failure(message: 'erro')));

      final response = await repository.getCharacters();
      response.fold((l) => expect(l, isInstanceOf<Failure>()), (r) => null);
    });
  });
}
