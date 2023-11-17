// To parse this JSON data, do
//
//     final yearAttendanceReport = yearAttendanceReportFromJson(jsonString);

import 'dart:convert';

YearAttendanceReport yearAttendanceReportFromJson(String str) => YearAttendanceReport.fromJson(json.decode(str));

String yearAttendanceReportToJson(YearAttendanceReport data) => json.encode(data.toJson());

class YearAttendanceReport {
  List<ListElement>? list;
  Year? year;
  int? statusFlag;
  dynamic statusMessage;
  Pie? pie;
  List<AttnList>? attnList;
  bool? isSubject;

  YearAttendanceReport({
    this.list,
    this.year,
    this.statusFlag,
    this.statusMessage,
    this.pie,
    this.attnList,
    this.isSubject,
  });

  factory YearAttendanceReport.fromJson(Map<String, dynamic> json) => YearAttendanceReport(list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))), year: json["year"] == null ? null : Year.fromJson(json["year"]), statusFlag: json["statusFlag"], statusMessage: json["statusMessage"], pie: json["pie"] == null ? null : Pie.fromJson(json["pie"]), attnList: json["attn_list"] == null ? [] : List<AttnList>.from(json["attn_list"]!.map((x) => AttnList.fromJson(x))), isSubject: json["is_sub_req"]);

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x)),
        "year": year?.toJson(),
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
        "pie": pie?.toJson(),
        "attn_list": attnList == null ? [] : List<dynamic>.from(attnList!.map((x) => x.toJson())),
      };
}

class AttnList {
  String? className;
  dynamic subject;
  int? presentDays;
  int? absentDays;
  int? total;
  double? percentage;
  dynamic name;
  dynamic fromTime;
  dynamic toTime;
  dynamic date;
  dynamic session;

  AttnList({
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

  factory AttnList.fromJson(Map<String, dynamic> json) => AttnList(
        className: json["class_name"],
        subject: json["subject"],
        presentDays: json["present_days"],
        absentDays: json["absent_days"],
        total: json["total"],
        percentage: json["percentage"],
        name: json["name"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        date: json["date"],
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
        "date": date,
        "session": session,
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

class Pie {
  int? totClasses;
  int? totAbsent;
  int? totPresent;
  int? totHolidays;
  int? totLeaves;
  double? absentPer;
  double? presentPer;
  double? leavePer;

  Pie({
    this.totClasses,
    this.totAbsent,
    this.totPresent,
    this.totHolidays,
    this.totLeaves,
    this.absentPer,
    this.presentPer,
    this.leavePer,
  });

  factory Pie.fromJson(Map<String, dynamic> json) => Pie(
        totClasses: json["tot_classes"],
        totAbsent: json["tot_absent"],
        totPresent: json["tot_present"],
        totHolidays: json["tot_holidays"],
        totLeaves: json["tot_leaves"],
        absentPer: json["absent_per"],
        presentPer: json["present_per"],
        leavePer: json["leave_per"],
      );

  Map<String, dynamic> toJson() => {
        "tot_classes": totClasses,
        "tot_absent": totAbsent,
        "tot_present": totPresent,
        "tot_holidays": totHolidays,
        "tot_leaves": totLeaves,
        "absent_per": absentPer,
        "present_per": presentPer,
        "leave_per": leavePer,
      };
}

class Year {
  int? yearId;
  String? yearName;
  String? brcode;
  String? cmpid;
  bool? isActive;
  dynamic createdBy;
  dynamic createdOn;
  dynamic updatedBy;
  dynamic updatedOn;
  bool? isCurrent;
  List<Year>? yearList;
  String? statusMessage;
  int? loginId;
  dynamic loginName;
  dynamic password;
  int? statusFlag;
  dynamic token;

  Year({
    this.yearId,
    this.yearName,
    this.brcode,
    this.cmpid,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.isCurrent,
    this.yearList,
    this.statusMessage,
    this.loginId,
    this.loginName,
    this.password,
    this.statusFlag,
    this.token,
  });

  factory Year.fromJson(Map<String, dynamic> json) => Year(
        yearId: json["YearID"],
        yearName: json["YearName"],
        brcode: json["brcode"],
        cmpid: json["cmpid"],
        isActive: json["IsActive"],
        createdBy: json["CreatedBy"],
        createdOn: json["CreatedOn"],
        updatedBy: json["UpdatedBy"],
        updatedOn: json["UpdatedOn"],
        isCurrent: json["IsCurrent"],
        yearList: json["YearList"] == null ? [] : List<Year>.from(json["YearList"]!.map((x) => Year.fromJson(x))),
        statusMessage: json["statusMessage"],
        loginId: json["LoginId"],
        loginName: json["LoginName"],
        password: json["Password"],
        statusFlag: json["statusFlag"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "YearID": yearId,
        "YearName": yearName,
        "brcode": brcode,
        "cmpid": cmpid,
        "IsActive": isActive,
        "CreatedBy": createdBy,
        "CreatedOn": createdOn,
        "UpdatedBy": updatedBy,
        "UpdatedOn": updatedOn,
        "IsCurrent": isCurrent,
        "YearList": yearList == null ? [] : List<dynamic>.from(yearList!.map((x) => x.toJson())),
        "statusMessage": statusMessage,
        "LoginId": loginId,
        "LoginName": loginName,
        "Password": password,
        "statusFlag": statusFlag,
        "token": token,
      };
}
