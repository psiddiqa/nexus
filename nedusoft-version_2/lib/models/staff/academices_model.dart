// To parse this JSON data, do
//
//     final academicsDetailsModel = academicsDetailsModelFromMap(jsonString);

import 'dart:convert';

class AcademicsDetailsModel {
  List<ListElement>? list;
  Output? output;

  AcademicsDetailsModel({
    this.list,
    this.output,
  });

  factory AcademicsDetailsModel.fromJson(Map<String, dynamic> json) => AcademicsDetailsModel(
        list: json["List"] == null ? null : List<ListElement>.from(json["List"].map((x) => ListElement.fromMap(x))),
        output: json["output"] == null ? null : Output.fromMap(json["output"]),
      );
}

class ListElement {
  int? eapId;
  int? employeeId;
  String? degree;
  String? year;
  dynamic division;
  String? percentage;
  String? subject;
  String? institution;

  ListElement({
    this.eapId,
    this.employeeId,
    this.degree,
    this.year,
    this.division,
    this.percentage,
    this.subject,
    this.institution,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        eapId: json["EAPId"],
        employeeId: json["EmployeeId"],
        degree: json["Degree"],
        year: json["Year"],
        division: json["Division"],
        percentage: json["Percentage"],
        subject: json["Subject"],
        institution: json["Institution"],
      );

  // Map<String, dynamic> toMap() => {
  //       "EAPId": eapId,
  //       "EmployeeId": employeeId,
  //       "Degree": degree,
  //       "Year": year,
  //       "Division": division,
  //       "Percentage": percentage,
  //       "Subject": subject,
  //       "Institution": institution,
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
