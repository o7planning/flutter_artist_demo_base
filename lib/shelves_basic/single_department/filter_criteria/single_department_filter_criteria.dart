import 'package:flutter_artist/flutter_artist.dart';

///
/// For FilterCriteria that have only one property,
/// you can use one of the following built-in FilterCriteria:
///
/// [StringIdFilterCriteria],
/// [StringValueFilterCriteria]
/// [SearchTextFilterCriteria]
/// [IntIdFilterCriteria].
///
/// For Demo reasons we will write our own FilterModels.
///
class SingleDepartmentFilterCriteria extends FilterCriteria {
  int? departmentId;

  SingleDepartmentFilterCriteria({this.departmentId});
}
