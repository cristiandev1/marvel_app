import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/modules/home/data/models/comics_model.dart';

void main() {
  test('ComicsModel test', () async {
    Map<String, dynamic> _json = {};
    _json = {
      "available": 1,
      "collectionURI": "collectionURI",
      "items": [
        {"resourceURI": "resourceURI", "name": "name"}
      ]
    };
    final model = ComicsModel.fromJson(_json);
    expect(model.available, 1);
    expect(model.collectionURI, "collectionURI");
    expect(model.items!.first.resourceURI, "resourceURI");
    expect(model.items!.first.name, "name");
  });
}
