// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

ReportModel reportModelFromJson(String str) => ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
  dynamic year;
  List<ListElement>? list;
  int? statusFlag;
  dynamic statusMessage;

  ReportModel({
    this.year,
    this.list,
    this.statusFlag,
    this.statusMessage,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        year: json["year"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}

class ListElement {
  String? className;
  String? subject;
  int? presentDays;
  int? absentDays;
  int? total;
  int? percentage;
  dynamic name;
  dynamic fromTime;
  dynamic toTime;
  DateTime? date;
  String? session;

  ListElement({
    this.className,
    this.subject,
    this.presentDays,
    this.absentDays,
    this.total,
    this.percentage,
    this.name,
    this.fromTime,
    this.toTime,
    this.date,
    this.session,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        className: json["class_name"],
        subject: json["subject"],
        presentDays: json["present_days"],
        absentDays: json["absent_days"],
        total: json["total"],
        percentage: json["percentage"],
        name: json["name"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        session: json["session"],
      );

  Map<String, dynamic> toJson() => {
        "class_name": className,
        "subject": subject,
        "present_days": presentDays,
        "absent_days": absentDays,
        "total": total,
        "percentage": percentage,
        "name": name,
        "from_time": fromTime,
        "to_time": toTime,
        "date": date?.toIso8601String(),
        "session": session,
      };
}
