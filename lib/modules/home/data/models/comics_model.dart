import 'package:marvel_app/modules/home/data/models/comics_items_model.dart';
import 'package:marvel_app/modules/home/domain/entities/comics.dart';
import 'package:marvel_app/modules/home/domain/entities/comics_items.dart';

class ComicsModel extends Comics {
  ComicsModel({
    int? available,
    String? collectionURI,
    List<ComicsItems>? items,
  }) : super(
          available: available,
          collectionURI: collectionURI,
          items: items,
        );

  factory ComicsModel.fromJson(Map<String, dynamic> json) {
    List<ComicsItems> _items = [];
    if (json['items'] != null) {
      for (var item in json['items']) {
        _items.add(ComicsItemsModel.fromJson(item));
      }
    }

    return ComicsModel(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: _items,
    );
  }
}
