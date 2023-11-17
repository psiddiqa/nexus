

import 'dart:convert';


class GetAllStatusModel {
  int? statusFlag;
  String? statusMessage;
  dynamic defaultValue;
  dynamic defaultText;
  List<ListElement>? list;

  GetAllStatusModel({
    this.statusFlag,
    this.statusMessage,
    this.defaultValue,
    this.defaultText,
    this.list,
  });

  factory GetAllStatusModel.fromJson(Map<String, dynamic> json) => GetAllStatusModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: List<ListElement>.from(json["List"].map((x) => ListElement.fromMap(x))),
      );


      
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

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        value: json["Value"],
        text: json["Text"],
        ext: json["Ext"],
      );

  Map<String, dynamic> toMap() => {
        "Value": value,
        "Text": text,
        "Ext": ext,
      };
}




class GetAllRemarkModel {
    int? statusFlag;
    String? statusMessage;
    dynamic defaultValue;
    dynamic defaultText;
    List<ListElement>? list;

    GetAllRemarkModel({
        this.statusFlag,
        this.statusMessage,
        this.defaultValue,
        this.defaultText,
        this.list,
    });

    factory GetAllRemarkModel.fromJson(Map<String, dynamic> json) => GetAllRemarkModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: List<ListElement>.from(json["List"].map((x) => ListElement.fromMap(x))),
    );


}



