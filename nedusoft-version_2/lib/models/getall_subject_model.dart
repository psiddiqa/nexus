// To parse this JSON data, do
//
//     final getAllSubjectModal = getAllSubjectModalFromMap(jsonString);

import 'dart:convert';

import 'package:nedusoft/models/getattendance_model.dart';

class GetAllSubjectModal {
  int? subjectId;
  dynamic subject;
  dynamic subjectCode;
  dynamic subdependentId;
  dynamic classid;
  dynamic className;
  dynamic marksattnFlag;
  dynamic branchid;
  dynamic brcode;
  dynamic cmpid;
  dynamic lanflag;
  dynamic isActive;
  dynamic createdBy;
  double? marksObtained;
  dynamic createdOn;
  dynamic updatedBy;
  dynamic updatedOn;
  dynamic combinationId;
  dynamic subjects;
  dynamic employeeTypeId;
  dynamic branchName;
  dynamic facultySubjectId;
  bool? isSelected;
  dynamic facultyId;
  List<SubjectList>? subjectList;
  dynamic authentic;
  dynamic obtainMarks;
  int? studentId;
  int? statusFlag;
  dynamic statusMessage;
  int? loginId;
  dynamic loginName;
  dynamic password;
  dynamic token;

  GetAllSubjectModal({
    this.subjectId,
    this.subject,
    this.subjectCode,
    this.subdependentId,
    this.classid,
    this.className,
    this.marksattnFlag,
    this.branchid,
    this.brcode,
    this.cmpid,
    this.lanflag,
    this.isActive,
    this.createdBy,
    this.marksObtained,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.combinationId,
    this.subjects,
    this.employeeTypeId,
    this.branchName,
    this.facultySubjectId,
    this.isSelected,
    this.facultyId,
    this.subjectList,
    this.authentic,
    this.obtainMarks,
    this.studentId,
    this.statusFlag,
    this.statusMessage,
    this.loginId,
    this.loginName,
    this.password,
    this.token,
  });

  factory GetAllSubjectModal.fromJson(Map<String, dynamic> json) => GetAllSubjectModal(
        subjectId: json["SubjectId"],
        subject: json["Subject"],
        subjectCode: json["SubjectCode"],
        subdependentId: json["SubdependentId"],
        classid: json["Classid"],
        className: json["ClassName"],
        marksattnFlag: json["Marksattn_flag"],
        branchid: json["Branchid"],
        brcode: json["brcode"],
        cmpid: json["cmpid"],
        lanflag: json["Lanflag"],
        isActive: json["isActive"],
        createdBy: json["CreatedBy"],
        marksObtained: json["marksObtained"],
        createdOn: json["CreatedOn"],
        updatedBy: json["UpdatedBy"],
        updatedOn: json["UpdatedOn"],
        combinationId: json["CombinationID"],
        subjects: json["subjects"],
        employeeTypeId: json["EmployeeTypeId"],
        branchName: json["BranchName"],
        facultySubjectId: json["FacultySubjectID"],
        isSelected: json["isSelected"],
        facultyId: json["FacultyID"],
        subjectList: List<SubjectList>.from(json["SubjectList"].map((x) => SubjectList.fromMap(x))),
        authentic: json["Authentic"],
        obtainMarks: json["ObtainMarks"],
        studentId: json["StudentID"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        loginId: json["LoginId"],
        loginName: json["LoginName"],
        password: json["Password"],
        token: json["token"],
      );

  // Map<String, dynamic> toMap() => {
  //       "SubjectId": subjectId,
  //       "Subject": subject,
  //       "SubjectCode": subjectCode,
  //       "SubdependentId": subdependentId,
  //       "Classid": classid,
  //       "ClassName": className,
  //       "Marksattn_flag": marksattnFlag,
  //       "Branchid": branchid,
  //       "brcode": brcode,
  //       "cmpid": cmpid,
  //       "Lanflag": lanflag,
  //       "isActive": isActive,
  //       "CreatedBy": createdBy,
  //       "marksObtained": marksObtained,
  //       "CreatedOn": createdOn,
  //       "UpdatedBy": updatedBy,
  //       "UpdatedOn": updatedOn,
  //       "CombinationID": combinationId,
  //       "subjects": subjects,
  //       "EmployeeTypeId": employeeTypeId,
  //       "BranchName": branchName,
  //       "FacultySubjectID": facultySubjectId,
  //       "isSelected": isSelected,
  //       "FacultyID": facultyId,
  //       "SubjectList": List<dynamic>.from(subjectList.map((x) => x.toMap())),
  //       "Authentic": authentic,
  //       "ObtainMarks": obtainMarks,
  //       "StudentID": studentId,
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "LoginId": loginId,
  //       "LoginName": loginName,
  //       "Password": password,
  //       "token": token,
  //     };
}

class SubjectList {
  int? value;
  String? text;
  dynamic ext;

  SubjectList({
    this.value,
    this.text,
    this.ext,
  });

  factory SubjectList.fromMap(Map<String, dynamic> json) => SubjectList(
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

class GetAllClassesModel {
  List<Cl>? classList;

  GetAllClassesModel({this.classList});

  factory GetAllClassesModel.fromJson(Map<String, dynamic> json) => GetAllClassesModel(
        classList: json["ClassList"] == null ? null : List<Cl>.from(json["ClassList"].map((x) => Cl.fromMap(x))),
      );
}
