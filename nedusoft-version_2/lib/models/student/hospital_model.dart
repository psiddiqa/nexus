// To parse this JSON data, do
//
//     final studentHospitalModel = studentHospitalModelFromMap(jsonString);

import 'dart:convert';

class StudentHospitalModel {
  dynamic hospitalName;
  dynamic doctorName;
  dynamic insurance;
  dynamic policy;
  dynamic fileNo;
  int? statusFlag;
  String? statusMessage;

  StudentHospitalModel({
    this.hospitalName,
    this.doctorName,
    this.insurance,
    this.policy,
    this.fileNo,
    this.statusFlag,
    this.statusMessage,
  });

  factory StudentHospitalModel.fromJson(Map<String, dynamic> json) => StudentHospitalModel(
        hospitalName: json["HospitalName"],
        doctorName: json["DoctorName"],
        insurance: json["Insurance"],
        policy: json["Policy"],
        fileNo: json["FileNo"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toMap() => {
        "HospitalName": hospitalName,
        "DoctorName": doctorName,
        "Insurance": insurance,
        "Policy": policy,
        "FileNo": fileNo,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}
