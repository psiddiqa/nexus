// To parse this JSON data, do
//
//     final getFacultyVideoModel = getFacultyVideoModelFromMap(jsonString);

import 'dart:convert';

class GetFacultyVideoModel {
  List<ListElement>? list;
  int? statusFlag;
  dynamic statusMessage;

  GetFacultyVideoModel({
    this.list,
    this.statusFlag,
    this.statusMessage,
  });

  factory GetFacultyVideoModel.fromJson(Map<String, dynamic> json) => GetFacultyVideoModel(
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
  bool? isPublished;
  String? className;
  String? subject;
  String? chapter;
  String? topic;
  String? link;
  int? topicId;
  dynamic publisher;
  dynamic fileName;
  String? createdBy;

  ListElement({
    this.isPublished,
    this.className,
    this.subject,
    this.chapter,
    this.topic,
    this.link,
    this.topicId,
    this.publisher,
    this.fileName, this.createdBy
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        isPublished: json["is_published"],
        className: json["class_name"],
        subject: json["subject"],
        chapter: json["chapter"],
        topic: json["topic"],
        link: json["link"],
        topicId: json["topic_id"],
        publisher: json["publisher"],
        fileName: json["file_name"],
        createdBy: json["created_by"],
      );

  // Map<String, dynamic> toMap() => {
  //       "is_published": isPublished,
  //       "class_name": classNameValues.reverse[className],
  //       "subject": subjectValues.reverse[subject],
  //       "chapter": chapter,
  //       "topic": topic,
  //       "link": link,
  //       "topic_id": topicId,
  //       "publisher": publisher,
  //       "file_name": fileName,
  //     };
}
