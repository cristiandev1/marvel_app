import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/modules/home/data/models/character_model.dart';
import 'package:marvel_app/modules/home/domain/entities/character.dart';
import 'package:marvel_app/modules/home/domain/repositories/fetch_characters_repository.dart';
import 'package:marvel_app/modules/home/domain/usecases/fetch_characters.dart';
import 'package:marvel_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:marvel_app/modules/home/presentation/bloc/home_event.dart';
import 'package:marvel_app/modules/home/presentation/bloc/home_state.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchCharactersRepository extends Mock
    implements FetchCharactersRepository {}

void main() {
  final repository = MockFetchCharactersRepository();
  final fetchCharacters = FetchCharacters(repository);
  final bloc = HomeBloc(fetchCharacters);

  test('FetchCharacters - success', () async {
    when(() => repository.getCharacters())
        .thenAnswer((_) async => Right(<Character>[]));
    bloc.add(HomeEventFetchList());
    expectLater(
      bloc.state,
      emitsInOrder(
        [
          HomeStateLoading(),
          HomeStateSuccess(characters: <Character>[]),
        ],
      ),
    );
    //TODO: Ler documentacao dps para ver problema na hora de testar o evento emitido.
  });
}
