import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/modules/home/domain/usecases/fetch_characters.dart';
import 'package:marvel_app/modules/home/presentation/bloc/home_event.dart';
import 'package:marvel_app/modules/home/presentation/bloc/home_state.dart';

import 'package:marvel_app/shared/utils/usecase.dart';

part 'home_bloc.g.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchCharacters? fetchCharacters;

  HomeBloc(this.fetchCharacters) : super(HomeStateLoading());

  @override
  void onEvent(HomeEvent event) async {
    on<HomeEventFetchList>((event, emit) async {
      emit(HomeStateLoading());

      final response = await fetchCharacters!(NoParams());

      response.fold(
        (failure) => emit(HomeStateFailure(message: failure.message)),
        (success) => emit(HomeStateSuccess(characters: success)),
      );
    });
    super.onEvent(event);
  }
}
