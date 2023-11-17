// To parse this JSON data, do
//
//     final marksOnPageModel = marksOnPageModelFromMap(jsonString);

import 'dart:convert';

import '../getattendance_model.dart';

class MarksOnPageModel {
  List<Cl>? cls;

  dynamic sub;

  Year? year;
  int? statusFlag;
  dynamic statusMessage;
  bool? isSession;

  MarksOnPageModel({
    this.cls,
    this.sub,
    this.year,
    this.statusFlag,
    this.statusMessage,
    this.isSession,
  });

  factory MarksOnPageModel.fromJson(Map<String, dynamic> json) => MarksOnPageModel(
        cls: List<Cl>.from(json["cls"].map((x) => Cl.fromMap(x))),
        sub: json["sub"],
        year: Year.fromMap(json["year"]),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        isSession: json["IsSession"],
      );
}
