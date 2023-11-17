import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

import '../models/get_status_model.dart';

List<ListElement> constStatus = [
  ListElement(value: 1078, text: "Present", ext: null),
  ListElement(value: 1079, text: "Absent", ext: null),
  ListElement(value: 1081, text: "Compensation", ext: null),
];

List<ListElement> constRemart = [
  ListElement(value: 1083, text: "Sports", ext: null),
  ListElement(value: 1084, text: "NCC", ext: null),
  ListElement(value: 1085, text: "Union", ext: null),
  ListElement(value: 1086, text: "IDA", ext: null),
  ListElement(value: 1087, text: "WDA", ext: null),
  ListElement(value: 1088, text: "IMA", ext: null),
  ListElement(value: 1089, text: "NSS", ext: null),
  ListElement(value: 1090, text: "College Program", ext: null),
];

int weekDay(String val) {
  if (val == "Monday") {
    return 1;
  } else if (val == "Tuesday") {
    return 2;
  } else if (val == "Wednesday") {
    return 3;
  } else if (val == "Thursday") {
    return 4;
  } else if (val == "Friday") {
    return 5;
  } else {
    return 0;
  }
}

String dateFormatInYearMonthDate(String date) {
  DateTime parseDate = DateFormat("dd-MM-yyyy").parse(date);
  var inputDate = DateTime.parse(parseDate.toString());
  String formattedDate = DateFormat('yyyy-MM-dd').format(inputDate);
  return formattedDate;
}
