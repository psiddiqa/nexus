// To parse this JSON data, do
//
//     final getSpecificAssignmentModel = getSpecificAssignmentModelFromMap(jsonString);

import 'dart:convert';

import '../get_status_model.dart';
import '../getall_section_model.dart';
import '../getall_subject_model.dart';


class GetSpecificAssignmentModel {
  List<dynamic>? list1;
  dynamic list2;
  Output? output;
  dynamic input;
  Data? data;
  List<Chapter>? classList;
  List<SectionList>? sections;
  List<SubjectList>? subjects;
  List<ListElement>? chapters;

  GetSpecificAssignmentModel({
    this.list1,
    this.list2,
    this.output,
    this.input,
    this.data,
    this.classList,
    this.sections,
    this.subjects,
    this.chapters,
  });

  factory GetSpecificAssignmentModel.fromJson(Map<String, dynamic> json) => GetSpecificAssignmentModel(
        // list1: json["list_1"] ? null:List<dynamic>.from(json["list_1"].map((x) => x)),
        // list2: json["list_2"],
        output: Output.fromMap(json["output"]),
        input: json["input"],
        data: Data.fromMap(json["data"]),
        classList: List<Chapter>.from(json["class_list"].map((x) => Chapter.fromMap(x))),
        sections: List<SectionList>.from(json["sections"].map((x) => SectionList.fromMap(x))),
        subjects: List<SubjectList>.from(json["subjects"].map((x) => SubjectList.fromMap(x))),
        chapters: List<ListElement>.from(json["chapters"].map((x) => ListElement.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "list_1": List<dynamic>.from(list1.map((x) => x)),
  //       "list_2": list2,
  //       "output": output.toMap(),
  //       "input": input,
  //       "data": data.toMap(),
  //       "class_list": List<dynamic>.from(classList.map((x) => x.toMap())),
  //       "sections": List<dynamic>.from(sections.map((x) => x.toMap())),
  //       "subjects": List<dynamic>.from(subjects.map((x) => x.toMap())),
  //       "chapters": List<dynamic>.from(chapters.map((x) => x.toMap())),
  //     };
}

class Chapter {
  int? value;
  String? text;
  dynamic ext;

  Chapter({
    this.value,
    this.text,
    this.ext,
  });

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
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

class Data {
  String? assignNo;
  String? faculty;
  dynamic student;
  String? assignDate;
  String? submiDate;
  String? status;
  String? className;
  String? section;
  String? assignedBy;
  String? subject;
  String? chapter;
  String? assignTopic;
  String? assignNote;
  dynamic updatedBy;
  dynamic remarks;
  dynamic followDate;
  int? assignId;
  bool? isFile;
  int? assignTransId;
  dynamic output;
  DateTime? followUpDate;
  DateTime? date;
  int? chapterId;
  int? subjectId;
  int? sectionId;
  int? classId;
  int? yearId;
  dynamic base64;
  String? fileName;
  dynamic file;
  dynamic statusId;
  dynamic studentId;
  bool? isCombined;
  dynamic submittedDate;
  String? filePath;

  Data({
    this.assignNo,
    this.faculty,
    this.student,
    this.assignDate,
    this.submiDate,
    this.status,
    this.className,
    this.section,
    this.assignedBy,
    this.subject,
    this.chapter,
    this.assignTopic,
    this.assignNote,
    this.updatedBy,
    this.remarks,
    this.followDate,
    this.assignId,
    this.isFile,
    this.assignTransId,
    this.output,
    this.followUpDate,
    this.date,
    this.chapterId,
    this.subjectId,
    this.sectionId,
    this.classId,
    this.yearId,
    this.base64,
    this.fileName,
    this.file,
    this.statusId,
    this.studentId,
    this.isCombined,
    this.submittedDate,
    this.filePath,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        assignNo: json["assign_no"],
        faculty: json["faculty"],
        student: json["student"],
        assignDate: json["assign_date"],
        submiDate: json["submi_date"],
        status: json["status"],
        className: json["class_name"],
        section: json["section"],
        assignedBy: json["assigned_by"],
        subject: json["subject"],
        chapter: json["chapter"],
        assignTopic: json["assign_topic"],
        assignNote: json["assign_note"],
        updatedBy: json["updated_by"],
        remarks: json["remarks"],
        followDate: json["follow_date"],
        assignId: json["assign_id"],
        isFile: json["is_file"],
        assignTransId: json["assign_trans_id"],
        output: json["output"],
        followUpDate: DateTime.parse(json["follow_up_date"]),
        date: DateTime.parse(json["date"]),
        chapterId: json["chapter_id"],
        subjectId: json["subject_id"],
        sectionId: json["section_id"],
        classId: json["class_id"],
        yearId: json["year_id"],
        base64: json["base64"],
        fileName: json["file_name"],
        file: json["file"],
        statusId: json["status_id"],
        studentId: json["student_id"],
        isCombined: json["is_combined"],
        submittedDate: json["submitted_date"],
        filePath: json["file_path"],
      );

  // Map<String, dynamic> toMap() => {
  //       "assign_no": assignNo,
  //       "faculty": faculty,
  //       "student": student,
  //       "assign_date": assignDate,
  //       "submi_date": submiDate,
  //       "status": status,
  //       "class_name": className,
  //       "section": section,
  //       "assigned_by": assignedBy,
  //       "subject": subject,
  //       "chapter": chapter,
  //       "assign_topic": assignTopic,
  //       "assign_note": assignNote,
  //       "updated_by": updatedBy,
  //       "remarks": remarks,
  //       "follow_date": followDate,
  //       "assign_id": assignId,
  //       "is_file": isFile,
  //       "assign_trans_id": assignTransId,
  //       "output": output,
  //       "follow_up_date": followUpDate.toIso8601String(),
  //       "date": date.toIso8601String(),
  //       "chapter_id": chapterId,
  //       "subject_id": subjectId,
  //       "section_id": sectionId,
  //       "class_id": classId,
  //       "year_id": yearId,
  //       "base64": base64,
  //       "file_name": fileName,
  //       "file": file,
  //       "status_id": statusId,
  //       "student_id": studentId,
  //       "is_combined": isCombined,
  //       "submitted_date": submittedDate,
  //       "file_path": filePath,
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
