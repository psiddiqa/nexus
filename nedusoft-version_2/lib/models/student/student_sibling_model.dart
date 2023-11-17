// To parse this JSON data, do
//
//     final studentSiblings = studentSiblingsFromJson(jsonString);

import 'dart:convert';

StudentSiblings studentSiblingsFromJson(String str) => StudentSiblings.fromJson(json.decode(str));

String studentSiblingsToJson(StudentSiblings data) => json.encode(data.toJson());

class StudentSiblings {
  int? statusFlag;
  dynamic statusMessage;
  dynamic defaultValue;
  dynamic defaultText;
  List<ListElement>? list;

  StudentSiblings({
    this.statusFlag,
    this.statusMessage,
    this.defaultValue,
    this.defaultText,
    this.list,
  });

  factory StudentSiblings.fromJson(Map<String, dynamic> json) => StudentSiblings(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: json["List"] == null ? [] : List<ListElement>.from(json["List"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
        "defaultValue": defaultValue,
        "defaultText": defaultText,
        "List": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  int? value;
  String? text;
  dynamic ext;

  ListElement({
    this.value,
    this.text,
    this.ext,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        value: json["Value"],
        text: json["Text"],
        ext: json["Ext"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Text": text,
        "Ext": ext,
      };
}
