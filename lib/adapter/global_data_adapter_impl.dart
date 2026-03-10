import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../model/model.dart';

class GlobalDataAdapterImpl
    implements FlutterArtistGlobalDataAdapter<MyGlobalData> {
  @override
  Future<MyGlobalData> loadGlobalData({
    required ILoggedInUser loggedInUser,
  }) async {
    return MyGlobalData();
  }

  @override
  MyGlobalData? fromJson(String json) {
    return MyGlobalData();
  }

  @override
  String toJson(MyGlobalData globalData) {
    return "";
  }
}
