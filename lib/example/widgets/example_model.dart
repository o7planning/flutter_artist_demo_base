import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

enum ShelfObjectType {
  block,
  scalar,
  activity,
  mix;

  Color? get backgroundColor {
    switch (this) {
      case ShelfObjectType.block:
        return null;
      case ShelfObjectType.scalar:
        return Colors.cyan[50];
      case ShelfObjectType.activity:
        return Colors.green[50];
      case ShelfObjectType.mix:
        return Colors.yellow[50];
    }
  }

  String get description {
    switch (this) {
      case ShelfObjectType.block:
        return "Shelf with Blocks";
      case ShelfObjectType.scalar:
        return "Shelf with Scalars";
      case ShelfObjectType.activity:
        return "Shelf with Activity(s)";
      case ShelfObjectType.mix:
        return "Shelf with Mixed Objects (Block, Scalar or Activity)";
    }
  }
}

class Example {
  final ShelfObjectType shelfObjectType;
  final Type? shelfType;
  final String routeName;
  final String? shortDesc;
  final String? description;
  final bool todo;
  final String? todoDesc;
  final bool free;

  final String? youtubeVideoCode;
  final int? documentId;
  final bool documentReady;

  String get exampleId {
    return routeName.substring(1).replaceAll("-", "_");
  }

  String get htmlFileName {
    return "${exampleId}_docs.html";
  }

  String get gifFileName {
    return "$exampleId.gif";
  }

  Example({
    required this.shelfObjectType,
    required this.shelfType,
    required this.routeName,
    this.youtubeVideoCode,
    required this.shortDesc,
    this.description,
    this.free = false,
    this.todoDesc,
    this.todo = false,
    this.documentId,
    this.documentReady = false,
  });

  Future<void> showExample() async {
    await Get.toNamed(routeName);
  }

  Future<void> showArticle() async {
    if (documentId == null) {
      return;
    }
    final Uri _url = Uri.parse('http://51.195.44.134:8080/vi/$documentId');

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
