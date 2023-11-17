// To parse this JSON data, do
//
//     final studentFamilyModel = studentFamilyModelFromMap(jsonString);

import 'dart:convert';

class StudentFamilyModel {
  String? fatherName;
  dynamic fQualification;
  dynamic fProfession;
  dynamic fIncome;
  dynamic fCompany;
  dynamic fCompanyAddress;
  String? fMobile;
  dynamic fEmail;
  String? motherName;
  dynamic mQualification;
  dynamic mProfession;
  dynamic mIncome;
  dynamic mCompany;
  dynamic mCompanyAddress;
  String? mMobile;
  dynamic mEmail;
  dynamic siblingName1;
  dynamic siblingClass1;
  dynamic siblingDob1;
  dynamic siblingName2;
  dynamic siblingClass2;
  dynamic siblingDob2;
  int? statusFlag;
  String? statusMessage;

  StudentFamilyModel({
    this.fatherName,
    this.fQualification,
    this.fProfession,
    this.fIncome,
    this.fCompany,
    this.fCompanyAddress,
    this.fMobile,
    this.fEmail,
    this.motherName,
    this.mQualification,
    this.mProfession,
    this.mIncome,
    this.mCompany,
    this.mCompanyAddress,
    this.mMobile,
    this.mEmail,
    this.siblingName1,
    this.siblingClass1,
    this.siblingDob1,
    this.siblingName2,
    this.siblingClass2,
    this.siblingDob2,
    this.statusFlag,
    this.statusMessage,
  });

  factory StudentFamilyModel.fromJson(Map<String, dynamic> json) => StudentFamilyModel(
        fatherName: json["FatherName"],
        fQualification: json["FQualification"],
        fProfession: json["FProfession"],
        fIncome: json["FIncome"],
        fCompany: json["FCompany"],
        fCompanyAddress: json["FCompanyAddress"],
        fMobile: json["FMobile"],
        fEmail: json["FEmail"],
        motherName: json["MotherName"],
        mQualification: json["MQualification"],
        mProfession: json["MProfession"],
        mIncome: json["MIncome"],
        mCompany: json["MCompany"],
        mCompanyAddress: json["MCompanyAddress"],
        mMobile: json["MMobile"],
        mEmail: json["MEmail"],
        siblingName1: json["SiblingName_1"],
        siblingClass1: json["SiblingClass_1"],
        siblingDob1: json["SiblingDOB_1"],
        siblingName2: json["SiblingName_2"],
        siblingClass2: json["SiblingClass_2"],
        siblingDob2: json["SiblingDOB_2"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toMap() => {
        "FatherName": fatherName,
        "FQualification": fQualification,
        "FProfession": fProfession,
        "FIncome": fIncome,
        "FCompany": fCompany,
        "FCompanyAddress": fCompanyAddress,
        "FMobile": fMobile,
        "FEmail": fEmail,
        "MotherName": motherName,
        "MQualification": mQualification,
        "MProfession": mProfession,
        "MIncome": mIncome,
        "MCompany": mCompany,
        "MCompanyAddress": mCompanyAddress,
        "MMobile": mMobile,
        "MEmail": mEmail,
        "SiblingName_1": siblingName1,
        "SiblingClass_1": siblingClass1,
        "SiblingDOB_1": siblingDob1,
        "SiblingName_2": siblingName2,
        "SiblingClass_2": siblingClass2,
        "SiblingDOB_2": siblingDob2,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}
