// To parse this JSON data, do
//
//     final getMarksDropDownModel = getMarksDropDownModelFromMap(jsonString);

import 'dart:convert';

class GetMarksDropDownModel {
  int? statusFlag;
  dynamic statusMessage;
  dynamic defaultValue;
  dynamic defaultText;
  List<ListElement>? list;

  GetMarksDropDownModel({
    this.statusFlag,
    this.statusMessage,
    this.defaultValue,
    this.defaultText,
    this.list,
  });

  factory GetMarksDropDownModel.fromJson(Map<String, dynamic> json) => GetMarksDropDownModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: List<ListElement>.from(json["List"].map((x) => ListElement.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "defaultValue": defaultValue,
  //       "defaultText": defaultText,
  //       "List": List<dynamic>.from(list.map((x) => x.toMap())),
  //     };
}

class ListElement {
  int? value;
  String? text;
  dynamic ext;

  ListElement({
    this.value,
    this.text,
    this.ext,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        value: json["Value"],
        text: json["Text"],
        ext: json["Ext"],
      );

  Map<String, dynamic> toMap() => {
        "Value": value,
        "Text": text,
        "Ext": ext,
      };
}

class GetStudentExamList {
  List<ExamList>? examList;
  int? statusFlag;
  String? statusMessage;

  GetStudentExamList({
    this.examList,
    this.statusFlag,
    this.statusMessage,
  });

  factory GetStudentExamList.fromJson(Map<String, dynamic> json) => GetStudentExamList(
        examList: List<ExamList>.from(json["ExamList"].map((x) => ExamList.fromMap(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  // Map<String, dynamic> toMap() => {
  //     "ExamList": List<dynamic>.from(examList.map((x) => x.toMap())),
  //     "statusFlag": statusFlag,
  //     "statusMessage": statusMessage,
  // };
}

class ExamList {
  int? value;
  String? text;
  dynamic ext;

  ExamList({
    this.value,
    this.text,
    this.ext,
  });

  factory ExamList.fromMap(Map<String, dynamic> json) => ExamList(
        value: json["Value"],
        text: json["Text"],
        ext: json["Ext"],
      );

  // Map<String, dynamic> toMap() => {
  //     "Value": value,
  //     "Text": text,
  //     "Ext": ext,
  // };
}

class GetStudentMarksList {
  List<MarksList>? marksList;
  int? statusFlag;
  String? statusMessage;
  dynamic maxmark;
  dynamic passmark;

  GetStudentMarksList({
    this.marksList,
    this.statusFlag,
    this.statusMessage,
    this.maxmark,
    this.passmark,
  });

  factory GetStudentMarksList.fromJson(Map<String, dynamic> json) => GetStudentMarksList(
        marksList: List<MarksList>.from(json["MarksList"].map((x) => MarksList.fromJson(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        maxmark: json["maxmark"],
        passmark: json["passmark"],
      );

  // Map<String, dynamic> toMap() => {
  //     "MarksList": List<dynamic>.from(marksList.map((x) => x.toMap())),
  //     "statusFlag": statusFlag,
  //     "statusMessage": statusMessage,
  //     "maxmark": maxmark,
  //     "passmark": passmark,
  // };
}

class MarksList {
  int? mId;
  int? classId;
  int? subjectid;
  int? facultyId;
  int? examid;
  int? assesment;
  DateTime? issueDate;
  dynamic startDate;
  int? studentid;
  dynamic subjects;
  dynamic actualmarks;
  dynamic marksObtained;
  dynamic marksPerObtained;
  dynamic perc;
  dynamic fPerc;
  dynamic max;
  dynamic maxmark;
  dynamic passmark;
  double? percentage;
  String? status;
  dynamic classOrig;
  dynamic brcode;
  dynamic cmpid;
  dynamic stats;
  int? yearId;
  dynamic yId;
  dynamic admissionNo;
  dynamic rollNo;
  dynamic firstName;
  String? facultyName;
  dynamic sectionid;
  dynamic fromDate;
  dynamic toDate;
  String? examName;
  String? subName;
  dynamic section;
  dynamic marksList;
  dynamic sasa;
  dynamic subject;
  dynamic marksListClass;
  dynamic exam;
  dynamic assesmentName;
  dynamic examTypeId;
  dynamic marksattnFlag;
  int? loginId;
  dynamic loginName;
  dynamic password;
  dynamic token;
  dynamic rowtotal;
  dynamic gradeAPlus;
  dynamic gradeA;
  dynamic gradeBPlus;
  dynamic gradeB;
  dynamic gradeC;
  dynamic gradeCPlus;
  dynamic grade;
  dynamic lanFlag;
  dynamic inwordsamt;
  dynamic totalAmount;
  dynamic totalMarks;
  dynamic type;
  bool? isCombined;
  dynamic semesterId;
  dynamic subDependentId;
  dynamic depSubject;
  dynamic sectionsName;
  dynamic clgcode;
  bool? isCreate;
  dynamic subjectList;
  dynamic list;
  dynamic grade1;
  dynamic orderId;
  bool? isPresent;
  String? percentageStr;
  dynamic descriptor;

  MarksList({
    this.mId,
    this.classId,
    this.subjectid,
    this.facultyId,
    this.examid,
    this.assesment,
    this.issueDate,
    this.startDate,
    this.studentid,
    this.subjects,
    this.actualmarks,
    this.marksObtained,
    this.marksPerObtained,
    this.perc,
    this.fPerc,
    this.max,
    this.maxmark,
    this.passmark,
    this.percentage,
    this.status,
    this.classOrig,
    this.brcode,
    this.cmpid,
    this.stats,
    this.yearId,
    this.yId,
    this.admissionNo,
    this.rollNo,
    this.firstName,
    this.facultyName,
    this.sectionid,
    this.fromDate,
    this.toDate,
    this.examName,
    this.subName,
    this.section,
    this.marksList,
    this.sasa,
    this.subject,
    this.marksListClass,
    this.exam,
    this.assesmentName,
    this.examTypeId,
    this.marksattnFlag,
    this.loginId,
    this.loginName,
    this.password,
    this.token,
    this.rowtotal,
    this.gradeAPlus,
    this.gradeA,
    this.gradeBPlus,
    this.gradeB,
    this.gradeC,
    this.gradeCPlus,
    this.grade,
    this.lanFlag,
    this.inwordsamt,
    this.totalAmount,
    this.totalMarks,
    this.type,
    this.isCombined,
    this.semesterId,
    this.subDependentId,
    this.depSubject,
    this.sectionsName,
    this.clgcode,
    this.isCreate,
    this.subjectList,
    this.list,
    this.grade1,
    this.orderId,
    this.isPresent,
    this.percentageStr,
    this.descriptor,
  });

  factory MarksList.fromJson(Map<String, dynamic> json) => MarksList(
        mId: json["MId"],
        classId: json["classId"],
        subjectid: json["subjectid"],
        facultyId: json["facultyId"],
        examid: json["examid"],
        assesment: json["Assesment"],
        issueDate: DateTime.parse(json["IssueDate"]),
        startDate: json["StartDate"],
        studentid: json["studentid"],
        subjects: json["Subjects"],
        actualmarks: json["actualmarks"],
        marksObtained: json["marksObtained"],
        marksPerObtained: json["marksPerObtained"],
        perc: json["Perc"],
        fPerc: json["FPerc"],
        max: json["max"],
        maxmark: json["maxmark"],
        passmark: json["passmark"],
        percentage: json["percentage"].toDouble(),
        status: json["status"],
        classOrig: json["ClassOrig"],
        brcode: json["brcode"],
        cmpid: json["cmpid"],
        stats: json["stats"],
        yearId: json["YearId"],
        yId: json["YId"],
        admissionNo: json["AdmissionNo"],
        rollNo: json["RollNo"],
        firstName: json["FirstName"],
        facultyName: json["FacultyName"],
        sectionid: json["sectionid"],
        fromDate: json["FromDate"],
        toDate: json["ToDate"],
        examName: json["ExamName"],
        subName: json["SubName"],
        section: json["Section"],
        marksList: json["MarksList"],
        sasa: json["sasa"],
        subject: json["Subject"],
        marksListClass: json["Class"],
        exam: json["Exam"],
        assesmentName: json["AssesmentName"],
        examTypeId: json["ExamTypeId"],
        marksattnFlag: json["Marksattn_flag"],
        loginId: json["LoginId"],
        loginName: json["LoginName"],
        password: json["Password"],
        token: json["token"],
        rowtotal: json["rowtotal"],
        gradeAPlus: json["GradeAPlus"],
        gradeA: json["GradeA"],
        gradeBPlus: json["GradeBPlus"],
        gradeB: json["GradeB"],
        gradeC: json["GradeC"],
        gradeCPlus: json["GradeCPlus"],
        grade: json["grade"],
        lanFlag: json["Lan_Flag"],
        inwordsamt: json["Inwordsamt"],
        totalAmount: json["TotalAmount"],
        totalMarks: json["TotalMarks"],
        type: json["Type"],
        isCombined: json["IsCombined"],
        semesterId: json["SemesterId"],
        subDependentId: json["subDependentId"],
        depSubject: json["DepSubject"],
        sectionsName: json["SectionsName"],
        clgcode: json["Clgcode"],
        isCreate: json["IsCreate"],
        subjectList: json["SubjectList"],
        list: json["list"],
        grade1: json["grade1"],
        orderId: json["OrderId"],
        isPresent: json["is_present"],
        percentageStr: json["percentage_str"],
        descriptor: json["Descriptor"],
      );

  Map<String, dynamic> toMap() => {
        "MId": mId,
        "classId": classId,
        "subjectid": subjectid,
        "facultyId": facultyId,
        "examid": examid,
        "Assesment": assesment,
        "IssueDate": issueDate!.toIso8601String(),
        "StartDate": startDate,
        "studentid": studentid,
        "Subjects": subjects,
        "actualmarks": actualmarks,
        "marksObtained": marksObtained,
        "marksPerObtained": marksPerObtained,
        "Perc": perc,
        "FPerc": fPerc,
        "max": max,
        "maxmark": maxmark,
        "passmark": passmark,
        "percentage": percentage,
        "status": status,
        "ClassOrig": classOrig,
        "brcode": brcode,
        "cmpid": cmpid,
        "stats": stats,
        "YearId": yearId,
        "YId": yId,
        "AdmissionNo": admissionNo,
        "RollNo": rollNo,
        "FirstName": firstName,
        "FacultyName": facultyName,
        "sectionid": sectionid,
        "FromDate": fromDate,
        "ToDate": toDate,
        "ExamName": examName,
        "SubName": subName,
        "Section": section,
        "MarksList": marksList,
        "sasa": sasa,
        "Subject": subject,
        "Class": marksListClass,
        "Exam": exam,
        "AssesmentName": assesmentName,
        "ExamTypeId": examTypeId,
        "Marksattn_flag": marksattnFlag,
        "LoginId": loginId,
        "LoginName": loginName,
        "Password": password,
        "token": token,
        "rowtotal": rowtotal,
        "GradeAPlus": gradeAPlus,
        "GradeA": gradeA,
        "GradeBPlus": gradeBPlus,
        "GradeB": gradeB,
        "GradeC": gradeC,
        "GradeCPlus": gradeCPlus,
        "grade": grade,
        "Lan_Flag": lanFlag,
        "Inwordsamt": inwordsamt,
        "TotalAmount": totalAmount,
        "TotalMarks": totalMarks,
        "Type": type,
        "IsCombined": isCombined,
        "SemesterId": semesterId,
        "subDependentId": subDependentId,
        "DepSubject": depSubject,
        "SectionsName": sectionsName,
        "Clgcode": clgcode,
        "IsCreate": isCreate,
        "SubjectList": subjectList,
        "list": list,
        "grade1": grade1,
        "OrderId": orderId,
        "is_present": isPresent,
        "percentage_str": percentageStr,
        "Descriptor": descriptor,
      };
}
