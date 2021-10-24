import 'package:marvel_app/modules/home/data/models/comics_model.dart';
import 'package:marvel_app/modules/home/data/models/thumbnail_model.dart';
import 'package:marvel_app/modules/home/domain/entities/character.dart';
import 'package:marvel_app/modules/home/domain/entities/comics.dart';
import 'package:marvel_app/modules/home/domain/entities/thumbnail.dart';

class CharacterModel extends Character {
  CharacterModel({
    int? id,
    String? name,
    String? description,
    String? modified,
    String? resourceURI,
    Thumbnail? thumbnail,
    Comics? comics,
  }) : super(
          id: id,
          name: name,
          description: description,
          modified: modified,
          resourceURI: resourceURI,
          thumbnail: thumbnail,
          comics: comics,
        );

  CharacterModel copyWith({
    int? id,
    String? name,
    String? description,
    String? modified,
    String? resourceURI,
    Thumbnail? thumbnail,
    Comics? comics,
  }) {
    return CharacterModel(
      id: id,
      name: name,
      description: description,
      modified: modified,
      resourceURI: resourceURI,
      thumbnail: thumbnail,
      comics: comics,
    );
  }

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      resourceURI: json['resourceURI'],
      thumbnail: ThumbnailModel.fromJson(json['thumbnail']),
      comics: ComicsModel.fromJson(json['comics']),
    );
  }
}
