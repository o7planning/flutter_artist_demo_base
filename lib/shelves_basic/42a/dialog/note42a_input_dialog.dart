import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';

import '../../../model/model.dart';
import '../action/note42a_quick_item_creation_action.dart';
import '../action/note42a_quick_item_update_action.dart';
import '../block/note42a_block.dart';

class Note42aInputDialog extends StatefulWidget {
  final Note42aBlock note42aBlock;
  final NoteInfo? note;

  const Note42aInputDialog({
    required this.note42aBlock,
    required this.note,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _Note42aInputDialogState();
  }
}

class _Note42aInputDialogState extends State<Note42aInputDialog> {
  late String title;
  late String content;

  @override
  void initState() {
    super.initState();
    title = widget.note?.title ?? "";
    content = widget.note?.content ?? "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = calculatePreferredDialogSize(
      context,
      preferredWidth: 420,
      preferredHeight: 240,
    );
    //
    // Set up the AlertDialog
    FaAlertDialog alert = FaAlertDialog(
      titleText: widget.note != null
          ? "Quick Update note"
          : "Quick create note",
      contentPadding: const EdgeInsets.all(5),
      content: _buildMainContent(context, size.width, size.height),
      clipBehavior: Clip.hardEdge,
      actions: [
        TextButton(
          onPressed:
              (title.isNotEmpty &&
                  content.isNotEmpty &&
                  (title != widget.note?.title ||
                      content != widget.note?.content))
              ? () {
                  _onPressedBtnCreateOrUpdateNote();
                }
              : null,
          child: Text(widget.note != null ? "Save" : "Create"),
        ),
      ],
    );
    return alert;
  }

  Widget _buildMainContent(BuildContext context, double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          FaFormBuilderTextField.topLabel(
            name: "title",
            labelText: "Title",
            initialValue: title,
            onChanged: (String? text) {
              title = text ?? "";
              setState(() {});
            },
          ),
          SizedBox(height: 10),
          Expanded(
            child: FaFormBuilderTextField.topLabel(
              name: "content",
              labelText: "Content",
              initialValue: content,
              minLines: 3,
              maxLines: 3,
              onChanged: (String? text) {
                content = text ?? "";
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onPressedBtnCreateOrUpdateNote() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    if (widget.note == null) {
      var createAction = Note42aQuickItemCreationAction(
        title: title,
        content: content,
        needToConfirm: false,
        actionInfo: 'Create a new note',
      );
      //
      BlockQuickItemCreationResult result = await widget.note42aBlock
          .executeQuickItemCreationAction(action: createAction);
      if (result.successForAll && context.mounted) {
        Navigator.of(context).pop();
      }
    } else {
      var updateAction = Note42aQuickItemUpdateAction(
        item: widget.note!,
        config: BlockQuickItemUpdateActionConfig(
          errorIfItemNotInTheBlock: true,
        ),
        note: widget.note!,
        title: title,
        content: content,
        needToConfirm: false,
        actionInfo: 'Quick update note',
      );
      //
      BlockQuickItemUpdateResult result = await widget.note42aBlock
          .executeQuickItemUpdateAction(action: updateAction);
      if (result.successForAll && context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}

Future<void> showNote42aInputDialog(
  BuildContext context, {
  required Note42aBlock note42aBlock,
  required NoteInfo? note,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Note42aInputDialog(note42aBlock: note42aBlock, note: note);
    },
  );
}
