// To parse this JSON data, do
//
//     final timeTableModel = timeTableModelFromMap(jsonString);

import 'dart:convert';

class FeebbackListModel {
  List<ListElement>? list;
  dynamic data;
  dynamic input;
  Output? output;
  dynamic status;

  FeebbackListModel({
    this.list,
    this.data,
    this.input,
    this.output,
    this.status,
  });

  factory FeebbackListModel.fromJson(Map<String, dynamic> json) => FeebbackListModel(
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromMap(x))),
        data: json["data"],
        input: json["input"],
        output: Output.fromMap(json["output"]),
        status: json["status"],
      );

  // Map<String, dynamic> toMap() => {
  //       "list": List<dynamic>.from(list.map((x) => x.toMap())),
  //       "data": data,
  //       "input": input,
  //       "output": output.toMap(),
  //       "status": status,
  //     };
}

class ListElement {
  int? feedbackId;
  String? faculty;
  String? student;
  String? date;
  dynamic date2;
  String? status;
  int? statusId;
  String? className;
  dynamic section;
  String? feedback;
  dynamic remarks;
  dynamic base64;
  int? facultyId;
  int? studentId;
  dynamic fileName;
  dynamic file;

  ListElement({
    this.feedbackId,
    this.faculty,
    this.student,
    this.date,
    this.date2,
    this.status,
    this.statusId,
    this.className,
    this.section,
    this.feedback,
    this.remarks,
    this.base64,
    this.facultyId,
    this.studentId,
    this.fileName,
    this.file,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        feedbackId: json["feedback_id"],
        faculty: json["faculty"],
        student: json["student"],
        date: json["date"],
        date2: json["date2"],
        status: json["status"],
        statusId: json["status_id"],
        className: json["class_name"],
        section: json["section"],
        feedback: json["feedback"],
        remarks: json["remarks"],
        base64: json["base64"],
        facultyId: json["faculty_id"],
        studentId: json["student_id"],
        fileName: json["file_name"],
        file: json["file"],
      );

  // Map<String, dynamic> toMap() => {
  //       "feedback_id": feedbackId,
  //       "faculty": faculty,
  //       "student": student,
  //       "date": date,
  //       "date2": date2,
  //       "status": status,
  //       "status_id": statusId,
  //       "class_name": className,
  //       "section": section,
  //       "feedback": feedback,
  //       "remarks": remarks,
  //       "base64": base64,
  //       "faculty_id": facultyId,
  //       "student_id": studentId,
  //       "file_name": fileName,
  //       "file": file,
  //     };
}

class Output {
  int? statusFlag;
  String? statusMessage;

  Output({
    this.statusFlag,
    this.statusMessage,
  });

  factory Output.fromMap(Map<String, dynamic> json) => Output(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toMap() => {
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}
