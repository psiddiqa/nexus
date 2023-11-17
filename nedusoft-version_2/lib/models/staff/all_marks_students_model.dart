// To parse this JSON data, do
//
//     final allStudentMarksList = allStudentMarksListFromMap(jsonString);

import 'dart:convert';

class AllStudentMarksList {
  List<ListElement>? list;

  Output? output;
  dynamic marks;
  Details? details;

  AllStudentMarksList({
    this.list,
    this.output,
    this.marks,
    this.details,
  });

  factory AllStudentMarksList.fromJson(Map<String, dynamic> json) => AllStudentMarksList(
        list: List<ListElement>.from(json["List"].map((x) => ListElement.fromMap(x))),
        output: Output.fromMap(json["output"]),
        marks: json["marks"],
        details: Details.fromMap(json["details"]),
      );

  // Map<String, dynamic> toMap() => {
  //       "List": List<dynamic>.from(list.map((x) => x.toMap())),
  //       "input": input.toMap(),
  //       "output": output.toMap(),
  //       "marks": marks,
  //       "details": details.toMap(),
  //     };
}

class Details {
  dynamic minmarks;
  dynamic maxmarks;
  dynamic output;

  Details({
    this.minmarks,
    this.maxmarks,
    this.output,
  });

  factory Details.fromMap(Map<String, dynamic> json) => Details(
        minmarks: json["minmarks"],
        maxmarks: json["maxmarks"],
        output: json["output"],
      );

  Map<String, dynamic> toMap() => {
        "minmarks": minmarks,
        "maxmarks": maxmarks,
        "output": output,
      };
}

class ListElement {
  int? studentId;
  int? classId;
  int? subjectId;
  double? marksObtained;
  String? name;
  int? sectionId;
  String? cmpid;
  String? brcode;
  double? percentage;
  dynamic status;
  dynamic rollNo;
  int? examId;
  int? maxMarks;
  double? passMarks;
  int? facultyId;
  int? mid;
  dynamic assesment;
  DateTime? issueDate;

  ListElement({
    this.studentId,
    this.classId,
    this.subjectId,
    this.marksObtained,
    this.name,
    this.sectionId,
    this.cmpid,
    this.brcode,
    this.percentage,
    this.status,
    this.rollNo,
    this.examId,
    this.maxMarks,
    this.passMarks,
    this.facultyId,
    this.mid,
    this.assesment,
    this.issueDate,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        studentId: json["StudentID"],
        classId: json["ClassID"],
        subjectId: json["SubjectID"],
        marksObtained: json["marksObtained"],
        name: json["name"],
        sectionId: json["SectionId"],
        cmpid: json["cmpid"],
        brcode: json["brcode"],
        percentage: json["Percentage"],
        status: json["status"],
        rollNo: json["RollNo"],
        examId: json["ExamId"],
        maxMarks: json["MaxMarks"],
        passMarks: json["PassMarks"],
        facultyId: json["FacultyId"],
        mid: json["Mid"],
        assesment: json["Assesment"],
        issueDate: DateTime.parse(json["IssueDate"]),
      );

  // Map<String, dynamic> toMap() => {
  //       "StudentID": studentId,
  //       "ClassID": classId,
  //       "SubjectID": subjectId,
  //       "marksObtained": marksObtained,
  //       "name": name,
  //       "SectionId": sectionId,
  //       "cmpid": brcodeValues.reverse[cmpid],
  //       "brcode": brcodeValues.reverse[brcode],
  //       "Percentage": percentage,
  //       "status": status,
  //       "RollNo": rollNo,
  //       "ExamId": examId,
  //       "MaxMarks": maxMarks,
  //       "PassMarks": passMarks,
  //       "FacultyId": facultyId,
  //       "Mid": mid,
  //       "Assesment": assesment,
  //       "IssueDate": issueDate.toIso8601String(),
  //     };
}

class Output {
  int? statusFlag;
  String? statusMessage;

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

class AddMarksModel {
  int studentId;
  String markesObtain;
  int? Mid;

  AddMarksModel({required this.studentId, required this.markesObtain, required this.Mid});
  factory AddMarksModel.fromMap(ListElement json) => AddMarksModel(studentId: json.studentId!, markesObtain: json.marksObtained!.toString() ?? "0", Mid: json.mid);

  Map<String, dynamic> toMap() => {
        "StudentID": studentId,
        "marksObtained": markesObtain,
        "Mid": Mid ?? 0,
      };
}

class AllUpdateStudentMarksList {
  List<ListElement>? list;
  Output? output;
  MarksDetails? details;

  AllUpdateStudentMarksList({
    this.list,
    this.output,
    this.details,
  });

  factory AllUpdateStudentMarksList.fromJson(Map<String, dynamic> json) => AllUpdateStudentMarksList(
        list: List<ListElement>.from(json["List"].map((x) => ListElement.fromMap(x))),
        output: Output.fromMap(json["output"]),
        details: json["marks"] == null ? null : MarksDetails.fromMap(json["marks"]),
      );
}

class MarksDetails {
  dynamic minmarks;
  dynamic maxmarks;

  MarksDetails({
    this.minmarks,
    this.maxmarks,
  });

  factory MarksDetails.fromMap(Map<String, dynamic> json) => MarksDetails(
        minmarks: json["MaxMarks"],
        maxmarks: json["PassMarks"],
      );

  // Map<String, dynamic> toMap() => {
  //       "minmarks": minmarks,
  //       "maxmarks": maxmarks,
  //       "output": output,
  //     };
}
