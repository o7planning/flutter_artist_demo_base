import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class Employee40aFilterCriteria extends FilterCriteria {
  final String? searchText;
  final CompanyInfo? company;
  final List<DepartmentInfo>? departments;

  Employee40aFilterCriteria({
    required this.searchText,
    required this.company,
    required this.departments,
  });

  String get departmentIdsAsString {
    return (departments ?? []).map((d) => d.id).join(",");
  }
}
