// To parse this JSON data, do
//
//     final studentShowMarkListModel = studentShowMarkListModelFromJson(jsonString);

import 'dart:convert';

StudentShowMarkListModel studentShowMarkListModelFromJson(String str) => StudentShowMarkListModel.fromJson(json.decode(str));

String studentShowMarkListModelToJson(StudentShowMarkListModel data) => json.encode(data.toJson());

class StudentShowMarkListModel {
  List<Class>? classes;
  List<Class>? sections;
  List<Class>? exams;
  List<ListElement>? list;
  double? maxMarks;
  double? minMarks;
  int? statusFlag;
  dynamic statusMessage;
  Year? year;

  StudentShowMarkListModel({
    this.classes,
    this.sections,
    this.exams,
    this.list,
    this.maxMarks,
    this.minMarks,
    this.statusFlag,
    this.statusMessage,
    this.year,
  });

  factory StudentShowMarkListModel.fromJson(Map<String, dynamic> json) => StudentShowMarkListModel(
        classes: json["classes"] == null ? [] : List<Class>.from(json["classes"]!.map((x) => Class.fromJson(x))),
        sections: json["sections"] == null ? [] : List<Class>.from(json["sections"]!.map((x) => Class.fromJson(x))),
        exams: json["exams"] == null ? [] : List<Class>.from(json["exams"]!.map((x) => Class.fromJson(x))),
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        maxMarks: json["max_marks"],
        minMarks: json["min_marks"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        year: json["year"] == null ? null : Year.fromJson(json["year"]),
      );

  Map<String, dynamic> toJson() => {
        "classes": classes == null ? [] : List<dynamic>.from(classes!.map((x) => x.toJson())),
        "sections": sections == null ? [] : List<dynamic>.from(sections!.map((x) => x.toJson())),
        "exams": exams == null ? [] : List<dynamic>.from(exams!.map((x) => x.toJson())),
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "max_marks": maxMarks,
        "min_marks": minMarks,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
        "year": year?.toJson(),
      };
}

class Class {
  int? value;
  String? text;
  dynamic ext;

  Class({
    this.value,
    this.text,
    this.ext,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        value: json["Value"],
        text: json["Text"],
        ext: json["Ext"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Text": text,
        "Ext": ext,
      };
}

class ListElement {
  int? studentId;
  String? stName;
  dynamic stRollNum;
  double? obtMarks;
  double? perc;
  double? minMarks;
  double? maxMarks;

  ListElement({
    this.studentId,
    this.stName,
    this.stRollNum,
    this.obtMarks,
    this.perc,
    this.minMarks,
    this.maxMarks,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        studentId: json["st_id"],
        stName: json["st_name"],
        stRollNum: json["st_roll_num"],
        obtMarks: json["obt_marks"],
        perc: json["perc"],
        minMarks: json["min_marks"],
        maxMarks: json["max_marks"],
      );

  Map<String, dynamic> toJson() => {
        "st_name": stName,
        "st_roll_num": stRollNum,
        "obt_marks": obtMarks,
        "perc": perc,
        "min_marks": minMarks,
        "max_marks": maxMarks,
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
