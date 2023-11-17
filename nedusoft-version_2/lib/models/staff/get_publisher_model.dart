// To parse this JSON data, do
//
//     final getPublisherModel = getPublisherModelFromMap(jsonString);

import 'dart:convert';

class GetPublisherModel {
  List<Cl>? cls;
  dynamic sec;
  dynamic sub;
  dynamic ses;
  dynamic year;
  int? statusFlag;
  dynamic statusMessage;
  bool? isSession;
  List<Cl>? publishers;

  GetPublisherModel({
    this.cls,
    this.sec,
    this.sub,
    this.ses,
    this.year,
    this.statusFlag,
    this.statusMessage,
    this.isSession,
    this.publishers,
  });

  factory GetPublisherModel.fromJson(Map<String, dynamic> json) => GetPublisherModel(
        cls: json["cls"] == null ? null : List<Cl>.from(json["cls"].map((x) => Cl.fromMap(x))),
        sec: json["sec"],
        sub: json["sub"],
        ses: json["ses"],
        year: json["year"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        isSession: json["IsSession"],
        publishers: json["publishers"] == null ? null : List<Cl>.from(json["publishers"].map((x) => Cl.fromMap(x))),
      );
}

class Cl {
  int? value;
  String? text;
  dynamic ext;

  Cl({
    this.value,
    this.text,
    this.ext,
  });

  factory Cl.fromMap(Map<String, dynamic> json) => Cl(
        value: json["Value"],
        text: json["Text"],
        ext: json["Ext"],
      );
}
