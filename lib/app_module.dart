import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/modules/home/home_module.dart';
import 'package:marvel_app/shared/client/client_http.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HttpClientService(Dio())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
