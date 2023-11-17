// To parse this JSON data, do
//
//     final editLessonUpdateModel = editLessonUpdateModelFromMap(jsonString);

import 'dart:convert';

import 'package:nedusoft/models/staff/session_model.dart';

import '../getall_section_model.dart';
import '../getall_subject_model.dart';
import '../getattendance_model.dart';

class EditLessonUpdateModel {
  int? topicId;
  DateTime? lessonDate;
  int? loginId;
  int? sectionId;
  int? classId;
  int? subjectId;
  int? facultyId;
  dynamic facultyName;
  String? className;
  dynamic subjectName;
  int? yearId;
  String? topic;
  String? notes;
  String? brcode;
  String? cmpid;
  int? noOfSessions;
  dynamic sessions;
  String? extension;
  dynamic data;
  dynamic imageNo;
  bool? isActive;
  dynamic createdBy;
  dynamic createdOn;
  dynamic updatedBy;
  dynamic updatedOn;
  dynamic authenticate;
  dynamic lessonList;
  dynamic lessonUpdateReport;
  Year? year;
  int? personid;
  dynamic base64String;
  dynamic loginName;
  dynamic password;
  dynamic token;
  int? statusFlag;
  dynamic statusMessage;
  dynamic lessonLst;
  dynamic file;
  dynamic fileInBytes;
  List<Cl>? classList;
  List<SectionList>? sectionList;
  List<SubjectList>? subList;
  SessionModelForStaff? sessionList;
  String? section;
  String? subject;
  String? hour;
  dynamic editLessonUpdateModelClass;
  dynamic subtopics;
  dynamic chapterId;
  dynamic sessionId;
  dynamic chapter;
  dynamic session;
  dynamic chapters;
  dynamic sessionlist;
  dynamic subtopiclist;
  bool? isCombined;
  dynamic subTopicList;
  dynamic combinedClass;
  String? url;

  EditLessonUpdateModel({
    this.topicId,
    this.lessonDate,
    this.loginId,
    this.sectionId,
    this.classId,
    this.subjectId,
    this.facultyId,
    this.facultyName,
    this.className,
    this.subjectName,
    this.yearId,
    this.topic,
    this.notes,
    this.brcode,
    this.cmpid,
    this.noOfSessions,
    this.sessions,
    this.extension,
    this.data,
    this.imageNo,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.authenticate,
    this.lessonList,
    this.lessonUpdateReport,
    this.year,
    this.personid,
    this.base64String,
    this.loginName,
    this.password,
    this.token,
    this.statusFlag,
    this.statusMessage,
    this.lessonLst,
    this.file,
    this.fileInBytes,
    this.classList,
    this.sectionList,
    this.subList,
    this.sessionList,
    this.section,
    this.subject,
    this.hour,
    this.editLessonUpdateModelClass,
    this.subtopics,
    this.chapterId,
    this.sessionId,
    this.chapter,
    this.session,
    this.chapters,
    this.sessionlist,
    this.subtopiclist,
    this.isCombined,
    this.subTopicList,
    this.combinedClass,
    this.url,
  });

