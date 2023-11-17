// To parse this JSON data, do
//
//     final getAllCombineSectionModel = getAllCombineSectionModelFromMap(jsonString);

import 'dart:convert';

import 'getall_section_model.dart';
import 'getall_subject_model.dart';
import 'getattendance_model.dart';

// GetAllCombineSectionModel getAllCombineSectionModelFromMap(String str) => GetAllCombineSectionModel.fromMap(json.decode(str));

// String getAllCombineSectionModelToMap(GetAllCombineSectionModel data) => json.encode(data.toMap());

class GetAllCombineSectionModel {
  int? statusFlag;
  dynamic statusMessage;
  dynamic defaultValue;
  dynamic defaultText;
  List<SectionList>? list;

  GetAllCombineSectionModel({
    this.statusFlag,
    this.statusMessage,
    this.defaultValue,
    this.defaultText,
    this.list,
  });

  factory GetAllCombineSectionModel.fromJson(Map<String, dynamic> json) => GetAllCombineSectionModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: List<SectionList>.from(json["List"].map((x) => SectionList.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "defaultValue": defaultValue,
  //       "defaultText": defaultText,
  //       "List": List<dynamic>.from(list.map((x) => x.toMap())),
  //     };
}

// class ListElement {
//   int? value;
//   String? text;
//   dynamic ext;

//   ListElement({
//     this.value,
//     this.text,
//     this.ext,
//   });

//   factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
//         value: json["Value"],
//         text: json["Text"],
//         ext: json["Ext"],
//       );

//   Map<String, dynamic> toMap() => {
//         "Value": value,
//         "Text": text,
//         "Ext": ext,
//       };
// }



class GetAllCombineSubjectModel {
  int? statusFlag;
  dynamic statusMessage;
  dynamic defaultValue;
  dynamic defaultText;
  List<SubjectList>? list;

  GetAllCombineSubjectModel({
    this.statusFlag,
    this.statusMessage,
    this.defaultValue,
    this.defaultText,
    this.list,
  });

  factory GetAllCombineSubjectModel.fromJson(Map<String, dynamic> json) => GetAllCombineSubjectModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: List<SubjectList>.from(json["List"].map((x) => SubjectList.fromMap(x))),
      );


}

class GetAllCombineClassModel {
  int? statusFlag;
  dynamic statusMessage;
  dynamic defaultValue;
  dynamic defaultText;
  List<Cl>? list;

  GetAllCombineClassModel({
    this.statusFlag,
    this.statusMessage,
    this.defaultValue,
    this.defaultText,
    this.list,
  });

  factory GetAllCombineClassModel.fromJson(Map<String, dynamic> json) => GetAllCombineClassModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: List<Cl>.from(json["List"].map((x) => Cl.fromMap(x))),
      );
}
