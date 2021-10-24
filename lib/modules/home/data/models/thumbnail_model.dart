import 'package:marvel_app/modules/home/domain/entities/thumbnail.dart';

class ThumbnailModel extends Thumbnail {
  ThumbnailModel({
    String? path,
    String? extension,
  }) : super(
          path: path,
          extension: extension,
        );

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) {
    return ThumbnailModel(
      path: json['path'],
      extension: json['extension'],
    );
  }
}
