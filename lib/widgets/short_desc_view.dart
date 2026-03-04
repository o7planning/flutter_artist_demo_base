import 'package:flutter/material.dart';

import 'custom_app_container.dart';

class ShortDescView extends StatelessWidget {
  final String shortDesc;

  const ShortDescView({required this.shortDesc, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      padding: EdgeInsets.all(10),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.note, color: Colors.deepOrange),
          SizedBox(width: 5),
          Expanded(
            child: Text(shortDesc, style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
