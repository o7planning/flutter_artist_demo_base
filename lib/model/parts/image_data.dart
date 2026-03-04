part of '../model.dart';

class ImageData {
  int id;
  String ext;
  int size;
  int width;
  int height;

  ImageData({
    required this.id,
    required this.ext,
    required this.size,
    required this.width,
    required this.height,
  });

  static ImageData fromMap(Map<String, dynamic> map) {
    return ImageData(
      id: map["id"],
      ext: map["ext"],
      size: map["size"],
      width: map["width"],
      height: map["height"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "ext": ext,
      "size": size,
      "width": width,
      "height": height,
    };
  }
}
