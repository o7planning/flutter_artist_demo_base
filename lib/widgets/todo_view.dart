import 'package:flutter/material.dart';

class TodoView extends StatelessWidget {
  final String content;

  const TodoView({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(content, style: TextStyle(color: Colors.red));
  }
}
