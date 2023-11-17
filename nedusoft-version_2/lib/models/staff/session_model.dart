// To parse this JSON data, do
//
//     final sessionModelForStaff = sessionModelForStaffFromJson(jsonString);

import 'dart:convert';

import '../getattendance_model.dart';

class SessionModelForStaff {
  int? statusFlag;
  String? statusMessage;
  dynamic defaultValue;
  dynamic defaultText;
  List<Cl>? list;

  SessionModelForStaff({
    this.statusFlag,
    this.statusMessage,
    this.defaultValue,
    this.defaultText,
    this.list,
  });

  factory SessionModelForStaff.fromJson(Map<String, dynamic> json) => SessionModelForStaff(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: json["List"] == null ? [] : List<Cl>.from(json["List"]!.map((x) => Cl.fromMap(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "defaultValue": defaultValue,
  //       "defaultText": defaultText,
  //       "List": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
  //     };
}
