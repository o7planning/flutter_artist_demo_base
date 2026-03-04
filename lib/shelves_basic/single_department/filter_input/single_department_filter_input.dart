import 'package:flutter_artist/flutter_artist.dart';

///
/// For FilterInput(s) that have only one property,
/// you can use one of the following built-in FilterInput(s):
///
/// [StringIdFilterInput],
/// [StringValueFilterInput]
/// [SearchTextFilterInput]
/// [IntIdFilterInput].
///
/// For Demo reasons we will write our own FilterInput(s).
///
class SingleDepartmentFilterInput extends FilterInput {
  int? departmentId;

  SingleDepartmentFilterInput({required this.departmentId});
}
