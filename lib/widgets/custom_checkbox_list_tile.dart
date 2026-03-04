import 'package:flutter/material.dart';

class CustomCheckboxListTile extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;

  const CustomCheckboxListTile({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      dense: true,
      visualDensity: VisualDensity(vertical: -3, horizontal: -3),
      contentPadding: EdgeInsets.zero,
      value: value,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: onChanged,
    );
  }
}
