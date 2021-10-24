import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/modules/home/data/datasources/fetch_characters_datasource.dart';
import 'package:marvel_app/modules/home/data/repositories/fetch_characters_repository_impl.dart';
import 'package:marvel_app/modules/home/domain/usecases/fetch_characters.dart';
import 'package:marvel_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:marvel_app/modules/home/presentation/character_detail/character_detail_page.dart';
import 'package:marvel_app/modules/home/presentation/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        //Bloc
        $HomeBloc,

        //Usecase
        $FetchCharacters,

        //Repositories
        $FetchCharactersRepositoryImpl,

        //Datasource
        $FetchCharactersDatasourceImpl,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
        ChildRoute(
          '/character_detail',
          child: (context, args) => CharacterDetailPage(
            character: args.data,
          ),
        ),
      ];
}
