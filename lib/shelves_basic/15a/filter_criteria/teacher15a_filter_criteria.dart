import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class Teacher15aFilterCriteria extends FilterCriteria {
  final String? searchText;
  final UniversityInfo? university;

  Teacher15aFilterCriteria({
    required this.university,
    required this.searchText,
  });
}
