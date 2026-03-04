import 'package:flutter/material.dart';

class Currency49aSymbolView extends StatelessWidget {
  final String? symbol;
  final double width;
  final double height;
  final double fontSize;

  const Currency49aSymbolView({
    super.key,
    required this.symbol,
    required this.width,
    required this.height,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      child: Center(
        child: Text(
          symbol ?? "",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
      ),
    );
  }
}
