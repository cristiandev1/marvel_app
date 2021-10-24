import 'package:marvel_app/modules/home/domain/entities/comics_items.dart';

class Comics {
  int? available;
  String? collectionURI;
  List<ComicsItems>? items;

  Comics({
    this.available,
    this.collectionURI,
    this.items,
  });
}
