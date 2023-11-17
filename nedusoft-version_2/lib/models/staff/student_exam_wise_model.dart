// To parse this JSON data, do
//
//     final getStudentExamWisePerformanceData = getStudentExamWisePerformanceDataFromJson(jsonString);

import 'dart:convert';

GetStudentExamWisePerformanceData getStudentExamWisePerformanceDataFromJson(String str) => GetStudentExamWisePerformanceData.fromJson(json.decode(str));

String getStudentExamWisePerformanceDataToJson(GetStudentExamWisePerformanceData data) => json.encode(data.toJson());

class GetStudentExamWisePerformanceData {
  int? examId;
  List<Subject>? subjects;
  List<Student>? students;
  List<Exam>? exams;
  double? totMarks;
  int? statusFlag;
  dynamic statusMessage;

  GetStudentExamWisePerformanceData({
    this.examId,
    this.subjects,
    this.students,
    this.exams,
    this.totMarks,
    this.statusFlag,
    this.statusMessage,
  });

  factory GetStudentExamWisePerformanceData.fromJson(Map<String, dynamic> json) => GetStudentExamWisePerformanceData(
        examId: json["exam_id"],
        subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
        students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))),
        exams: json["exams"] == null ? [] : List<Exam>.from(json["exams"]!.map((x) => Exam.fromJson(x))),
        totMarks: json["tot_marks"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "exam_id": examId,
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
        "students": students == null ? [] : List<dynamic>.from(students!.map((x) => x.toJson())),
        "exams": exams == null ? [] : List<dynamic>.from(exams!.map((x) => x.toJson())),
        "tot_marks": totMarks,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}

class Exam {
  int? value;
  String? text;
  dynamic ext;

  Exam({
    this.value,
    this.text,
    this.ext,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
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

class Student {
  int? stId;
  String? stName;
  dynamic stRollNum;

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
  String? subject;
  int? subjectId;
  double? maxMarks;
  double? passMarks;
  double? obtMarks;
  double? passPerc;
  double? subjectPerc;

  Subject({
    this.subject,
    this.subjectId,
    this.maxMarks,
    this.passMarks,
    this.obtMarks,
    this.passPerc,
    this.subjectPerc,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        subject: json["subject"],
        subjectId: json["subject_id"],
        maxMarks: json["max_marks"],
        passMarks: json["pass_marks"],
        obtMarks: json["obt_marks"],
        passPerc: json["pass_perc"],
        subjectPerc: json["subject_perc"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "subject_id": subjectId,
        "max_marks": maxMarks,
        "pass_marks": passMarks,
        "obt_marks": obtMarks,
        "pass_perc": passPerc,
        "subject_perc": subjectPerc,
      };
}
