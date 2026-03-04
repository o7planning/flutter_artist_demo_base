import 'package:flutter/material.dart';

class NoPaddingIconButton extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;

  const NoPaddingIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.all(0),
      ),
      child: icon,
    );
  }
}
