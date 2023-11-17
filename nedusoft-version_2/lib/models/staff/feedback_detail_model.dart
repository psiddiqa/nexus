// To parse this JSON data, do
//
//     final feedbackDetailModel = feedbackDetailModelFromMap(jsonString);

import 'dart:convert';

class FeedbackDetailModel {
  List<Data>? list;
  Data? data;
  dynamic input;
  Output? output;
  List<Status>? status;

  FeedbackDetailModel({
    this.list,
    this.data,
    this.input,
    this.output,
    this.status,
  });

  factory FeedbackDetailModel.fromJson(Map<String, dynamic> json) => FeedbackDetailModel(
        list: json["list"] == null ? [] : List<Data>.from(json["list"]!.map((x) => Data.fromMap(x))),
        data: Data.fromMap(json["data"]),
        input: json["input"],
        output: Output.fromMap(json["output"]),
        status: json["status"] == null ? null : List<Status>.from(json["status"].map((x) => Status.fromMap(x))),
      );
}

class Data {
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
  dynamic url;

  Data({
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
    this.url,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
        url: json["url"],
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
  dynamic statusMessage;

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

class Status {
  int? value;
  String? text;
  dynamic ext;

  Status({
    this.value,
    this.text,
    this.ext,
  });

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        value: json["Value"],
        text: json["Text"],
        ext: json["Ext"],
      );

  // Map<String, dynamic> toMap() => {
  //       "Value": value,
  //       "Text": text,
  //       "Ext": ext,
  //     };
}
