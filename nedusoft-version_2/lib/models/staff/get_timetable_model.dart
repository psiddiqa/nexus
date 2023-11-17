// To parse this JSON data, do
//
//     final timeTableModel = timeTableModelFromMap(jsonString);

import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

class TimeTableModel {
  int? statusFlag;
  String? statusMessage;

  TimeTableModel({
    this.statusFlag,
    this.statusMessage,
  });

  factory TimeTableModel.fromJson(Map<String, dynamic> json) => TimeTableModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );
}

class GetFacultyTimeTableModel {
  List<Day>? days;
  int? statusFlag;
  dynamic statusMessage;

  GetFacultyTimeTableModel({
    this.days,
    this.statusFlag,
    this.statusMessage,
  });

  factory GetFacultyTimeTableModel.fromJson(Map<String, dynamic> json) => GetFacultyTimeTableModel(
        days: json["days"] == null ? null : List<Day>.from(json["days"].map((x) => Day.fromMap(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );
}

class Day {
  String? day;
  List<Schedule>? schedules;

  Day({
    this.day,
    this.schedules,
  });

  factory Day.fromMap(Map<String, dynamic> json) => Day(
        day: json["day"],
        schedules: List<Schedule>.from(json["schedules"].map((x) => Schedule.fromMap(x))),
      );
}

class Schedule {
  String? className;
  String? subjectName;
  String? faculty;
  DateTime? fromTime;
  DateTime? toTime;
  int? dayId;
  bool isPassed = false;
  bool isHappening = false;

  Schedule({this.className, this.subjectName, this.faculty, this.fromTime, this.toTime, this.dayId, this.isHappening = false, this.isPassed = false});

  factory Schedule.fromMap(Map<String, dynamic> json) {
    var fromTime = DateFormat('Hms').parse(json["from_time"]);
    var toTime = DateFormat('Hms').parse(json["to_time"]);
    return Schedule(
        className: json["class_name"],
        subjectName: json["subject_name"],
        faculty: json["faculty"],
        fromTime: fromTime.applyTimeOfDay(
          year: DateTime.now().year,
          month: DateTime.now().month,
          day: DateTime.now().day,
        ),
        toTime: toTime.applyTimeOfDay(year: DateTime.now().year, month: DateTime.now().month, day: DateTime.now().day),
        dayId: json["day_id"],
        isPassed: false,
        isHappening: false);
  }
}

extension DateTimeExt on DateTime {
  DateTime applyTimeOfDay({
    required int year,
    required int month,
    required int day,
  }) {
    return DateTime(year, month, day, hour, minute);
  }
}
