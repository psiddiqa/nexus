// To parse this JSON data, do
//
//     final studentAssignmentModel = studentAssignmentModelFromMap(jsonString);

import 'dart:convert';

class StudentAssignmentModel {
  List<List1Element>? list1;
  List<List1Element>? list2;
  List<List1Element>? list3;
  List<List1Element>? list4;
  Output? output;
  dynamic input;
  dynamic data;
  dynamic classList;
  dynamic sections;
  dynamic subjects;
  dynamic chapters;

  StudentAssignmentModel({
    this.list1,
    this.list2,
    this.list3,
    this.list4,
    this.output,
    this.input,
    this.data,
    this.classList,
    this.sections,
    this.subjects,
    this.chapters,
  });

  factory StudentAssignmentModel.fromJson(Map<String, dynamic> json) => StudentAssignmentModel(
        list1: json["list_1"] == null ? null : List<List1Element>.from(json["list_1"].map((x) => List1Element.fromMap(x))),
        list2: json["list_2"] == null ? null : List<List1Element>.from(json["list_2"].map((x) => List1Element.fromMap(x))),
        list3: json["list_3"] == null ? null : List<List1Element>.from(json["list_3"].map((x) => List1Element.fromMap(x))),
        list4: json["list_3"] == null ? null : List<List1Element>.from(json["list_4"].map((x) => List1Element.fromMap(x))),
        output: Output.fromMap(json["output"]),
        input: json["input"],
        data: json["data"],
        classList: json["class_list"],
        sections: json["sections"],
        subjects: json["subjects"],
        chapters: json["chapters"],
      );

  // Map<String, dynamic> toMap() => {
  //       "list_1": List<dynamic>.from(list1.map((x) => x.toMap())),
  //       "list_2": List<dynamic>.from(list2.map((x) => x.toMap())),
  //       "output": output.toMap(),
  //       "input": input,
  //       "data": data,
  //       "class_list": classList,
  //       "sections": sections,
  //       "subjects": subjects,
  //       "chapters": chapters,
  //     };
}

class List1Element {
  dynamic assignNo;
  String? faculty;
  dynamic student;
  String? assignDate;
  String? submiDate;
  String? status;
  dynamic className;
  dynamic section;
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
  dynamic fileName;
  dynamic file;
  dynamic statusId;
  dynamic studentId;
  bool? isCombined;
  dynamic submittedDate;
  dynamic filePath;

  List1Element({
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

  factory List1Element.fromMap(Map<String, dynamic> json) => List1Element(
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
  //       "follow_up_date": followUpDate,
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
}
