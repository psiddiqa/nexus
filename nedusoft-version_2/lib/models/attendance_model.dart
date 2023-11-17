// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromMap(jsonString);

import 'dart:convert';
import 'dart:developer';

import 'package:nedusoft/Utils/constant.dart';

import 'getall_attendance_model.dart';

class AttendanceModel {
  int? classtaken;
  int? classAttended;
  double? percentage;
  int? statusFlag;
  String? statusMessage;

  AttendanceModel({
    this.classtaken,
    this.classAttended,
    this.percentage,
    this.statusFlag,
    this.statusMessage,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
        classtaken: json["Classtaken"],
        classAttended: json["ClassAttended"],
        percentage: json["Percentage"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toMap() => {
        "Classtaken": classtaken,
        "ClassAttended": classAttended,
        "Percentage": percentage,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}

class SaveStudentAttendanceModel {
  String studentName;
  int? studentId;
  int? statusId;
  int? remarkId;
  int? name;
  int? remark;

  SaveStudentAttendanceModel({required this.studentName, this.studentId, this.statusId, this.remarkId, this.name = 0, this.remark = 0});

  factory SaveStudentAttendanceModel.fromMap(ListElement json) => SaveStudentAttendanceModel(studentName: json.firstName!, studentId: json.studentId, statusId: constStatus[0].value, remarkId: json.remarkId, name: constStatus.indexWhere((element) => json.statusId == element.value) != -1 ? constStatus.indexWhere((element) => json.statusId == element.value) : 0, remark: constRemart.indexWhere((element) => json.remarkId == element.value) != -1 ? constRemart.indexWhere((element) => json.remarkId == element.value) : 0);

  Map<String, dynamic> toMap() => {
        "studentName": studentName,
        "studentId": studentId,
        "statusId": statusId,
        "remarkId": remarkId,
      };
}

class SaveAttendanceModel {
  String studentName;
  int? attId;
  int? statusId;
  int? remarkId;
  int? name;
  int? remark;

  SaveAttendanceModel({required this.studentName, this.attId, this.statusId, this.remarkId, this.name = 0, this.remark = 0});

  factory SaveAttendanceModel.fromMap(ListElement json) {
    return SaveAttendanceModel(studentName: json.firstName!, attId: json.attId, statusId: json.statusId, remarkId: json.remarkId, name: constStatus.indexWhere((element) => json.statusId == element.value) != -1 ? constStatus.indexWhere((element) => json.statusId == element.value) : 0, remark: constRemart.indexWhere((element) => json.remarkId == element.value) != -1 ? constRemart.indexWhere((element) => json.remarkId == element.value) + 1 : 0);
  }
  Map<String, dynamic> toMap() => {
        "studentName": studentName,
        "AttId": attId,
        "statusId": statusId,
        "remarkId": remarkId,
      };
}

