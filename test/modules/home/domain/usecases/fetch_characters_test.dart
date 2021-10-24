import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/modules/home/domain/repositories/fetch_characters_repository.dart';
import 'package:marvel_app/modules/home/domain/usecases/fetch_characters.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchCharactersRepository extends Mock
    implements FetchCharactersRepository {}

void main() {
  final repository = MockFetchCharactersRepository();
  final fetchCharacters = FetchCharacters(repository);
  group('Fetch Characters Usecase Test', () {
    test('FetchCharacters - success', () async {});
  });
}
