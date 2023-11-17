// To parse this JSON data, do
//
//     final getAllSectionModal = getAllSectionModalFromMap(jsonString);

import 'dart:convert';

class GetAllSectionModal {
  int? sectionId;
  dynamic sectionName;
  int? classId;
  dynamic combinationId;
  dynamic branchId;
  dynamic brcode;
  dynamic cmpid;
  dynamic isActive;
  dynamic createdBy;
  dynamic createdOn;
  dynamic updatedBy;
  dynamic updatedOn;
  List<SectionList>? sectionList;
  int? statusFlag;
  String? statusMessage;
  int? loginId;
  dynamic loginName;

  GetAllSectionModal({
    this.sectionId,
    this.sectionName,
    this.classId,
    this.combinationId,
    this.branchId,
    this.brcode,
    this.cmpid,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.sectionList,
    this.statusFlag,
    this.statusMessage,
    this.loginId,
    this.loginName,
  });

  factory GetAllSectionModal.fromJson(Map<String, dynamic> json) => GetAllSectionModal(
        sectionId: json["SectionId"],
        sectionName: json["SectionName"],
        classId: json["ClassId"],
        combinationId: json["CombinationID"],
        branchId: json["BranchId"],
        brcode: json["brcode"],
        cmpid: json["cmpid"],
        isActive: json["IsActive"],
        createdBy: json["CreatedBy"],
        createdOn: json["CreatedOn"],
        updatedBy: json["UpdatedBy"],
        updatedOn: json["UpdatedOn"],
        sectionList: List<SectionList>.from(json["SectionList"].map((x) => SectionList.fromMap(x))),
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        loginId: json["LoginId"],
        loginName: json["LoginName"],
      );

  // Map<String, dynamic> toMap() => {
  //       "SectionId": sectionId,
  //       "SectionName": sectionName,
  //       "ClassId": classId,
  //       "CombinationID": combinationId,
  //       "BranchId": branchId,
  //       "brcode": brcode,
  //       "cmpid": cmpid,
  //       "IsActive": isActive,
  //       "CreatedBy": createdBy,
  //       "CreatedOn": createdOn,
  //       "UpdatedBy": updatedBy,
  //       "UpdatedOn": updatedOn,
  //       // "SectionList": List<dynamic>.from(sectionList.map((x) => x.toMap())),
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "LoginId": loginId,
  //       "LoginName": loginName,
  //     };
}

class SectionList {
  int? value;
  String? text;
  dynamic ext;

  SectionList({
    this.value,
    this.text,
    this.ext,
  });

  factory SectionList.fromMap(Map<String, dynamic> json) => SectionList(
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
