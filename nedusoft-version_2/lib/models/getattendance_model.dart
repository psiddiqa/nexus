import 'dart:convert';

class GetEnterAttendanceDropdownsModel {
  List<Cl>? cls;
  dynamic sec;
  dynamic sub;
  List<Cl>? ses;
  Year? year;
  int? statusFlag;
  dynamic statusMessage;
  bool? isSession;

  GetEnterAttendanceDropdownsModel({
    this.cls,
    this.sec,
    this.sub,
    this.ses,
    this.year,
    this.statusFlag,
    this.statusMessage,
    this.isSession,
  });

  factory GetEnterAttendanceDropdownsModel.fromJson(Map<String, dynamic> json) => GetEnterAttendanceDropdownsModel(
        cls: List<Cl>.from(json["cls"].map((x) => Cl.fromMap(x))),
        sec: json["sec"],
        sub: json["sub"],
        ses: List<Cl>.from(json["ses"].map((x) => Cl.fromMap(x))),
        year: Year.fromMap(json["year"]),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        isSession: json["IsSession"],
      );

  Map<String, dynamic> toMap() => {
        // "cls": List<dynamic>.from(cls!.map((x) => x.toMap())),
        "sec": sec,
        "sub": sub,
        // "ses": List<dynamic>.from(ses!.map((x) => x.toMap())),
        "year": year!.toMap(),
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
        "IsSession": isSession,
      };
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

  Map<String, dynamic> toMap() => {
        "Value": value,
        "Text": text,
        "Ext": ext,
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

  factory Year.fromMap(Map<String, dynamic> json) => Year(
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
        yearList:json["YearList"] == null ? null : List<Year>.from(json["YearList"].map((x) => Year.fromMap(x))),
        statusMessage: json["statusMessage"],
        loginId: json["LoginId"],
        loginName: json["LoginName"],
        password: json["Password"],
        statusFlag: json["statusFlag"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "YearID": yearId,
        "YearName": yearName,
        "brcode": brcode,
        "cmpid": cmpid,
        "IsActive": isActive,
        "CreatedBy": createdBy,
        "CreatedOn": createdOn,
        "UpdatedBy": updatedBy,
        "UpdatedOn": updatedOn,
        "IsCurrent": isCurrent,
        // "YearList": List<dynamic>.from(yearList!.map((x) => x.toMap())),
        "statusMessage": statusMessage,
        "LoginId": loginId,
        "LoginName": loginName,
        "Password": password,
        "statusFlag": statusFlag,
        "token": token,
      };
}