  factory EditLessonUpdateModel.fromJson(Map<String, dynamic> json) => EditLessonUpdateModel(
        topicId: json["TopicId"],
        lessonDate: DateTime.parse(json["LessonDate"]),
        loginId: json["LoginId"],
        sectionId: json["SectionId"],
        classId: json["ClassId"],
        subjectId: json["SubjectId"],
        facultyId: json["FacultyId"],
        facultyName: json["FacultyName"],
        className: json["ClassName"],
        subjectName: json["SubjectName"],
        yearId: json["YearId"],
        topic: json["Topic"],
        notes: json["Notes"],
        brcode: json["brcode"],
        cmpid: json["cmpid"],
        noOfSessions: json["NoOfSessions"],
        sessions: json["Sessions"],
        extension: json["Extension"],
        data: json["Data"],
        imageNo: json["ImageNo"],
        isActive: json["isActive"],
        createdBy: json["CreatedBy"],
        createdOn: json["CreatedOn"],
        updatedBy: json["UpdatedBy"],
        updatedOn: json["UpdatedOn"],
        authenticate: json["authenticate"],
        lessonList: json["LessonList"],
        lessonUpdateReport: json["LessonUpdateReport"],
        year: Year.fromMap(json["year"]),
        personid: json["Personid"],
        base64String: json["Base64String"],
        loginName: json["LoginName"],
        password: json["Password"],
        token: json["token"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        lessonLst: json["LessonLst"],
        file: json["file"],
        fileInBytes: json["FileInBytes"],
        classList: json["ClassList"] == null ? null : List<Cl>.from(json["ClassList"].map((x) => Cl.fromMap(x))),
        sectionList: json["SectionList"] == null ? null : List<SectionList>.from(json["SectionList"].map((x) => SectionList.fromMap(x))),
        subList: json["SubList"] == null ? null : List<SubjectList>.from(json["SubList"].map((x) => SubjectList.fromMap(x))),
        sessionList: json["ClassList"] == null ? null : SessionModelForStaff.fromJson(json["SessionList"]),
        section: json["section"],
        subject: json["subject"],
        hour: json["hour"],
        editLessonUpdateModelClass: json["Class"],
        subtopics: json["subtopics"],
        chapterId: json["ChapterId"],
        sessionId: json["SessionId"],
        chapter: json["Chapter"],
        session: json["Session"],
        chapters: json["chapters"],
        sessionlist: json["sessionlist"],
        subtopiclist: json["subtopiclist"],
        isCombined: json["IsCombined"],
        subTopicList: json["SubTopic_list"],
        combinedClass: json["CombinedClass"],
        url: json["Url"],
      );

  // Map<String, dynamic> toMap() => {
  //       "TopicId": topicId,
  //       "LessonDate": lessonDate!.toIso8601String(),
  //       "LoginId": loginId,
  //       "SectionId": sectionId,
  //       "ClassId": classId,
  //       "SubjectId": subjectId,
  //       "FacultyId": facultyId,
  //       "FacultyName": facultyName,
  //       "ClassName": className,
  //       "SubjectName": subjectName,
  //       "YearId": yearId,
  //       "Topic": topic,
  //       "Notes": notes,
  //       "brcode": brcode,
  //       "cmpid": cmpid,
  //       "NoOfSessions": noOfSessions,
  //       "Sessions": sessions,
  //       "Extension": extension,
  //       "Data": data,
  //       "ImageNo": imageNo,
  //       "isActive": isActive,
  //       "CreatedBy": createdBy,
  //       "CreatedOn": createdOn,
  //       "UpdatedBy": updatedBy,
  //       "UpdatedOn": updatedOn,
  //       "authenticate": authenticate,
  //       "LessonList": lessonList,
  //       "LessonUpdateReport": lessonUpdateReport,
  //       "Year": year,
  //       "Personid": personid,
  //       "Base64String": base64String,
  //       "LoginName": loginName,
  //       "Password": password,
  //       "token": token,
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "LessonLst": lessonLst,
  //       "file": file,
  //       "FileInBytes": fileInBytes,
  //       "ClassList": List<dynamic>.from(classList.map((x) => x.toMap())),
  //       "SectionList": List<dynamic>.from(sectionList.map((x) => x.toMap())),
  //       "SubList": List<dynamic>.from(subList.map((x) => x.toMap())),
  //       "SessionList": sessionList.toMap(),
  //       "section": section,
  //       "subject": subject,
  //       "hour": hour,
  //       "Class": editLessonUpdateModelClass,
  //       "subtopics": subtopics,
  //       "ChapterId": chapterId,
  //       "SessionId": sessionId,
  //       "Chapter": chapter,
  //       "Session": session,
  //       "chapters": chapters,
  //       "sessionlist": sessionlist,
  //       "subtopiclist": subtopiclist,
  //       "IsCombined": isCombined,
  //       "SubTopic_list": subTopicList,
  //       "CombinedClass": combinedClass,
  //       "Url": url,
  //     };
}
