// To parse this JSON data, do
//
//     final studentLearnStubjectModel = studentLearnStubjectModelFromMap(jsonString);

import 'dart:convert';

class StudentLearnStubjectModel {
  List<ListElement>? list;
  int? statusFlag;
  dynamic statusMessage;

  StudentLearnStubjectModel({
    this.list,
    this.statusFlag,
    this.statusMessage,
  });

  factory StudentLearnStubjectModel.fromJson(Map<String, dynamic> json) => StudentLearnStubjectModel(
        list: json["list"] == null ? null : List<ListElement>.from(json["list"].map((x) => ListElement.fromMap(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );
}

class ListElement {
  String? subject;
  int? subjectId;
  String? subjectIcon;

  ListElement({
    this.subject,
    this.subjectId,
    this.subjectIcon,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        subject: json["subject"],
        subjectId: json["subject_id"],
        subjectIcon: json["subject_icon"],
      );
}

class StudentLearnChapterModel {
  int? statusFlag;
  dynamic statusMessage;
  dynamic defaultValue;
  dynamic defaultText;
  List<ListElementModel>? list;

  StudentLearnChapterModel({
    this.statusFlag,
    this.statusMessage,
    this.defaultValue,
    this.defaultText,
    this.list,
  });

  factory StudentLearnChapterModel.fromJson(Map<String, dynamic> json) => StudentLearnChapterModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: json["List"] == null ? null : List<ListElementModel>.from(json["List"].map((x) => ListElementModel.fromMap(x))),
      );
}

class ListElementModel {
  int? value;
  String? text;
  dynamic ext;

  ListElementModel({
    this.value,
    this.text,
    this.ext,
  });

  factory ListElementModel.fromMap(Map<String, dynamic> json) => ListElementModel(
        value: json["Value"],
        text: json["Text"],
        ext: json["Ext"],
      );
}

class ChapterVideosModel {
  List<ChapterListElement>? list;
  int? statusFlag;
  dynamic statusMessage;

  ChapterVideosModel({
    this.list,
    this.statusFlag,
    this.statusMessage,
  });

  factory ChapterVideosModel.fromJson(Map<String, dynamic> json) => ChapterVideosModel(
        list: List<ChapterListElement>.from(json["list"].map((x) => ChapterListElement.fromMap(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );
}

class ChapterListElement {
  bool? isPublished;
  dynamic className;
  dynamic subject;
  dynamic chapter;
  dynamic topic;
  String? link;
  int? topicId;
  dynamic publisher;
  dynamic fileName;

  ChapterListElement({
    this.isPublished,
    this.className,
    this.subject,
    this.chapter,
    this.topic,
    this.link,
    this.topicId,
    this.publisher,
    this.fileName,
  });

  factory ChapterListElement.fromMap(Map<String, dynamic> json) => ChapterListElement(
        isPublished: json["is_published"],
        className: json["class_name"],
        subject: json["subject"],
        chapter: json["chapter"],
        topic: json["topic"],
        link: json["link"],
        topicId: json["topic_id"],
        publisher: json["publisher"],
        fileName: json["file_name"],
      );
}

SynopsisModel synopsisModelFromJson(String str) => SynopsisModel.fromJson(json.decode(str));

String synopsisModelToJson(SynopsisModel data) => json.encode(data.toJson());

class SynopsisModel {
  dynamic file;
  dynamic fileName;
  int? statusFlag;
  String? statusMessage;

  SynopsisModel({
    this.file,
    this.fileName,
    this.statusFlag,
    this.statusMessage,
  });

  factory SynopsisModel.fromJson(Map<String, dynamic> json) => SynopsisModel(
        file: json["file"],
        fileName: json["file_name"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "file_name": fileName,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}
