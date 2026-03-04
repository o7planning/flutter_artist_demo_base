part of '../model.dart';

DateTime? __stringToNullableDateTime(dynamic json) {
  if (json == null) {
    return null;
  }
  if (json is String) {
    return stringToDate(json);
  }
  throw ArgumentError('Invalid type for DateTime conversion: $json');
}

DateTime __stringToDateTime(dynamic json) {
  if (json == null) {
    throw ArgumentError("DateTime null");
  }
  if (json is String) {
    return stringToDate(json);
  }
  throw ArgumentError('Invalid type for DateTime conversion: $json');
}

String __dateTimeToString(DateTime instance) {
  if (instance == null) {
    throw ArgumentError("DateTime null");
  }
  return dateTimeToString(instance);
}

String? __dateTimeToNullableString(DateTime? instance) {
  if (instance == null) {
    return null;
  }
  return dateTimeToString(instance);
}
