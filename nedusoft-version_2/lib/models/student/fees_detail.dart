// To parse this JSON data, do
//
//     final facultyAllocationList = facultyAllocationListFromMap(jsonString);

import 'dart:convert';

class StudentFeesModel {
  Genral? genral;
  List<FeeList>? feeList;
  dynamic totalpaid;
  dynamic balance;
  dynamic concession;
  dynamic total;
  String? fType;
  Feetypes? feetypes;
  Terms? terms;
  String? feeTypeId;
  int? termId;
  String? termName;
  int? feeId;
  dynamic input;
  dynamic razor;
  dynamic key;
  dynamic secret;
  bool? isFeeVisible;
  String? gateway;

  StudentFeesModel({
    this.genral,
    this.feeList,
    this.totalpaid,
    this.balance,
    this.concession,
    this.total,
    this.fType,
    this.feetypes,
    this.terms,
    this.feeTypeId,
    this.termId,
    this.termName,
    this.feeId,
    this.input,
    this.razor,
    this.key,
    this.secret,
    this.isFeeVisible,
    this.gateway,
  });

  factory StudentFeesModel.fromJson(Map<String, dynamic> json) => StudentFeesModel(
        genral: Genral.fromMap(json["Genral"]),
        feeList: json["FeeList"] == null ? null : List<FeeList>.from(json["FeeList"].map((x) => FeeList.fromMap(x))),
        totalpaid: json["Totalpaid"],
        balance: json["Balance"],
        concession: json["Concession"],
        total: json["Total"],
        fType: json["f_type"],
        feetypes: json["feetypes"] == null ? null : Feetypes.fromMap(json["feetypes"]),
        terms: json["terms"] == null ? null : Terms.fromMap(json["terms"]),
        feeTypeId: json["FeeTypeId"],
        termId: json["TermId"],
        termName: json["Term_name"],
        feeId: json["fee_id"],
        input: json["Input"],
        razor: json["razor"],
        key: json["key"],
        secret: json["secret"],
        isFeeVisible: json["is_fee_visible"],
        gateway: json["gateway"],
      );

  // Map<String, dynamic> toMap() => {
  //       "Genral": genral.toMap(),
  //       "FeeList": List<dynamic>.from(feeList.map((x) => x.toMap())),
  //       "Totalpaid": totalpaid,
  //       "Balance": balance,
  //       "Concession": concession,
  //       "Total": total,
  //       "f_type": fType,
  //       "feetypes": feetypes.toMap(),
  //       "terms": terms.toMap(),
  //       "FeeTypeId": feeTypeId,
  //       "TermId": termId,
  //       "Term_name": termName,
  //       "fee_id": feeId,
  //       "Input": input,
  //       "razor": razor,
  //       "key": key,
  //       "secret": secret,
  //       "is_fee_visible": isFeeVisible,
  //       "gateway": gateway,
  //     };
}

class FeeList {
  String? feeDescription;
  double? total;
  double? paid;
  double? balance;
  double? concession;
  int? feeDescId;
  dynamic pay;
  String? feeListDueDate;
  DateTime? dueDate;

  FeeList({
    this.feeDescription,
    this.total,
    this.paid,
    this.balance,
    this.concession,
    this.feeDescId,
    this.pay,
    this.feeListDueDate,
    this.dueDate,
  });

  factory FeeList.fromMap(Map<String, dynamic> json) => FeeList(
        feeDescription: json["FeeDescription"],
        total: json["Total"],
        paid: json["Paid"],
        balance: json["Balance"],
        concession: json["Concession"],
        feeDescId: json["Fee_DescId"],
        pay: json["pay"],
        feeListDueDate: json["due_date"],
        dueDate: json["DueDate"] == null ? null : DateTime.parse(json["DueDate"]),
      );

