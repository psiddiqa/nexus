// To parse this JSON data, do
//
//     final experienceDetailsModel = experienceDetailsModelFromMap(jsonString);

import 'dart:convert';

class ExperienceDetailsModel {
  List<ListElement>? list;
  Output? output;

  ExperienceDetailsModel({
    this.list,
    this.output,
  });

  factory ExperienceDetailsModel.fromJson(Map<String, dynamic> json) => ExperienceDetailsModel(
        list: json["List"] == null ? null : List<ListElement>.from(json["List"].map((x) => ListElement.fromMap(x))),
        output: json["output"] == null ? null : Output.fromMap(json["output"]),
      );
}

class ListElement {
  int? slno;
  int? employeeId;
  String? workPeriod;
  String? institute;
  String? board;
  String? designation;
  String? natureOfDuties;
  String? salaryDrawn;

  ListElement({
    this.slno,
    this.employeeId,
    this.workPeriod,
    this.institute,
    this.board,
    this.designation,
    this.natureOfDuties,
    this.salaryDrawn,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        slno: json["Slno"],
        employeeId: json["EmployeeId"],
        workPeriod: json["WorkPeriod"],
        institute: json["Institute"],
        board: json["Board"],
        designation: json["Designation"],
        natureOfDuties: json["NatureOfDuties"],
        salaryDrawn: json["SalaryDrawn"],
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
}
