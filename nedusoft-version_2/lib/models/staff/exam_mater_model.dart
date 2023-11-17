// To parse this JSON data, do
//
//     final getAllCombineSectionModel = getAllCombineSectionModelFromMap(jsonString);

import 'dart:convert';

import 'package:nedusoft/models/getall_subject_model.dart';

class GetExamMasterModel {
  int? statusFlag;
  dynamic statusMessage;
  dynamic defaultValue;
  dynamic defaultText;
  List<SubjectList>? list;

  GetExamMasterModel({
    this.statusFlag,
    this.statusMessage,
    this.defaultValue,
    this.defaultText,
    this.list,
  });

  factory GetExamMasterModel.fromJson(Map<String, dynamic> json) => GetExamMasterModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: List<SubjectList>.from(json["List"].map((x) => SubjectList.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "defaultValue": defaultValue,
  //       "defaultText": defaultText,
  //       "List": List<dynamic>.from(list.map((x) => x.toMap())),
  //     };
}
