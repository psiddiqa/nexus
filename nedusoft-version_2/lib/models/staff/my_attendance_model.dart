// To parse this JSON data, do
//
//     final myAttendanceReportModel = myAttendanceReportModelFromJson(jsonString);

import 'dart:convert';

MyAttendanceReportModel myAttendanceReportModelFromJson(String str) => MyAttendanceReportModel.fromJson(json.decode(str));

String myAttendanceReportModelToJson(MyAttendanceReportModel data) => json.encode(data.toJson());

class MyAttendanceReportModel {
  num? overAllAttn;
  num? monthAttn;
  List<ListElement>? list;
  int? statusFlag;
  dynamic statusMessage;

  MyAttendanceReportModel({
    this.overAllAttn,
    this.monthAttn,
    this.list,
    this.statusFlag,
    this.statusMessage,
  });

  factory MyAttendanceReportModel.fromJson(Map<String, dynamic> json) => MyAttendanceReportModel(
        overAllAttn: json["over_all_attn"],
        monthAttn: json["month_attn"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "over_all_attn": overAllAttn,
        "month_attn": monthAttn,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}

class ListElement {
  DateTime? date;
  String? status;

  ListElement({
    this.date,
    this.status,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "status": status,
      };
}
