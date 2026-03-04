import 'package:flutter_artist/flutter_artist.dart';

class Employee40aFilterInput extends FilterInput {
  final String? searchText;
  final String? companyCode;
  final List<String> departmentCodes;

  Employee40aFilterInput({
    required this.searchText,
    required this.companyCode,
    required this.departmentCodes,
  });

  @override
  String toString() {
    return "searchText: $searchText, "
        "companyCode: $companyCode, "
        "departmentCodes: $departmentCodes";
  }
}
