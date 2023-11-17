// To parse this JSON data, do
//
//     final getVideoDetailModel = getVideoDetailModelFromMap(jsonString);

class GetVideoDetailModel {
  int? yearId;
  int? classId;
  int? subjectId;
  int? chapterId;
  String? topic;
  String? link;
  DateTime? date;
  dynamic notes;
  int? publisherId;
  int? topicId;
  dynamic fileName;
  int? statusFlag;
  String? statusMessage;

  GetVideoDetailModel({
    this.yearId,
    this.classId,
    this.subjectId,
    this.chapterId,
    this.topic,
    this.link,
    this.date,
    this.notes,
    this.publisherId,
    this.topicId,
    this.fileName,
    this.statusFlag,
    this.statusMessage,
  });

  factory GetVideoDetailModel.fromJson(Map<String, dynamic> json) => GetVideoDetailModel(
        yearId: json["year_id"],
        classId: json["class_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        topic: json["topic"],
        link: json["link"],
        date: DateTime.parse(json["date"]),
        notes: json["notes"],
        publisherId: json["publisher_id"],
        topicId: json["topic_id"],
        fileName: json["file_name"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );
}

class Chapter {
  int? value;
  String? text;
  dynamic ext;

  Chapter({
    this.value,
    this.text,
    this.ext,
  });

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
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
