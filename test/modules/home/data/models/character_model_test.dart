import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/modules/home/data/models/character_model.dart';

void main() {
  test('CharacterModel test', () async {
    Map<String, dynamic> _json = {};
    _json = {
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
    };

    final model = CharacterModel.fromJson(_json);
    expect(model.id, 1);
    expect(model.name, "name");
    expect(model.description, "description");
    expect(model.modified, "modified");
    expect(model.resourceURI, "resourceURI");
    expect(model.thumbnail!.path, "path");
    expect(model.thumbnail!.extension, "extension");
    expect(model.comics!.available, 1);
    expect(model.comics!.collectionURI, "collectionURI");
    expect(model.comics!.items!.first.resourceURI, "resourceURI");
    expect(model.comics!.items!.first.name, "name");
  });
}
