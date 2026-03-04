import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class Employee03aFilterCriteria extends FilterCriteria {
  final String? searchText;
  final CompanyInfo? company;
  final DepartmentInfo? department;

  Employee03aFilterCriteria({
    required this.searchText,
    required this.company,
    required this.department,
  });
}
