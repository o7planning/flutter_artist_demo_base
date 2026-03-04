part of '../model.dart';

class UploadData {
  String fileName;
  Uint8List data;

  UploadData({required this.fileName, required this.data});

  String getFileExtension(String defaultExt) {
    int idx = fileName.lastIndexOf('.');
    if (idx == -1) {
      return defaultExt;
    }
    String ext = fileName.substring(idx + 1);
    return ext.isEmpty ? defaultExt : ext;
  }
}