  // Map<String, dynamic> toMap() => {
  //       "FeeDescription": feeDescription,
  //       "Total": total,
  //       "Paid": paid,
  //       "Balance": balance,
  //       "Concession": concession,
  //       "Fee_DescId": feeDescId,
  //       "pay": pay,
  //       "due_date": feeListDueDate,
  //       "DueDate": dueDate.toIso8601String(),
  //     };
}

class Feetypes {
  int? statusFlag;
  dynamic statusMessage;
  List<FeetypesList>? list;

  Feetypes({
    this.statusFlag,
    this.statusMessage,
    this.list,
  });

  factory Feetypes.fromMap(Map<String, dynamic> json) => Feetypes(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        list: json["List"] == null ? null : List<FeetypesList>.from(json["List"].map((x) => FeetypesList.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "List": List<dynamic>.from(list.map((x) => x.toMap())),
  //     };
}

class FeetypesList {
  int? id;
  String? feeTypeDescription;
  String? feeTypeName;
  dynamic createdOn;
  dynamic createdBy;
  dynamic updatedOn;
  dynamic updatedBy;
  String? cmpid;
  String? brcode;
  bool? isActive;
  bool? editFlag;
  dynamic feeTypeDescriptionVar;
  dynamic feeTypeNameVar;

  FeetypesList({
    this.id,
    this.feeTypeDescription,
    this.feeTypeName,
    this.createdOn,
    this.createdBy,
    this.updatedOn,
    this.updatedBy,
    this.cmpid,
    this.brcode,
    this.isActive,
    this.editFlag,
    this.feeTypeDescriptionVar,
    this.feeTypeNameVar,
  });

  factory FeetypesList.fromMap(Map<String, dynamic> json) => FeetypesList(
        id: json["ID"],
        feeTypeDescription: json["FeeTypeDescription"],
        feeTypeName: json["FeeTypeName"],
        createdOn: json["CreatedOn"] == null ? null : DateTime.parse(json["CreatedOn"]),
        createdBy: json["CreatedBy"],
        updatedOn: json["UpdatedOn"],
        updatedBy: json["UpdatedBy"],
        cmpid: json["cmpid"],
        brcode: json["brcode"],
        isActive: json["IsActive"],
        editFlag: json["EditFlag"],
        feeTypeDescriptionVar: json["FeeTypeDescriptionVar"],
        feeTypeNameVar: json["FeeTypeNameVar"],
      );

  // Map<String, dynamic> toMap() => {
  //       "ID": id,
  //       "FeeTypeDescription": feeTypeDescription,
  //       "FeeTypeName": feeTypeName,
  //       "CreatedOn": createdOn.toIso8601String(),
  //       "CreatedBy": createdBy,
  //       "UpdatedOn": updatedOn,
  //       "UpdatedBy": updatedBy,
  //       "cmpid": cmpid,
  //       "brcode": brcode,
  //       "IsActive": isActive,
  //       "EditFlag": editFlag,
  //       "FeeTypeDescriptionVar": feeTypeDescriptionVar,
  //       "FeeTypeNameVar": feeTypeNameVar,
  //     };
}

class Genral {
  int? statusFlag;
  String? statusMessage;

  Genral({
    this.statusFlag,
    this.statusMessage,
  });

  factory Genral.fromMap(Map<String, dynamic> json) => Genral(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  // Map<String, dynamic> toMap() => {
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //     };
}

class Terms {
  int? statusFlag;
  String? statusMessage;
  dynamic defaultValue;
  dynamic defaultText;
  List<TermsList>? list;

  Terms({
    this.statusFlag,
    this.statusMessage,
    this.defaultValue,
    this.defaultText,
    this.list,
  });

  factory Terms.fromMap(Map<String, dynamic> json) => Terms(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        defaultValue: json["defaultValue"],
        defaultText: json["defaultText"],
        list: json["List"] == null ? null : List<TermsList>.from(json["List"].map((x) => TermsList.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "defaultValue": defaultValue,
  //       "defaultText": defaultText,
  //       "List": List<dynamic>.from(list.map((x) => x.toMap())),
  //     };
}

class TermsList {
  int? value;
  String? text;
  dynamic ext;

  TermsList({
    this.value,
    this.text,
    this.ext,
  });

  factory TermsList.fromMap(Map<String, dynamic> json) => TermsList(
        value: json["Value"],
        text: json["Text"],
        ext: json["Ext"],
      );

  // Map<String, dynamic> toMap() => {
  //       "Value": value,
  //       "Text": text,
  //       "Ext": ext,
  //     };
}

StudentFeeModel studentFeeModelFromJson(String str) => StudentFeeModel.fromJson(json.decode(str));

String studentFeeModelToJson(StudentFeeModel data) => json.encode(data.toJson());

class StudentFeeModel {
  int? statusFlag;
  dynamic statusMessage;
  List<Feetype>? feetypes;
  Year? year;

  StudentFeeModel({
    this.statusFlag,
    this.statusMessage,
    this.feetypes,
    this.year,
  });

  factory StudentFeeModel.fromJson(Map<String, dynamic> json) => StudentFeeModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        feetypes: json["feetypes"] == null ? [] : List<Feetype>.from(json["feetypes"]!.map((x) => Feetype.fromJson(x))),
        year: json["year"] == null ? null : Year.fromJson(json["year"]),
      );

  Map<String, dynamic> toJson() => {
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
        "feetypes": feetypes == null ? [] : List<dynamic>.from(feetypes!.map((x) => x.toJson())),
        "year": year?.toJson(),
      };
}

class Feetype {
  String? feeType;
  List<Term>? terms;

  Feetype({
    this.feeType,
    this.terms,
  });

  factory Feetype.fromJson(Map<String, dynamic> json) => Feetype(
        feeType: json["fee_type"],
        terms: json["terms"] == null ? [] : List<Term>.from(json["terms"]!.map((x) => Term.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fee_type": feeType,
        "terms": terms == null ? [] : List<dynamic>.from(terms!.map((x) => x.toJson())),
      };
}

class Term {
  double? total;
  double? paid;
  double? balance;
  double? fine;
  double? discount;
  String? term;
  int? feeId;
  List<Desc>? descs;

  Term({
    this.total,
    this.paid,
    this.balance,
    this.fine,
    this.discount,
    this.term,
    this.feeId,
    this.descs,
  });

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        total: json["total"],
        paid: json["paid"],
        balance: json["balance"],
        fine: json["fine"],
        discount: json["discount"],
        term: json["term"],
        feeId: json["fee_id"],
        descs: json["descs"] == null ? [] : List<Desc>.from(json["descs"]!.map((x) => Desc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "paid": paid,
        "balance": balance,
        "fine": fine,
        "discount": discount,
        "term": term,
        "descs": descs == null ? [] : List<dynamic>.from(descs!.map((x) => x.toJson())),
      };
}

class Desc {
  String? desc;
  double? total;
  double? paid;
  double? bal;
  double? cons;
  dynamic dueDate;
  int? descId;

  Desc({
    this.desc,
    this.total,
    this.paid,
    this.bal,
    this.cons,
    this.dueDate,
    this.descId,
  });

  factory Desc.fromJson(Map<String, dynamic> json) => Desc(
        desc: json["desc"],
        total: json["total"],
        paid: json["paid"],
        bal: json["bal"],
        cons: json["cons"],
        dueDate: json["due_date"],
        descId: json["desc_id"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "total": total,
        "paid": paid,
        "bal": bal,
        "cons": cons,
        "due_date": dueDate,
        "desc_id": descId,
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

  Map<String, dynamic> toJson() => {
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
        "YearList": yearList == null ? [] : List<dynamic>.from(yearList!.map((x) => x.toJson())),
        "statusMessage": statusMessage,
        "LoginId": loginId,
        "LoginName": loginName,
        "Password": password,
        "statusFlag": statusFlag,
        "token": token,
      };
}
