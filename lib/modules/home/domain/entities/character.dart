import 'package:marvel_app/modules/home/domain/entities/comics.dart';
import 'package:marvel_app/modules/home/domain/entities/thumbnail.dart';

class Character {
  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final String? resourceURI;
  final Thumbnail? thumbnail;
  final Comics? comics;

  Character({
    this.id,
    this.name = '',
    this.description = '',
    this.modified = '',
    this.resourceURI = '',
    this.thumbnail,
    this.comics,
  });
}
