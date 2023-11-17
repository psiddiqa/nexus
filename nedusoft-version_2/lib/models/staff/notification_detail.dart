// To parse this JSON data, do
//
//     final staffNotificationDetail = staffNotificationDetailFromMap(jsonString);

class StaffNotificationDetailModel {
  int? nId;
  String? titel;
  String? description;
  DateTime? validFrom;
  DateTime? validTo;
  String? fromTime;
  String? toTime;
  dynamic attachment;
  dynamic fileName;
  int? categoryId;
  dynamic combinationId;
  dynamic semesterId;
  dynamic sectionId;
  int? departmentId;
  dynamic designationId;
  bool? isActive;
  dynamic cmpid;
  dynamic brcode;
  dynamic createdBy;
  DateTime? createdOn;
  dynamic updatedBy;
  dynamic updatedOn;
  String? category;
  dynamic auth;
  dynamic date;
  dynamic validFromDate;
  dynamic validToDate;
  int? statusFlag;
  dynamic statusMessage;
  dynamic input;
  dynamic base64;
  dynamic combination;
  dynamic semester;
  dynamic section;
  String? department;
  dynamic designation;
  dynamic catelist;
  dynamic comlist;
  dynamic semlist;
  dynamic seclist;
  dynamic deplist;
  dynamic deslist;

  StaffNotificationDetailModel({
    this.nId,
    this.titel,
    this.description,
    this.validFrom,
    this.validTo,
    this.fromTime,
    this.toTime,
    this.attachment,
    this.fileName,
    this.categoryId,
    this.combinationId,
    this.semesterId,
    this.sectionId,
    this.departmentId,
    this.designationId,
    this.isActive,
    this.cmpid,
    this.brcode,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.category,
    this.auth,
    this.date,
    this.validFromDate,
    this.validToDate,
    this.statusFlag,
    this.statusMessage,
    this.input,
    this.base64,
    this.combination,
    this.semester,
    this.section,
    this.department,
    this.designation,
    this.catelist,
    this.comlist,
    this.semlist,
    this.seclist,
    this.deplist,
    this.deslist,
  });

  factory StaffNotificationDetailModel.fromJson(Map<String, dynamic> json) => StaffNotificationDetailModel(
        nId: json["NId"],
        titel: json["Titel"],
        description: json["Description"],
        validFrom: DateTime.parse(json["ValidFrom"]),
        validTo: DateTime.parse(json["ValidTo"]),
        fromTime: json["FromTime"],
        toTime: json["ToTime"],
        attachment: json["Attachment"],
        fileName: json["FileName"],
        categoryId: json["CategoryId"],
        combinationId: json["CombinationId"],
        semesterId: json["SemesterId"],
        sectionId: json["SectionId"],
        departmentId: json["DepartmentId"],
        designationId: json["DesignationId"],
        isActive: json["IsActive"],
        cmpid: json["cmpid"],
        brcode: json["brcode"],
        createdBy: json["CreatedBy"],
        createdOn: DateTime.parse(json["CreatedOn"]),
        updatedBy: json["UpdatedBy"],
        updatedOn: json["UpdatedOn"],
        category: json["Category"],
        auth: json["Auth"],
        date: json["date"],
        validFromDate: json["ValidFromDate"],
        validToDate: json["ValidToDate"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        input: json["input"],
        base64: json["base64"],
        combination: json["Combination"],
        semester: json["Semester"],
        section: json["Section"],
        department: json["Department"],
        designation: json["Designation"],
        catelist: json["Catelist"],
        comlist: json["Comlist"],
        semlist: json["Semlist"],
        seclist: json["Seclist"],
        deplist: json["Deplist"],
        deslist: json["Deslist"],
      );

  // Map<String, dynamic> toMap() => {
  //       "NId": nId,
  //       "Titel": titel,
  //       "Description": description,
  //       "ValidFrom": validFrom.toIso8601String(),
  //       "ValidTo": validTo.toIso8601String(),
  //       "FromTime": fromTime,
  //       "ToTime": toTime,
  //       "Attachment": attachment,
  //       "FileName": fileName,
  //       "CategoryId": categoryId,
  //       "CombinationId": combinationId,
  //       "SemesterId": semesterId,
  //       "SectionId": sectionId,
  //       "DepartmentId": departmentId,
  //       "DesignationId": designationId,
  //       "IsActive": isActive,
  //       "cmpid": cmpid,
  //       "brcode": brcode,
  //       "CreatedBy": createdBy,
  //       "CreatedOn": createdOn.toIso8601String(),
  //       "UpdatedBy": updatedBy,
  //       "UpdatedOn": updatedOn,
  //       "Category": category,
  //       "Auth": auth,
  //       "date": date,
  //       "ValidFromDate": validFromDate,
  //       "ValidToDate": validToDate,
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "input": input,
  //       "base64": base64,
  //       "Combination": combination,
  //       "Semester": semester,
  //       "Section": section,
  //       "Department": department,
  //       "Designation": designation,
  //       "Catelist": catelist,
  //       "Comlist": comlist,
  //       "Semlist": semlist,
  //       "Seclist": seclist,
  //       "Deplist": deplist,
  //       "Deslist": deslist,
  //     };
}
