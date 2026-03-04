import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';

class Teacher15aListItem extends StatelessWidget {
  final TeacherInfo teacherInfo;
  final bool selected;
  final Function(TeacherInfo teacherInfo) onTeacherPressed;

  const Teacher15aListItem({
    super.key,
    required this.teacherInfo,
    required this.selected,
    required this.onTeacherPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        leading: ImageUrlView(
          imageUrl: teacherInfo.imageUrl,
          size: 60,
          boxShape: BoxShape.rectangle,
          defaultOrErrorIconData: Icons.video_camera_back_outlined,
        ),
        title: Text(
          teacherInfo.fullName,
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ),
        subtitle: Text(
          "${teacherInfo.active}",
          style: const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
        ),
        onTap: _onTap,
      ),
    );
  }

  void _onTap() {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    onTeacherPressed(teacherInfo);
  }
}
