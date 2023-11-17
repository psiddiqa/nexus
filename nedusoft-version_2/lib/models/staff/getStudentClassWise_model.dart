// To parse this JSON data, do
//
//     final getStudentClassWisePerformanceDataModel = getStudentClassWisePerformanceDataModelFromJson(jsonString);

import 'dart:convert';

GetStudentClassWisePerformanceDataModel getStudentClassWisePerformanceDataModelFromJson(String str) => GetStudentClassWisePerformanceDataModel.fromJson(json.decode(str));

String getStudentClassWisePerformanceDataModelToJson(GetStudentClassWisePerformanceDataModel data) => json.encode(data.toJson());

class GetStudentClassWisePerformanceDataModel {
  Year? years;
  List<Class>? classes;
  dynamic sections;
  dynamic subjects;
  List<ListElement>? list;
  int? statusFlag;
  dynamic statusMessage;

  GetStudentClassWisePerformanceDataModel({
    this.years,
    this.classes,
    this.sections,
    this.subjects,
    this.list,
    this.statusFlag,
    this.statusMessage,
  });

  factory GetStudentClassWisePerformanceDataModel.fromJson(Map<String, dynamic> json) => GetStudentClassWisePerformanceDataModel(
        years: json["years"] == null ? null : Year.fromJson(json["years"]),
        classes: json["classes"] == null ? [] : List<Class>.from(json["classes"]!.map((x) => Class.fromJson(x))),
        sections: json["sections"],
        subjects: json["subjects"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "years": years?.toJson(),
        "classes": classes == null ? [] : List<dynamic>.from(classes!.map((x) => x.toJson())),
        "sections": sections,
        "subjects": subjects,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
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
  String? sectionName;
  List<Grade>? grades;
  int? count;
  String? exam;
  int? sectionId;
  int? examId;
  int? classId;

  ListElement({
    this.sectionName,
    this.grades,
    this.count,
    this.exam,
    this.sectionId,
    this.examId,
    this.classId,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(sectionName: json["section_name"], grades: json["grades"] == null ? [] : List<Grade>.from(json["grades"]!.map((x) => Grade.fromJson(x))), count: json["count"], exam: json["exam"], sectionId: json["section_id"], examId: json["exam_id"], classId: json["class_id"]);

  Map<String, dynamic> toJson() => {
        "section_name": sectionName,
        "grades": grades == null ? [] : List<dynamic>.from(grades!.map((x) => x.toJson())),
        "count": count,
        "exam": exam,
        "section_id": sectionId,
        "exam_id": examId,
      };
}

class Grade {
  String? gradeName;
  String? grade;
  num? percentage;

  Grade({
    this.gradeName,
    this.grade,
    this.percentage,
  });

  factory Grade.fromJson(Map<String, dynamic> json) => Grade(
        gradeName: json["grade_name"],
        grade: json["grade"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        // "grade_name": gradeNameValues.reverse[gradeName],
        "grade": grade,
        "percentage": percentage,
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
