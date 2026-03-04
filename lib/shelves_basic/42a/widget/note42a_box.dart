import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../../../model/model.dart';
import '../../../utils/color_utils.dart';

class Note42aBox extends StatelessWidget {
  final NoteInfo noteInfo;
  final bool selected;
  final Function(NoteInfo noteInfo) onNoteBoxPressed;
  final Function(NoteInfo noteInfo) onEditNoteBtnPressed;

  const Note42aBox({
    super.key,
    required this.noteInfo,
    required this.selected,
    required this.onNoteBoxPressed,
    required this.onEditNoteBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTapOnNoteBox,
      child: Card(
        color: ColorUtils.fromHex16ColorCode(
          hexColorCode: noteInfo.colorCode,
          defaultColor: Colors.black,
        ),
        shape: RoundedRectangleBorder(
          side: selected
              ? BorderSide(color: Colors.red, width: 2.0)
              : BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                noteInfo.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  color: selected ? Colors.white : Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 10),
              Text(
                noteInfo.content,
                style: TextStyle(
                  fontSize: 12,
                  color: selected ? Colors.white : Colors.black54,
                ),
              ),
              Divider(color: selected ? Colors.white : null),
              Row(
                children: [
                  Text(
                    noteInfo.createDateTime,
                    style: TextStyle(
                      fontSize: 11,
                      color: selected ? Colors.white : Colors.black45,
                    ),
                  ),
                  Spacer(),
                  SimpleSmallIconButton(
                    iconData: Icons.edit,
                    iconColor: selected
                        ? Colors.white
                        : Colors.indigo.withAlpha(180),
                    onPressed: _onEditNoteBtnPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapOnNoteBox() {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    onNoteBoxPressed(noteInfo);
  }

  void _onEditNoteBtnPressed() {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    onEditNoteBtnPressed(noteInfo);
  }
}
