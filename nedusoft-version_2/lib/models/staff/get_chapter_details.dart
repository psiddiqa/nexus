// To parse this JSON data, do
//
//     final getChapterDetailModel = getChapterDetailModelFromMap(jsonString);

import 'dart:convert';

import '../getall_subject_model.dart';
import '../getattendance_model.dart';

// etailModelToMap(GetChapterDetailModel data) => json.encode(data.toMap());

class GetChapterDetailModel {
  dynamic input;
  Output? output;
  Chapter? chapter;
  Dropdowns? dropdowns;

  GetChapterDetailModel({
    this.input,
    this.output,
    this.chapter,
    this.dropdowns,
  });

  factory GetChapterDetailModel.fromJson(Map<String, dynamic> json) => GetChapterDetailModel(
        input: json["input"],
        output: Output.fromMap(json["output"]),
        chapter: Chapter.fromMap(json["chapter"]),
        dropdowns: Dropdowns.fromMap(json["dropdowns"]),
      );

  // Map<String, dynamic> toMap() => {
  //       "input": input,
  //       "output": output.toMap(),
  //       "chapter": chapter.toMap(),
  //       "dropdowns": dropdowns.toMap(),
  //     };
}

class Chapter {
  int? chapterId;
  int? subjectId;
  String? chapterName;
  bool? editFlag;
  dynamic auth;
  dynamic chapterList;
  dynamic cmpid;
  dynamic brcode;
  dynamic createdOn;
  dynamic createdBy;
  dynamic updatedOn;
  dynamic updatedBy;
  bool? isActive;
  String? chapterNo;
  String? subjectName;
  bool? isCombined;
  int? semesterId;
  String? semester;
  int? yearId;

  Chapter({
    this.chapterId,
    this.subjectId,
    this.chapterName,
    this.editFlag,
    this.auth,
    this.chapterList,
    this.cmpid,
    this.brcode,
    this.createdOn,
    this.createdBy,
    this.updatedOn,
    this.updatedBy,
    this.isActive,
    this.chapterNo,
    this.subjectName,
    this.isCombined,
    this.semesterId,
    this.semester,
    this.yearId,
  });

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
        chapterId: json["ChapterId"],
        subjectId: json["SubjectId"],
        chapterName: json["ChapterName"],
        editFlag: json["EditFlag"],
        auth: json["Auth"],
        chapterList: json["ChapterList"],
        cmpid: json["cmpid"],
        brcode: json["brcode"],
        createdOn: json["CreatedOn"],
        createdBy: json["CreatedBy"],
        updatedOn: json["UpdatedOn"],
        updatedBy: json["UpdatedBy"],
        isActive: json["IsActive"],
        chapterNo: json["ChapterNo"],
        subjectName: json["SubjectName"],
        isCombined: json["IsCombined"],
        semesterId: json["SemesterId"],
        semester: json["Semester"],
        yearId: json["yearId"],
      );

  // Map<String, dynamic> toMap() => {
  //       "ChapterId": chapterId,
  //       "SubjectId": subjectId,
  //       "ChapterName": chapterName,
  //       "EditFlag": editFlag,
  //       "Auth": auth,
  //       "ChapterList": chapterList,
  //       "cmpid": cmpid,
  //       "brcode": brcode,
  //       "CreatedOn": createdOn,
  //       "CreatedBy": createdBy,
  //       "UpdatedOn": updatedOn,
  //       "UpdatedBy": updatedBy,
  //       "IsActive": isActive,
  //       "ChapterNo": chapterNo,
  //       "SubjectName": subjectName,
  //       "IsCombined": isCombined,
  //       "SemesterId": semesterId,
  //       "Semester": semester,
  //       "yearId": yearId,
  //     };
}

class Dropdowns {
  List<Cl>? cls;
  dynamic sec;
  List<SubjectList>? sub;
  dynamic ses;
  Year? year;
  int? statusFlag;
  dynamic statusMessage;
  bool? isSession;
  dynamic publishers;

  Dropdowns({
    this.cls,
    this.sec,
    this.sub,
    this.ses,
    this.year,
    this.statusFlag,
    this.statusMessage,
    this.isSession,
    this.publishers,
  });

  factory Dropdowns.fromMap(Map<String, dynamic> json) => Dropdowns(
        cls: json["cls"] == null ? null : List<Cl>.from(json["cls"].map((x) => Cl.fromMap(x))),
        sec: json["sec"],
        sub: json["sub"] == null ? null : List<SubjectList>.from(json["sub"].map((x) => SubjectList.fromMap(x))),
        ses: json["ses"],
        year: json["year"] == null ? null : Year.fromMap(json["year"]),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        isSession: json["IsSession"],
        publishers: json["publishers"],
      );
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

  factory Year.fromMap(Map<String, dynamic> json) => Year(
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
        yearList: json["YearList"] == null ? null : List<Year>.from(json["YearList"].map((x) => Year.fromMap(x))),
        statusMessage: json["statusMessage"],
        loginId: json["LoginId"],
        loginName: json["LoginName"],
        password: json["Password"],
        statusFlag: json["statusFlag"],
        token: json["token"],
      );

  // Map<String, dynamic> toMap() => {
  //       "YearID": yearId,
  //       "YearName": yearName,
  //       "brcode": brcode,
  //       "cmpid": cmpid,
  //       "IsActive": isActive,
  //       "CreatedBy": createdBy,
  //       "CreatedOn": createdOn,
  //       "UpdatedBy": updatedBy,
  //       "UpdatedOn": updatedOn,
  //       "IsCurrent": isCurrent,
  //       "YearList": List<dynamic>.from(yearList.map((x) => x.toMap())),
  //       "statusMessage": statusMessage,
  //       "LoginId": loginId,
  //       "LoginName": loginName,
  //       "Password": password,
  //       "statusFlag": statusFlag,
  //       "token": token,
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
