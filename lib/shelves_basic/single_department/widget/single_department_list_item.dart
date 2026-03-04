import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';

class AppUserListItem extends StatelessWidget {
  final AppUserInfo appUserInfo;
  final bool selected;
  final Function(AppUserInfo appUserInfo) onAppUserPressed;

  const AppUserListItem({
    super.key,
    required this.appUserInfo,
    required this.selected,
    required this.onAppUserPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        leading: ImageUrlView(imageUrl: appUserInfo.imageUrl, size: 60),
        title: Text(
          appUserInfo.userName,
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ),
        subtitle: Text(
          appUserInfo.fullName,
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
    onAppUserPressed(appUserInfo);
  }
}
