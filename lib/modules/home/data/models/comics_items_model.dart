import 'package:marvel_app/modules/home/domain/entities/comics_items.dart';

class ComicsItemsModel extends ComicsItems {
  ComicsItemsModel({
    String? resourceURI,
    String? name,
  }) : super(
          resourceURI: resourceURI,
          name: name,
        );

  factory ComicsItemsModel.fromJson(Map<String, dynamic> json) {
    return ComicsItemsModel(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }
}
