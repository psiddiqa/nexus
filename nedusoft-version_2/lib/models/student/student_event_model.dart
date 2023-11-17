// To parse this JSON data, do
//
//     final studentEventModel = studentEventModelFromMap(jsonString);

import 'dart:convert';

class StudentEventModel {
  List<ListElement>? list;
  int? statusFlag;
  dynamic statusMessage;

  StudentEventModel({
    this.list,
    this.statusFlag,
    this.statusMessage,
  });

  factory StudentEventModel.fromJson(Map<String, dynamic> json) => StudentEventModel(
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromMap(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  // Map<String, dynamic> toMap() => {
  //       "list": List<dynamic>.from(list.map((x) => x.toMap())),
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //     };
}

class ListElement {
  String? title;
  DateTime? start;
  dynamic className;
  String? date;
  String? markerClass;
  int? eventId;
  int? categoryId;
  String? category;

  ListElement({
    this.title,
    this.start,
    this.className,
    this.date,
    this.markerClass,
    this.eventId,
    this.categoryId,
    this.category,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        title: json["title"],
        start: DateTime.parse(json["start"]),
        className: json["className"],
        date: json["date"],
        markerClass: json["MarkerClass"],
        eventId: json["EventId"],
        categoryId: json["CategoryID"],
        category: json["Category"],
      );

  // Map<String, dynamic> toMap() => {
  //       "title": title,
  //       "start": start.toIso8601String(),
  //       "className": className,
  //       "date": date,
  //       "MarkerClass": markerClass,
  //       "EventId": eventId,
  //       "CategoryID": categoryId,
  //       "Category": category,
  //     };
}
