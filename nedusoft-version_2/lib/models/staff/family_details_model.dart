// To parse this JSON data, do
//
//     final familyDetailsModel = familyDetailsModelFromMap(jsonString);

import 'dart:convert';

class FamilyDetailsModel {
  List<ListElement>? list;
  Output? output;

  FamilyDetailsModel({
    this.list,
    this.output,
  });

  factory FamilyDetailsModel.fromJson(Map<String, dynamic> json) => FamilyDetailsModel(
        list: json["List"] == null ? null : List<ListElement>.from(json["List"].map((x) => ListElement.fromMap(x))),
        output: json["output"] == null ? null : Output.fromMap(json["output"]),
      );

  // Map<String, dynamic> toMap() => {
  //       "List": List<dynamic>.from(list.map((x) => x.toMap())),
  //       "output": output.toMap(),
  //     };
}

class ListElement {
  int? employeeId;
  int? familyId;
  String? name;
  dynamic fdob;
  String? age;
  String? relation;
  String? occupation;
  String? adress;
  String? dob;

  ListElement({
    this.employeeId,
    this.familyId,
    this.name,
    this.fdob,
    this.age,
    this.relation,
    this.occupation,
    this.adress,
    this.dob,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        employeeId: json["EmployeeId"],
        familyId: json["FamilyId"],
        name: json["Name"],
        fdob: json["FDOB"],
        age: json["Age"],
        relation: json["Relation"],
        occupation: json["Occupation"],
        adress: json["Adress"],
        dob: json["dob"],
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
