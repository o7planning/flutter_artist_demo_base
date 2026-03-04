import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_artist_demo_base/widgets/image_url_view.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

class ImageViewerPicker extends StatefulWidget {
  final String keyString;
  final String? imageUrl;
  final String label;
  final double previewWidth;
  final double previewHeight;
  final String fieldName;

  ImageViewerPicker({
    required this.keyString,
    required this.imageUrl,
    this.previewWidth = 140,
    this.previewHeight = 140,
    required this.label,
    required this.fieldName,
  }) : super(key: Key("$keyString-$imageUrl"));

  @override
  State<StatefulWidget> createState() {
    return _ImageViewerPickerState();
  }
}

class _ImageViewerPickerState extends State<ImageViewerPicker> {
  bool showPicker = false;
  static const double padding = 5;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.previewWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IndexedStack(
            index: showPicker ? 1 : 0,
            children: [
              Padding(
                padding: EdgeInsets.all(padding),
                child: ImageUrlView(
                  imageUrl: widget.imageUrl,
                  size:
                      min(widget.previewWidth, widget.previewHeight + 30) -
                      2 * padding,
                  boxShape: BoxShape.rectangle,
                ),
              ),
              FaFormBuilderImagePicker.topLabel(
                name: widget.fieldName,
                labelText: widget.label,
                maxImages: 1,
                previewWidth: widget.previewWidth,
                previewHeight: widget.previewHeight,
                availableImageSources: [ImageSourceOption.gallery],
              ),
            ],
          ),
          SizedBox(height: 2),
          TextButton(
            onPressed: () {
              setState(() {
                showPicker = !showPicker;
              });
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              minimumSize: Size.zero,
              padding: EdgeInsets.all(5),
            ),
            child: Text(
              showPicker ? "View Original Image" : "Upload Image",
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
