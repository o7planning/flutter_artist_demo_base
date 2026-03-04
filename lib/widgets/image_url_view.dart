import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';

class ImageUrlView extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final BoxShape boxShape;
  final Widget? child;
  final IconData? defaultOrErrorIconData;
  final BoxFit fit;

  const ImageUrlView({
    super.key,
    required this.imageUrl,
    required this.size,
    this.boxShape = BoxShape.circle,
    this.child,
    this.defaultOrErrorIconData,
    this.fit = BoxFit.fitWidth,
  });

  Widget _defaultOrError(double realSize) {
    return Container(
      width: realSize,
      height: realSize,
      decoration: BoxDecoration(color: Colors.black26, shape: boxShape),
      child: Icon(
        defaultOrErrorIconData ?? Icons.perm_identity,
        size: realSize - 2,
        color: Colors.black38,
      ),
    );
  }

  // ERROR:
  // https://github.com/Baseflow/flutter_cached_network_image/issues/995
  @override
  Widget build(BuildContext context) {
    double realSize = boxShape == BoxShape.circle ? (size / sqrt(2)) : size;

    return imageUrl == null
        ? _defaultOrError(realSize)
        : CachedNetworkImage(
            width: realSize,
            height: realSize,
            imageUrl: imageUrl!,
            imageBuilder: (context, imageProvider) => Container(
              width: realSize,
              height: realSize,
              decoration: BoxDecoration(
                shape: boxShape,
                image: DecorationImage(image: imageProvider, fit: fit),
              ),
            ),
            imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => _defaultOrError(realSize),
          );
  }
}
