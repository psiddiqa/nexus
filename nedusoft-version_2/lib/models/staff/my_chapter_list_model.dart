// To parse this JSON data, do
//
//     final myChaptersListModel = myChaptersListModelFromMap(jsonString);

import 'dart:convert';

class MyChaptersListModel {
  dynamic input;
  Output? output;
  Chapter? chapter;
  dynamic dropdowns;

  MyChaptersListModel({
    this.input,
    this.output,
    this.chapter,
    this.dropdowns,
  });

  factory MyChaptersListModel.fromJson(Map<String, dynamic> json) => MyChaptersListModel(
        input: json["input"],
        output: json["output"] == null ? null : Output.fromMap(json["output"]),
        chapter: json["chapter"] == null ? null : Chapter.fromMap(json["chapter"]),
        dropdowns: json["dropdowns"],
      );

  // Map<String, dynamic> toMap() => {
  //       "input": input,
  //       "output": output.toMap(),
  //       "chapter": chapter.toMap(),
  //       "dropdowns": dropdowns,
  //     };
}

class Chapter {
  int? chapterId;
  dynamic subjectId;
  String? chapterName;
  bool? editFlag;
  dynamic auth;
  List<Chapter>? chapterList;
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
  dynamic semesterId;
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
        chapterList: json["ChapterList"] == null ? null : List<Chapter>.from(json["ChapterList"].map((x) => Chapter.fromMap(x))),
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
  //       "ChapterList": List<dynamic>.from(chapterList.map((x) => x.toMap())),
  //       "cmpid": cmpid,
  //       "brcode": brcode,
  //       "CreatedOn": createdOn,
  //       "CreatedBy": createdBy,
  //       "UpdatedOn": updatedOn,
  //       "UpdatedBy": updatedBy,
  //       "IsActive": isActive,
  //       "ChapterNo": chapterNo,
  //       "SubjectName": subjectNameValues.reverse[subjectName],
  //       "IsCombined": isCombined,
  //       "SemesterId": semesterId,
  //       "Semester": semesterValues.reverse[semester],
  //       "yearId": yearId,
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
