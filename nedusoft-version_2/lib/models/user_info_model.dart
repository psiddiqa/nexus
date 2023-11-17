// To parse this JSON data, do
//
//     final userPerIndoModel = userPerIndoModelFromMap(jsonString);

import 'dart:convert';



class UserPerInfoModel {
  String? studentName;
  String? semester;
  String? section;
  String? rollNo;
  String? admissionNo;
  String? quota;
  String? dob;
  dynamic placeOfBirth;
  String? gender;
  dynamic religion;
  dynamic caste;
  dynamic subCate;
  String? category;
  dynamic nationality;
  dynamic motherTongue;
  dynamic mediumOfInstructions;
  dynamic uid;
  dynamic language1;
  dynamic languge2;
  dynamic language3;
  dynamic lastInstitute;
  String? tcNo;
  dynamic diceNo;
  dynamic sportsNational;
  dynamic sportsState;
  dynamic sportsLevel;
  dynamic waiver;
  dynamic passport;
  dynamic schoolership;
  dynamic remarks;
  dynamic otherActivity;
  dynamic studentMobile;
  dynamic country;
  dynamic city;
  dynamic pincode;
  String? addressLine1;
  dynamic addressLine2;
  String? status;
  int? statusFlag;
  String? statusMessage;
  dynamic photo;
  String? base64String;

  UserPerInfoModel({
    this.studentName,
    this.semester,
    this.section,
    this.rollNo,
    this.admissionNo,
    this.quota,
    this.dob,
    this.placeOfBirth,
    this.gender,
    this.religion,
    this.caste,
    this.subCate,
    this.category,
    this.nationality,
    this.motherTongue,
    this.mediumOfInstructions,
    this.uid,
    this.language1,
    this.languge2,
    this.language3,
    this.lastInstitute,
    this.tcNo,
    this.diceNo,
    this.sportsNational,
    this.sportsState,
    this.sportsLevel,
    this.waiver,
    this.passport,
    this.schoolership,
    this.remarks,
    this.otherActivity,
    this.studentMobile,
    this.country,
    this.city,
    this.pincode,
    this.addressLine1,
    this.addressLine2,
    this.status,
    this.statusFlag,
    this.statusMessage,
    this.photo,
    this.base64String,
  });

  factory UserPerInfoModel.fromJson(Map<String, dynamic> json) => UserPerInfoModel(
        studentName: json["StudentName"],
        semester: json["Semester"],
        section: json["Section"],
        rollNo: json["RollNo"],
        admissionNo: json["AdmissionNo"],
        quota: json["Quota"],
        dob: json["DOB"],
        placeOfBirth: json["PlaceOfBirth"],
        gender: json["Gender"],
        religion: json["Religion"],
        caste: json["Caste"],
        subCate: json["SubCate"],
        category: json["Category"],
        nationality: json["Nationality"],
        motherTongue: json["MotherTongue"],
        mediumOfInstructions: json["MediumOfInstructions"],
        uid: json["UID"],
        language1: json["Language_1"],
        languge2: json["Languge_2"],
        language3: json["Language_3"],
        lastInstitute: json["LastInstitute"],
        tcNo: json["TCNo"],
        diceNo: json["DiceNo"],
        sportsNational: json["SportsNational"],
        sportsState: json["SportsState"],
        sportsLevel: json["SportsLevel"],
        waiver: json["Waiver"],
        passport: json["Passport"],
        schoolership: json["Schoolership"],
        remarks: json["Remarks"],
        otherActivity: json["OtherActivity"],
        studentMobile: json["StudentMobile"],
        country: json["Country"],
        city: json["City"],
        pincode: json["Pincode"],
        addressLine1: json["AddressLine_1"],
        addressLine2: json["AddressLine_2"],
        status: json["Status"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        photo: json["Photo"],
        base64String: json["Base64String"],
      );

  Map<String, dynamic> toMap() => {
        "StudentName": studentName,
        "Semester": semester,
        "Section": section,
        "RollNo": rollNo,
        "AdmissionNo": admissionNo,
        "Quota": quota,
        "DOB": dob,
        "PlaceOfBirth": placeOfBirth,
        "Gender": gender,
        "Religion": religion,
        "Caste": caste,
        "SubCate": subCate,
        "Category": category,
        "Nationality": nationality,
        "MotherTongue": motherTongue,
        "MediumOfInstructions": mediumOfInstructions,
        "UID": uid,
        "Language_1": language1,
        "Languge_2": languge2,
        "Language_3": language3,
        "LastInstitute": lastInstitute,
        "TCNo": tcNo,
        "DiceNo": diceNo,
        "SportsNational": sportsNational,
        "SportsState": sportsState,
        "SportsLevel": sportsLevel,
        "Waiver": waiver,
        "Passport": passport,
        "Schoolership": schoolership,
        "Remarks": remarks,
        "OtherActivity": otherActivity,
        "StudentMobile": studentMobile,
        "Country": country,
        "City": city,
        "Pincode": pincode,
        "AddressLine_1": addressLine1,
        "AddressLine_2": addressLine2,
        "Status": status,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
        "Photo": photo,
        "Base64String": base64String,
      };
}
