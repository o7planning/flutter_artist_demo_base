import 'package:flutter/material.dart';

import 'custom_app_container.dart';

class HighlightView extends StatelessWidget {
  final Color backgroundColor;
  final String text;

  const HighlightView({
    this.backgroundColor = Colors.black,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer.customBgColor(
      padding: EdgeInsets.all(5),
      width: double.maxFinite,
      backgroundColor: backgroundColor,
      child: Text(
        text,
        maxLines: 1,
        style: TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
