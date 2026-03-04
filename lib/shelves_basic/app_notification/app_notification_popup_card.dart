import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

import 'app_notification_screen.dart';

class AppNotificationPopupCard extends StatelessWidget {
  const AppNotificationPopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PopupCard(
      elevation: 8,
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 320,
          maxWidth: min(size.width, 400),
          minHeight: 280,
          maxHeight: size.height - 100,
        ),
        child: const AppNotificationScreen(),
      ),
    );
  }
}
