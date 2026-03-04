import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:image_picker/image_picker.dart';

class Uint8ListFileData {
  String fileName;
  Uint8List fileData;

  Uint8ListFileData({required this.fileName, required this.fileData});

  // To DIO MultipartFile.
  MultipartFile toMultipartFile() {
    return MultipartFile.fromBytes(fileData, filename: fileName);
  }

  static Future<Uint8ListFileData> fromXFile(XFile xFile) async {
    Uint8List fileData;
    String fileName;
    // Mobile, Desktop
    if (!kIsWeb) {
      File imageFile = File(xFile.path);
      fileName = imageFile.path;
      fileData = await imageFile.readAsBytes();
    }
    // Web
    else {
      fileData = await xFile.readAsBytes();
      fileName = xFile.name;
    }
    return Uint8ListFileData(fileName: fileName, fileData: fileData);
  }
}
