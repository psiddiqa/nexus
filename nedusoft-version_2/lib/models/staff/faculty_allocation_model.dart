// To parse this JSON data, do
//
//     final facultyAllocationList = facultyAllocationListFromMap(jsonString);

import 'dart:convert';

class FacultyAllocationList {
  List<ListElement>? list;
  Output? output;
  dynamic input;
  dynamic compose;
  dynamic fromTime;
  dynamic toTime;
  bool? isSession;
  dynamic headerId;
  dynamic branchName;
  bool? isSubject;
  dynamic apiKey;

  FacultyAllocationList({
    this.list,
    this.output,
    this.input,
    this.compose,
    this.fromTime,
    this.toTime,
    this.isSession,
    this.headerId,
    this.branchName,
    this.isSubject,
    this.apiKey,
  });

  factory FacultyAllocationList.fromJson(Map<String, dynamic> json) => FacultyAllocationList(
        list: List<ListElement>.from(json["List"].map((x) => ListElement.fromMap(x))),
        output: Output.fromMap(json["output"]),
        input: json["input"],
        compose: json["Compose"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        isSession: json["IsSession"],
        headerId: json["HeaderId"],
        branchName: json["BranchName"],
        isSubject: json["isSubject"],
        apiKey: json["ApiKey"],
      );

  // Map<String, dynamic> toMap() => {
  //       "List": List<dynamic>.from(list.map((x) => x.toMap())),
  //       "output": output.toMap(),
  //       "input": input,
  //       "Compose": compose,
  //       "from_time": fromTime,
  //       "to_time": toTime,
  //       "IsSession": isSession,
  //       "HeaderId": headerId,
  //       "BranchName": branchName,
  //       "isSubject": isSubject,
  //       "ApiKey": apiKey,
  //     };
}

class ListElement {
  String? name;
  int? studentId;
  dynamic yearId;
  int? slNo;
  dynamic statusId;
  dynamic remarkId;
  dynamic mobileno;
  dynamic subjectId;
  dynamic cmpid;
  dynamic brcode;
  dynamic date;
  int? sectionId;
  int? attId;
  bool? isSelect;
  dynamic combinationId;
  int? semesterId;
  String? semester;
  dynamic sessionName;
  dynamic status;
  dynamic dt;
  dynamic fromTime;
  dynamic toTime;
  dynamic firstName;
  String? secondName;
  dynamic lastName;
  dynamic rollNumber;
  dynamic classAttended;
  dynamic classTaken;
  dynamic classAttendedPer;

  ListElement({
    this.name,
    this.studentId,
    this.yearId,
    this.slNo,
    this.statusId,
    this.remarkId,
    this.mobileno,
    this.subjectId,
    this.cmpid,
    this.brcode,
    this.date,
    this.sectionId,
    this.attId,
    this.isSelect,
    this.combinationId,
    this.semesterId,
    this.semester,
    this.sessionName,
    this.status,
    this.dt,
    this.fromTime,
    this.toTime,
    this.firstName,
    this.secondName,
    this.lastName,
    this.rollNumber,
    this.classAttended,
    this.classTaken,
    this.classAttendedPer,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        name: json["name"],
        studentId: json["StudentId"],
        yearId: json["YearId"],
        slNo: json["SlNo"],
        statusId: json["StatusId"],
        remarkId: json["RemarkId"],
        mobileno: json["mobileno"],
        subjectId: json["subjectId"],
        cmpid: json["cmpid"],
        brcode: json["brcode"],
        date: json["date"],
        sectionId: json["SectionId"],
        attId: json["AttId"],
        isSelect: json["IsSelect"],
        combinationId: json["CombinationId"],
        semesterId: json["SemesterId"],
        semester: json["Semester"],
        sessionName: json["SessionName"],
        status: json["Status"],
        dt: json["dt"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        firstName: json["first_name"],
        secondName: json["second_name"],
        lastName: json["last_name"],
        rollNumber: json["roll_number"],
        classAttended: json["class_attended"],
        classTaken: json["class_taken"],
        classAttendedPer: json["class_attended_per"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "StudentId": studentId,
        "YearId": yearId,
        "SlNo": slNo,
        "StatusId": statusId,
        "RemarkId": remarkId,
        "mobileno": mobileno,
        "subjectId": subjectId,
        "cmpid": cmpid,
        "brcode": brcode,
        "date": date,
        "SectionId": sectionId,
        "AttId": attId,
        "IsSelect": isSelect,
        "CombinationId": combinationId,
        "SemesterId": semesterId,
        "Semester": semester,
        "SessionName": sessionName,
        "Status": status,
        "dt": dt,
        "from_time": fromTime,
        "to_time": toTime,
        "first_name": firstName,
        "second_name": secondName,
        "last_name": lastName,
        "roll_number": rollNumber,
        "class_attended": classAttended,
        "class_taken": classTaken,
        "class_attended_per": classAttendedPer,
      };
}

class Output {
  int? statusFlag;
  dynamic statusMessage;

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

class FacultyAllocationStudentList {
  int studentId;
  String studentName;
  String className;
  String section;
  bool value;

  FacultyAllocationStudentList({required this.studentName, required this.studentId, required this.value, required this.className, required this.section});

  factory FacultyAllocationStudentList.fromMap(ListElement json) => FacultyAllocationStudentList(studentName: json.name!, studentId: json.studentId!, value: false, section: json.secondName ?? "", className: json.semester ?? "");

  Map<String, dynamic> toMap() => {
        "studentName": studentName,
      };
}

class FacultyDeAllocationStudentList {
  int attId;
  String studentName;
  String className;
  String section;
  bool value;

  FacultyDeAllocationStudentList({required this.studentName, required this.attId, required this.value, required this.className, required this.section});

  factory FacultyDeAllocationStudentList.fromMap(ListElement json) => FacultyDeAllocationStudentList(studentName: json.name!, attId: json.attId!, value: false, section: json.secondName ?? "", className: json.semester ?? "");

  Map<String, dynamic> toMap() => {
        "studentName": studentName,
      };
}
