// To parse this JSON data, do
//
//     final lessonUpdateOnPageLoadModel = lessonUpdateOnPageLoadModelFromMap(jsonString);

import 'dart:convert';
import 'dart:developer';

// LessonUpdateOnPageLoadModel lessonUpdateOnPageLoadModelFromMap(String str) => LessonUpdateOnPageLoadModel.fromMap(json.decode(str));

// String lessonUpdateOnPageLoadModelToMap(LessonUpdateOnPageLoadModel data) => json.encode(data.toMap());

class LessonUpdateOnPageLoadModel {
  int? topicId;
  DateTime? lessonDate;
  int? loginId;
  int? sectionId;
  int? classId;
  int? subjectId;
  int? facultyId;
  String? facultyName;
  String? className;
  String? subjectName;
  int? yearId;
  dynamic topic;
  String? notes;
  String? brcode;
  String? cmpid;
  int? noOfSessions;
  String? sessions;
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
  dynamic year;
  int? personid;
  dynamic base64String;
  dynamic loginName;
  dynamic password;
  dynamic token;
  int? statusFlag;
  String? statusMessage;
  String? classes;
  List<LessonUpdateOnPageLoadModel>? lessonLst;
  dynamic file;
  dynamic fileInBytes;
  dynamic classList;
  dynamic sectionList;
  dynamic subList;
  dynamic sessionList;
  dynamic section;
  dynamic subject;
  dynamic hour;
  String? lessonUpdateOnPageLoadModelClass;
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

  LessonUpdateOnPageLoadModel({
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
    this.classes,
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
    this.lessonUpdateOnPageLoadModelClass,
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

  factory LessonUpdateOnPageLoadModel.fromJson(Map<String, dynamic> json) => LessonUpdateOnPageLoadModel(
        topicId: json["TopicId"],
        lessonDate: DateTime.parse(json["LessonDate"]),
        loginId: json["LoginId"],
        sectionId: json["SectionId"],
        classId: json["ClassId"],
        subjectId: json["SubjectId"],
        facultyId: json["FacultyId"],
        facultyName: json["FacultyName"],
        className: json["ClassName"],
        classes: json["Class"],
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
        year: json["Year"],
        personid: json["Personid"],
        base64String: json["Base64String"],
        loginName: json["LoginName"],
        password: json["Password"],
        token: json["token"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        lessonLst: json["LessonLst"] == null ? null : List<LessonUpdateOnPageLoadModel>.from(json["LessonLst"].map((x) {
          log(x.toString());
          return LessonUpdateOnPageLoadModel.fromJson(x);
        })),
        file: json["file"],
        fileInBytes: json["FileInBytes"],
        classList: json["ClassList"],
        sectionList: json["SectionList"],
        subList: json["SubList"],
        sessionList: json["SessionList"],
        section: json["section"],
        subject: json["subject"],
        hour: json["hour"],
        lessonUpdateOnPageLoadModelClass: json["Class"],
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
  //       "LessonDate": lessonDate.toIso8601String(),
  //       "LoginId": loginId,
  //       "SectionId": sectionId,
  //       "ClassId": classId,
  //       "SubjectId": subjectId,
  //       "FacultyId": facultyId,
  //       "FacultyName": facultyNameValues.reverse[facultyName],
  //       "ClassName": classNameValues.reverse[className],
  //       "SubjectName": subjectNameValues.reverse[subjectName],
  //       "YearId": yearId,
  //       "Topic": topic,
  //       "Notes": notes,
  //       "brcode": brcodeValues.reverse[brcode],
  //       "cmpid": brcodeValues.reverse[cmpid],
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
  //       "LessonLst": List<dynamic>.from(lessonLst.map((x) => x.toMap())),
  //       "file": file,
  //       "FileInBytes": fileInBytes,
  //       "ClassList": classList,
  //       "SectionList": sectionList,
  //       "SubList": subList,
  //       "SessionList": sessionList,
  //       "section": section,
  //       "subject": subject,
  //       "hour": hour,
  //       "Class": classValues.reverse[lessonUpdateOnPageLoadModelClass],
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
