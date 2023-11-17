// To parse this JSON data, do
//
//     final onPageReceiptsModel = onPageReceiptsModelFromJson(jsonString);

import 'dart:convert';

OnPageReceiptsModel onPageReceiptsModelFromJson(String str) => OnPageReceiptsModel.fromJson(json.decode(str));

String onPageReceiptsModelToJson(OnPageReceiptsModel data) => json.encode(data.toJson());

class OnPageReceiptsModel {
  List<ListElement>? list;
  List<Year>? years;
  int? statusFlag;
  dynamic statusMessage;

  OnPageReceiptsModel({
    this.list,
    this.years,
    this.statusFlag,
    this.statusMessage,
  });

  factory OnPageReceiptsModel.fromJson(Map<String, dynamic> json) => OnPageReceiptsModel(
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        years: json["years"] == null ? [] : List<Year>.from(json["years"]!.map((x) => Year.fromJson(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "years": years == null ? [] : List<dynamic>.from(years!.map((x) => x.toJson())),
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}

class ListElement {
  String? frNo;
  DateTime? fDate;
  double? fPaid;
  String? year;
  int? fId;

  ListElement({
    this.frNo,
    this.fDate,
    this.fPaid,
    this.year,
    this.fId,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        frNo: json["fr_no"],
        fDate: json["f_date"] == null ? null : DateTime.parse(json["f_date"]),
        fPaid: json["f_paid"],
        year: json["year"],
        fId: json["f_id"],
      );

  Map<String, dynamic> toJson() => {
        "fr_no": frNo,
        "f_date": fDate?.toIso8601String(),
        "f_paid": fPaid,
        "year": year,
        "f_id": fId,
      };
}

class Year {
  int? value;
  String? text;
  dynamic ext;

  Year({
    this.value,
    this.text,
    this.ext,
  });

  factory Year.fromJson(Map<String, dynamic> json) => Year(
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
