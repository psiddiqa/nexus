// To parse this JSON data, do
//
//     final collegeStudentReportModel = collegeStudentReportModelFromJson(jsonString);

import 'dart:convert';

CollegeStudentReportModel collegeStudentReportModelFromJson(String str) => CollegeStudentReportModel.fromJson(json.decode(str));

String collegeStudentReportModelToJson(CollegeStudentReportModel data) => json.encode(data.toJson());

class CollegeStudentReportModel {
  List<ListElement>? list;
  double? totClass;
  double? totPresent;
  double? totAbsent;
  double? totLeave;
  double? totClassPer;
  double? totPersentPer;
  double? totAbsentPer;
  double? totLeavePer;
  int? statusFlag;
  dynamic statusMessage;
  Year? year;
  bool? isStudent;

  CollegeStudentReportModel({
    this.list,
    this.totClass,
    this.totPresent,
    this.totAbsent,
    this.totLeave,
    this.totClassPer,
    this.totPersentPer,
    this.totAbsentPer,
    this.totLeavePer,
    this.statusFlag,
    this.statusMessage,
    this.year,
    this.isStudent,
  });

  factory CollegeStudentReportModel.fromJson(Map<String, dynamic> json) => CollegeStudentReportModel(list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))), totClass: json["tot_class"], totPresent: json["tot_present"], totAbsent: json["tot_absent"], totLeave: json["tot_leave"], totClassPer: json["tot_class_per"], totPersentPer: json["tot_persent_per"]?.toDouble(), totAbsentPer: json["tot_absent_per"]?.toDouble(), totLeavePer: json["tot_leave_per"], statusFlag: json["statusFlag"], statusMessage: json["statusMessage"], year: json["year"] == null ? null : Year.fromJson(json["year"]), isStudent: json["is_sub_req"]);

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "tot_class": totClass,
        "tot_present": totPresent,
        "tot_absent": totAbsent,
        "tot_leave": totLeave,
        "tot_class_per": totClassPer,
        "tot_persent_per": totPersentPer,
        "tot_absent_per": totAbsentPer,
        "tot_leave_per": totLeavePer,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
        "year": year?.toJson(),
      };
}

class ListElement {
  String? subject;
  double? totClass;
  double? totPresent;
  double? totAbsent;
  double? totLeave;
  double? totClassPer;
  double? totPersentPer;
  double? totAbsentPer;
  double? totLeavePer;

  ListElement({
    this.subject,
    this.totClass,
    this.totPresent,
    this.totAbsent,
    this.totLeave,
    this.totClassPer,
    this.totPersentPer,
    this.totAbsentPer,
    this.totLeavePer,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        subject: json["subject"],
        totClass: json["tot_class"],
        totPresent: json["tot_present"],
        totAbsent: json["tot_absent"],
        totLeave: json["tot_leave"],
        totClassPer: json["tot_class_per"],
        totPersentPer: json["tot_persent_per"],
        totAbsentPer: json["tot_absent_per"],
        totLeavePer: json["tot_leave_per"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "tot_class": totClass,
        "tot_present": totPresent,
        "tot_absent": totAbsent,
        "tot_leave": totLeave,
        "tot_class_per": totClassPer,
        "tot_persent_per": totPersentPer,
        "tot_absent_per": totAbsentPer,
        "tot_leave_per": totLeavePer,
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
