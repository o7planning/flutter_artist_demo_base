import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

class SystemLog25aConfirmDialog extends StatelessWidget {
  const SystemLog25aConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = calculatePreferredDialogSize(
      context,
      preferredWidth: 400,
      preferredHeight: 120,
    );
    //
    FaAlertDialog alert = FaAlertDialog(
      titleText: "Confirm",
      contentPadding: const EdgeInsets.all(5),
      content: SizedBox(
        width: size.width,
        height: size.height,
        child: Row(
          children: [
            Icon(Icons.settings, size: 40, color: Colors.blue),
            SizedBox(width: 10),
            Expanded(
              child: Text("Are you sure you want to perform this action?"),
            ),
          ],
        ),
      ),
      clipBehavior: Clip.hardEdge,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text("Confirm"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text("Cancel"),
        ),
      ],
    );
    return alert;
  }
}
