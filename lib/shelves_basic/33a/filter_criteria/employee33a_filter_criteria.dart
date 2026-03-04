import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class Employee33aFilterCriteria extends FilterCriteria {
  final String? searchText;
  final CompanyTreeItem? company;
  final DepartmentInfo? department;

  Employee33aFilterCriteria({
    required this.searchText,
    required this.company,
    required this.department,
  });
}
