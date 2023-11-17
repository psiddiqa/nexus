// To parse this JSON data, do
//
//     final lessonUpdateOnPageLoadModel = lessonUpdateOnPageLoadModelFromMap(jsonString);

import 'dart:convert';

class StaffAssignmentModel {
  List<StaffAssignmentModelList1>? list1;
  dynamic list2;
  Output? output;
  dynamic input;
  dynamic data;
  dynamic classList;
  dynamic sections;
  dynamic subjects;
  dynamic chapters;

  StaffAssignmentModel({
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

  factory StaffAssignmentModel.fromJson(Map<String, dynamic> json) => StaffAssignmentModel(
        list1: json["list_1"] == null ? null:  List<StaffAssignmentModelList1>.from(json["list_1"].map((x) => StaffAssignmentModelList1.fromMap(x))),
        list2: json["list_2"],
        output: Output.fromMap(json["output"]),
        input: json["input"],
        data: json["data"],
        classList: json["class_list"],
        sections: json["sections"],
        subjects: json["subjects"],
        chapters: json["chapters"],
      );


}

class StaffAssignmentModelList1 {
  dynamic assignNo;
  String? faculty;
  dynamic student;
  String? assignDate;
  String? submiDate;
  dynamic status;
  String? className;
  String? section;
  dynamic assignedBy;
  String? subject;
  String? chapter;
  String? assignTopic;
  dynamic assignNote;
  dynamic updatedBy;
  dynamic remarks;
  dynamic followDate;
  int? assignId;
  bool? isFile;
  int? assignTransId;
  dynamic output;
  dynamic followUpDate;
  DateTime? date;
  dynamic chapterId;
  dynamic subjectId;
  dynamic sectionId;
  dynamic classId;
  dynamic yearId;
  dynamic base64;
  String? fileName;
  dynamic file;
  dynamic statusId;
  dynamic studentId;
  bool? isCombined;
  dynamic submittedDate;
  dynamic filePath;

  StaffAssignmentModelList1({
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

  factory StaffAssignmentModelList1.fromMap(Map<String, dynamic> json) => StaffAssignmentModelList1(
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
        followUpDate: json["follow_up_date"],
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
