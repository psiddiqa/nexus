// To parse this JSON data, do
//
//     final lessonUpdateModel = lessonUpdateModelFromMap(jsonString);

import 'dart:convert';

class LessonUpdateModel {
  List<LessonList>? lessonList;
  int? statusFlag;
  String? statusMessage;

  LessonUpdateModel({
    this.lessonList,
    this.statusFlag,
    this.statusMessage,
  });

  factory LessonUpdateModel.fromJson(Map<String, dynamic> json) => LessonUpdateModel(
        lessonList: List<LessonList>.from(json["LessonList"].map((x) => LessonList.fromMap(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  // Map<String, dynamic> toMap() => {
  //       "LessonList": List<dynamic>.from(lessonList!.map((x) => x.toMap())),
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //     };
}

class LessonList {
  int? topicId;
  DateTime? lessonDate;
  dynamic date;
  int? loginId;
  int? sectionId;
  int? classId;
  int? subjectId;
  int? facultyId;
  String? facultyName;
  String? className;
  String? subjectName;
  dynamic authType;
  int? yearId;
  dynamic yid;
  int? lYearId;
  dynamic topic;
  dynamic url;
  dynamic chatUrl;
  String? notes;
  String? brcode;
  String? cmpid;
  int? noOfSessions;
  String? sessions;
  String? extension;
  dynamic data;
  dynamic imageNo;
  int? allotmentId;
  dynamic session;
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
  String? base64String;
  dynamic auth;
  dynamic total;
  dynamic taken;
  int? employeeId;
  dynamic semesterId;
  dynamic secId;
  dynamic subId;
  dynamic facId;
  dynamic chapterId;
  dynamic subTopics;
  dynamic min;
  dynamic hour;
  dynamic sessionId;
  dynamic chapter;
  dynamic duration;
  bool? isCombined;
  bool? isPublisher;
  bool? addPublisher;
  dynamic publishers;
  dynamic publisherId;
  dynamic branchId;
  int? combinationId;
  String? filepath;

  LessonList({
    this.topicId,
    this.lessonDate,
    this.date,
    this.loginId,
    this.sectionId,
    this.classId,
    this.subjectId,
    this.facultyId,
    this.facultyName,
    this.className,
    this.subjectName,
    this.authType,
    this.yearId,
    this.yid,
    this.lYearId,
    this.topic,
    this.url,
    this.chatUrl,
    this.notes,
    this.brcode,
    this.cmpid,
    this.noOfSessions,
    this.sessions,
    this.extension,
    this.data,
    this.imageNo,
    this.allotmentId,
    this.session,
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
    this.auth,
    this.total,
    this.taken,
    this.employeeId,
    this.semesterId,
    this.secId,
    this.subId,
    this.facId,
    this.chapterId,
    this.subTopics,
    this.min,
    this.hour,
    this.sessionId,
    this.chapter,
    this.duration,
    this.isCombined,
    this.isPublisher,
    this.addPublisher,
    this.publishers,
    this.publisherId,
    this.branchId,
    this.combinationId,
    this.filepath
  });

  factory LessonList.fromMap(Map<String, dynamic> json) => LessonList(
        topicId: json["TopicId"],
        lessonDate: DateTime.parse(json["LessonDate"]),
        date: json["Date"],
        loginId: json["LoginId"],
        sectionId: json["SectionId"],
        classId: json["ClassId"],
        subjectId: json["SubjectId"],
        facultyId: json["FacultyId"],
        facultyName: json["FacultyName"],
        className: json["ClassName"],
        subjectName: json["SubjectName"],
        authType: json["AuthType"],
        yearId: json["YearId"],
        yid: json["YID"],
        lYearId: json["LYearId"],
        topic: json["Topic"],
        url: json["Url"],
        chatUrl: json["ChatUrl"],
        notes: json["Notes"],
        brcode: json["brcode"],
        cmpid: json["cmpid"],
        noOfSessions: json["NoOfSessions"],
        sessions: json["Sessions"],
        extension: json["Extension"],
        data: json["Data"],
        imageNo: json["ImageNo"],
        allotmentId: json["AllotmentId"],
        session: json["Session"],
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
        auth: json["Auth"],
        total: json["Total"],
        taken: json["taken"],
        employeeId: json["EmployeeId"],
        semesterId: json["SemesterId"],
        secId: json["SecId"],
        subId: json["SubId"],
        facId: json["facId"],
        chapterId: json["ChapterId"],
        subTopics: json["sub_topics"],
        min: json["Min"],
        hour: json["Hour"],
        sessionId: json["SessionId"],
        chapter: json["Chapter"],
        duration: json["Duration"],
        isCombined: json["IsCombined"],
        isPublisher: json["IsPublisher"],
        addPublisher: json["AddPublisher"],
        publishers: json["Publishers"],
        publisherId: json["PublisherId"],
        branchId: json["BranchId"],
        combinationId: json["CombinationID"],
        filepath: json["filepath"],
      );

  // Map<String, dynamic> toMap() => {
  //       "TopicId": topicId,
  //       "LessonDate": lessonDate!.toIso8601String(),
  //       "Date": date,
  //       "LoginId": loginId,
  //       "SectionId": sectionId,
  //       "ClassId": classId,
  //       "SubjectId": subjectId,
  //       "FacultyId": facultyId,
  //       "FacultyName": facultyName,
  //       "ClassName": className,
  //       "SubjectName": subjectName,
  //       "AuthType": authType,
  //       "YearId": yearId,
  //       "YID": yid,
  //       "LYearId": lYearId,
  //       "Topic": topic,
  //       "Url": url,
  //       "ChatUrl": chatUrl,
  //       "Notes": notes,
  //       "brcode": brcode,
  //       "cmpid": cmpid,
  //       "NoOfSessions": noOfSessions,
  //       "Sessions": sessions,
  //       "Extension": extension,
  //       "Data": data,
  //       "ImageNo": imageNo,
  //       "AllotmentId": allotmentId,
  //       "Session": session,
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
  //       "Auth": auth,
  //       "Total": total,
  //       "taken": taken,
  //       "EmployeeId": employeeId,
  //       "SemesterId": semesterId,
  //       "SecId": secId,
  //       "SubId": subId,
  //       "facId": facId,
  //       "ChapterId": chapterId,
  //       "sub_topics": subTopics,
  //       "Min": min,
  //       "Hour": hour,
  //       "SessionId": sessionId,
  //       "Chapter": chapter,
  //       "Duration": duration,
  //       "IsCombined": isCombined,
  //       "IsPublisher": isPublisher,
  //       "AddPublisher": addPublisher,
  //       "Publishers": publishers,
  //       "PublisherId": publisherId,
  //       "BranchId": branchId,
  //       "CombinationID": combinationId,
  //     };
}
