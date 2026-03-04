import 'package:flutter/material.dart';

class CustomAppContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final int type;
  final Color? customBgColor;
  static const int _typeDefaullt = 0;
  static const int _typeTransparent = 1;
  static const int _typeCustomBgColor = 2;

  const CustomAppContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  }) : type = _typeDefaullt,
       customBgColor = null;

  const CustomAppContainer.transparent({
    this.child,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    super.key,
  }) : type = _typeTransparent,
       customBgColor = null;

  const CustomAppContainer.customBgColor({
    this.child,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    required Color backgroundColor,
    super.key,
  }) : type = _typeCustomBgColor,
       customBgColor = backgroundColor;

  Color _color(BuildContext context) {
    switch (type) {
      case _typeDefaullt:
        return Theme.of(context).cardColor;
      case _typeTransparent:
        return Colors.transparent;
      case _typeCustomBgColor:
        return customBgColor!;
      default:
        return Colors.transparent;
    }
  }

  Border? _border() {
    switch (type) {
      case _typeDefaullt:
        return Border.all(color: Colors.black12);
      case _typeTransparent:
        return Border.all(color: Colors.transparent);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: _color(context),
        borderRadius: BorderRadius.circular(4),
        border: _border(),
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
