// To parse this JSON data, do
//
//     final allYearListModel = allYearListModelFromMap(jsonString);

import 'dart:convert';

class AllYearListModel {
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
  List<AllYearListModel>? yearList;
  String? statusMessage;
  int? loginId;
  dynamic loginName;
  dynamic password;
  int? statusFlag;
  dynamic token;

  AllYearListModel({
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

  factory AllYearListModel.fromJson(Map<String, dynamic> json) => AllYearListModel(
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
        yearList: json["YearList"] == null ? null : List<AllYearListModel>.from(json["YearList"].map((x) => AllYearListModel.fromJson(x))),
        statusMessage: json["statusMessage"],
        loginId: json["LoginId"],
        loginName: json["LoginName"],
        password: json["Password"],
        statusFlag: json["statusFlag"],
        token: json["token"],
      );

  // Map<String, dynamic> toMap() => {
  //       "YearID": yearId,
  //       "YearName": yearName,
  //       "brcode": brcode,
  //       "cmpid": cmpid,
  //       "IsActive": isActive,
  //       "CreatedBy": createdBy,
  //       "CreatedOn": createdOn,
  //       "UpdatedBy": updatedBy,
  //       "UpdatedOn": updatedOn,
  //       "IsCurrent": isCurrent,
  //       "YearList": List<dynamic>.from(yearList.map((x) => x.toMap())),
  //       "statusMessage": statusMessage,
  //       "LoginId": loginId,
  //       "LoginName": loginName,
  //       "Password": password,
  //       "statusFlag": statusFlag,
  //       "token": token,
  //     };
}
