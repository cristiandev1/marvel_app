import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/modules/home/data/datasources/fetch_characters_datasource.dart';
import 'package:marvel_app/shared/client/client_http.dart';
import 'package:marvel_app/shared/utils/config.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements IHttpClient {}

void main() {
  final httpClient = MockDio();
  final datasource = FetchCharactersDatasourceImpl(httpClient);

  test('FetchCharactersDatasource', () async {
    Map<String, dynamic>? _mockResults = {};
    _mockResults = {
      'code': 200,
      'data': {
        'results': [
          {
            "id": 1,
            "name": "name",
            "description": "description",
            "modified": "modified",
            "resourceURI": "resourceURI",
            "thumbnail": {"path": "path", "extension": "extension"},
            "comics": {
              "available": 1,
              "collectionURI": "collectionURI",
              "items": [
                {"resourceURI": "resourceURI", "name": "name"}
              ]
            }
          }
        ],
      }
    };

    when(() => httpClient.get()).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(
            path:
                "http://gateway.marvel.com/v1/public/characters?ts=${Config.timestamp}&apikey=${Config.apiKey}&hash=${Config.hash}"),
        data: _mockResults,
      ),
    );

    final response = datasource.getCharacters();
    expect(response, completes);
  });
}
