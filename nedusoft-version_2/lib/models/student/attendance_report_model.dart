class StudentAttendanceReportModel {
  Year? year;
  List<ListElement>? list;
  int? statusFlag;
  String? statusMessage;

  StudentAttendanceReportModel({
    this.year,
    this.list,
    this.statusFlag,
    this.statusMessage,
  });

  factory StudentAttendanceReportModel.fromJson(Map<String, dynamic> json) => StudentAttendanceReportModel(
        year: json["year"] == null ? null : Year.fromJson(json["year"]),
        list: json["list"] == null ? null : List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );
}

class ListElement {
  String? className;
  String? subject;
  int? presentDays;
  int? absentDays;
  int? total;
  double? per;

  ListElement({this.className, this.subject, this.presentDays, this.absentDays, this.total, this.per});

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        className: json["class_name"],
        subject: json["subject"],
        presentDays: json["present_days"],
        absentDays: json["absent_days"],
        total: json["total"],
        per: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "class_name": className,
        "subject": subject,
        "present_days": presentDays,
        "absent_days": absentDays,
        "total": total,
      };
}

class Year {
  int? yearId;
  String? yearName;
  String? brcode;
  String? cmpid;
  bool? isActive;
  dynamic createdBy;
  dynamic createdOn;
  dynamic updatedBy;
  dynamic updatedOn;
  bool? isCurrent;
  List<Year>? yearList;
  String? statusMessage;
  int? loginId;
  dynamic loginName;
  dynamic password;
  int? statusFlag;
  dynamic token;

  Year({
    this.yearId,
    this.yearName,
    this.brcode,
    this.cmpid,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.isCurrent,
    this.yearList,
    this.statusMessage,
    this.loginId,
    this.loginName,
    this.password,
    this.statusFlag,
    this.token,
  });

  factory Year.fromJson(Map<String, dynamic> json) => Year(
        yearId: json["YearID"],
        yearName: json["YearName"],
        brcode: json["brcode"],
        cmpid: json["cmpid"],
        isActive: json["IsActive"],
        createdBy: json["CreatedBy"],
        createdOn: json["CreatedOn"],
        updatedBy: json["UpdatedBy"],
        updatedOn: json["UpdatedOn"],
        isCurrent: json["IsCurrent"],
        yearList: json["YearList"] == null ? [] : List<Year>.from(json["YearList"]!.map((x) => Year.fromJson(x))),
        statusMessage: json["statusMessage"],
        loginId: json["LoginId"],
        loginName: json["LoginName"],
        password: json["Password"],
        statusFlag: json["statusFlag"],
        token: json["token"],
      );
}
