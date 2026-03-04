import 'package:intl/intl.dart';

final DateFormat dateFormat = DateFormat("yyyy-MM-dd");
final DateFormat dateTimeFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

///
/// Convert a String (yyyy-MM-dd) to DateTime
///
DateTime stringToDate(String dateTimeStr) {
  return dateFormat.parse(dateTimeStr);
}

///
/// Convert a DateTime to String (yyyy-MM-dd)
///
String dateToString(DateTime dateTime) {
  return dateFormat.format(dateTime);
}

///
/// Convert a DateTime to String (yyyy-MM-dd)
///
String dateTimeToString(DateTime dateTime) {
  return dateTimeFormat.format(dateTime);
}
