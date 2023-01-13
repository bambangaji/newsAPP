// ignore_for_file: file_names

import 'package:intl/intl.dart';

class CustomFormatDate {
  static String formatDateID(String data) {
    String retVal;
    var formatter = DateFormat.yMMMd('id_ID').add_jm();
    var toDateFormat = DateTime.parse(data);
    String formatted = formatter.format(toDateFormat);
    retVal = formatted;
    return retVal;
  }

  static String toDateFilter(String data) {
    String retVal;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var formatter = DateFormat('yyyy-MM-dd');
    DateTime dateTime = dateFormat.parse(data.replaceAll("/", "-"));
    String formatted = formatter.format(dateTime);
    retVal = formatted;
    return retVal;
  }

  static DateTime toDateFormat(String data) {
    DateTime retVal;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = dateFormat.parse(data.replaceAll("/", "-"));
    retVal = dateTime;
    return retVal;
  }

  // ignore: non_constant_identifier_names
  static String ConvertDate(String data) {
    data = data.substring(0, 10);
    return data;
  }
}
