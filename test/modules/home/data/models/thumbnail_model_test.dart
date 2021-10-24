import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/modules/home/data/models/thumbnail_model.dart';

void main() {
  test('ThumbnailModel test', () async {
    Map<String, dynamic> _json = {};
    _json = {
      "path": "path",
      "extension": "extension",
    };

    final model = ThumbnailModel.fromJson(_json);
    expect(model.path, "path");
    expect(model.extension, "extension");
  });
}
