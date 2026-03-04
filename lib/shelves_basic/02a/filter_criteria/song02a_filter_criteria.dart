import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class Song02aFilterCriteria extends FilterCriteria {
  final String? searchText;
  final AlbumInfo? album;

  Song02aFilterCriteria({required this.album, required this.searchText});
}
