import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'client_http.g.dart';

abstract class IHttpClient {
  Future get({String url});
}

@Injectable()
class HttpClientService implements IHttpClient {
  final Dio dio;

  HttpClientService(this.dio);

  @override
  Future get({String url = ''}) async {
    final response = await dio.get(url);
    return response.data;
  }
}
