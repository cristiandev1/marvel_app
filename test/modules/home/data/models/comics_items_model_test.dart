import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/modules/home/data/models/comics_items_model.dart';

void main() {
  test('ComicsItemsModel test', () async {
    Map<String, dynamic> _json = {};
    _json = {"resourceURI": "resourceURI", "name": "name"};
    final model = ComicsItemsModel.fromJson(_json);

    expect(model.resourceURI, "resourceURI");
    expect(model.name, "name");
  });
}
