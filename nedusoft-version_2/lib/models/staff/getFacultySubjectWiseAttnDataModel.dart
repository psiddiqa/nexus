// To parse this JSON data, do
//
//     final getFacultySubjectWiseAttnDataModel = getFacultySubjectWiseAttnDataModelFromJson(jsonString);

import 'dart:convert';

GetFacultySubjectWiseAttnDataModel getFacultySubjectWiseAttnDataModelFromJson(String str) => GetFacultySubjectWiseAttnDataModel.fromJson(json.decode(str));

String getFacultySubjectWiseAttnDataModelToJson(GetFacultySubjectWiseAttnDataModel data) => json.encode(data.toJson());

class GetFacultySubjectWiseAttnDataModel {
  List<ListElement>? list;
  int? statusFlag;
  dynamic statusMessage;

  GetFacultySubjectWiseAttnDataModel({
    this.list,
    this.statusFlag,
    this.statusMessage,
  });

  factory GetFacultySubjectWiseAttnDataModel.fromJson(Map<String, dynamic> json) => GetFacultySubjectWiseAttnDataModel(
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}

class ListElement {
  String? stName;
  String? rollNum;
  double? classTkn;
  double? classAttn;
  double? classAbs;
  double? totLeaves;
  double? classAttnPer;
  int? studentId;

  ListElement({
    this.stName,
    this.rollNum,
    this.classTkn,
    this.classAttn,
    this.classAbs,
    this.totLeaves,
    this.classAttnPer,
    this.studentId,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        stName: json["st_name"],
        rollNum: json["roll_num"],
        classTkn: json["class_tkn"],
        classAttn: json["class_attn"],
        classAbs: json["class_abs"],
        totLeaves: json["tot_leaves"],
        classAttnPer: json["class_attn_per"],
        studentId: json["student_id"],
      );

  Map<String, dynamic> toJson() => {
        "st_name": stName,
        "roll_num": rollNum,
        "class_tkn": classTkn,
        "class_attn": classAttn,
        "class_abs": classAbs,
        "tot_leaves": totLeaves,
        "class_attn_per": classAttnPer,
        "student_id": studentId,
      };
}

GetFacultySubjectAttnDataModel getFacultySubjectAttnDataModelFromJson(String str) => GetFacultySubjectAttnDataModel.fromJson(json.decode(str));

String getFacultySubjectAttnDataModelToJson(GetFacultySubjectAttnDataModel data) => json.encode(data.toJson());

class GetFacultySubjectAttnDataModel {
  List<Element>? list;
  num? totClasses;
  int? statusFlag;
  dynamic statusMessage;
  Year? year;

  GetFacultySubjectAttnDataModel({
    this.list,
    this.totClasses,
    this.statusFlag,
    this.statusMessage,
    this.year,
  });

  factory GetFacultySubjectAttnDataModel.fromJson(Map<String, dynamic> json) => GetFacultySubjectAttnDataModel(
        list: json["list"] == null ? [] : List<Element>.from(json["list"]!.map((x) => Element.fromJson(x))),
        totClasses: json["tot_classes"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        year: json["year"] == null ? null : Year.fromJson(json["year"]),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "tot_classes": totClasses,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
        "year": year,
      };
}

class Element {
  String? subject;
  String? className;
  num? subjectId;
  num? classId;
  num? totClasses;
  num? clsAlloted;
  num? clsTakenPerc;
  num? clsPendingPer;

  Element({
    this.subject,
    this.className,
    this.subjectId,
    this.classId,
    this.totClasses,
    this.clsAlloted,
    this.clsTakenPerc,
    this.clsPendingPer,
  });

  factory Element.fromJson(Map<String, dynamic> json) => Element(
        subject: json["subject"],
        className: json["class_name"],
        subjectId: json["subject_id"],
        classId: json["class_id"],
        totClasses: json["tot_classes"],
        clsAlloted: json["cls_alloted"],
        clsTakenPerc: json["cls_taken_perc"],
        clsPendingPer: json["cls_pending_per"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "class_name": className,
        "subject_id": subjectId,
        "class_id": classId,
        "tot_classes": totClasses,
        "cls_alloted": clsAlloted,
        "cls_taken_perc": clsTakenPerc,
        "cls_pending_per": clsPendingPer,
      };
}

GetFacultyStudentCalendarDaysModel getFacultyStudentCalendarDaysModelFromJson(String str) => GetFacultyStudentCalendarDaysModel.fromJson(json.decode(str));

String getFacultyStudentCalendarDaysModelToJson(GetFacultyStudentCalendarDaysModel data) => json.encode(data.toJson());

class GetFacultyStudentCalendarDaysModel {
  List<Student>? students;
  List<Subject>? subjects;
  List<CalendarDay>? calendarDays;
  int? statusFlag;
  dynamic statusMessage;
  bool? isSubject;

  GetFacultyStudentCalendarDaysModel({this.students, this.subjects, this.calendarDays, this.statusFlag, this.statusMessage, this.isSubject});

  factory GetFacultyStudentCalendarDaysModel.fromJson(Map<String, dynamic> json) => GetFacultyStudentCalendarDaysModel(students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))), subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))), calendarDays: json["calendar_days"] == null ? [] : List<CalendarDay>.from(json["calendar_days"]!.map((x) => CalendarDay.fromJson(x))), statusFlag: json["statusFlag"], statusMessage: json["statusMessage"], isSubject: json["is_sub_req"]);

  Map<String, dynamic> toJson() => {
        "students": students == null ? [] : List<dynamic>.from(students!.map((x) => x.toJson())),
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
        // "calendar_days": calendarDays == null ? [] : List<dynamic>.from(calendarDays!.map((x) => x.toJson())),
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}

class CalendarDay {
  DateTime? date;
  String? status;

  CalendarDay({
    this.date,
    this.status,
  });

  factory CalendarDay.fromJson(Map<String, dynamic> json) => CalendarDay(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
      );
}

class Student {
  int? stId;
  String? stName;
  String? stRollNum;

  Student({
    this.stId,
    this.stName,
    this.stRollNum,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        stId: json["st_id"],
        stName: json["st_name"],
        stRollNum: json["st_roll_num"],
      );

  Map<String, dynamic> toJson() => {
        "st_id": stId,
        "st_name": stName,
        "st_roll_num": stRollNum,
      };
}

class Subject {
  int? value;
  String? text;
  dynamic ext;

  Subject({
    this.value,
    this.text,
    this.ext,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
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
