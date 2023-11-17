// To parse this JSON data, do
//
//     final staffPersonalInfoModel = staffPersonalInfoModelFromMap(jsonString);

import 'dart:convert';

class StaffPersonalInfoModel {
  int? employeeId;
  String? employeeCode;
  int? categoryId;
  String? category;
  int? personId;
  int? departmentId;
  String? departmentName;
  int? designationId;
  int? employeeTypeId;
  dynamic tillDate;
  dynamic totalExperience;
  String? mobileNo;
  String? email;
  DateTime? dob;
  DateTime? doj;
  String? gender;
  int? maritalStatus;
  String? qualification;
  double? height;
  double? weight;
  String? brcode;
  String? cmpid;
  dynamic otHours;
  dynamic nationalityId;
  String? photo;
  int? statusFlag;
  String? statusMessage;
  dynamic emplist;
  dynamic dlNo;
  dynamic nationality;
  dynamic bankAccount;
  dynamic pfNo;
  String? panNo;
  dynamic eslNo;
  int? bloodGroup;
  dynamic visaNo;
  dynamic passport;
  String? dateOb;
  String? dateOj;
  String? maritalStatusName;
  String? bloodGroupName;
  int? userId;
  dynamic firstName;
  dynamic lastName;
  dynamic middleName;
  String? employeeName;
  int? loginId;
  dynamic loginName;
  dynamic password;
  dynamic token;
  int? adressId;
  String? addressLine1;
  dynamic addressLine2;
  dynamic city;
  dynamic countryStateId;
  dynamic postalCode;
  dynamic adressTypeId;
  dynamic labelName;
  int? familyId;
  dynamic name;
  dynamic fdob;
  dynamic age;
  dynamic relation;
  dynamic occupation;
  dynamic adress;
  int? eapId;
  dynamic degree;
  dynamic year;
  dynamic division;
  dynamic percentage;
  dynamic subject;
  dynamic institution;
  int? slno;
  dynamic workPeriod;
  dynamic institute;
  dynamic board;
  String? designation;
  dynamic natureOfDuties;
  dynamic salaryDrawn;
  int? lNo;
  dynamic languageId;
  dynamic langSpeak;
  dynamic langRead;
  dynamic langWrite;
  dynamic languageName;
  String? base64String;

  StaffPersonalInfoModel({
    this.employeeId,
    this.employeeCode,
    this.categoryId,
    this.category,
    this.personId,
    this.departmentId,
    this.departmentName,
    this.designationId,
    this.employeeTypeId,
    this.tillDate,
    this.totalExperience,
    this.mobileNo,
    this.email,
    this.dob,
    this.doj,
    this.gender,
    this.maritalStatus,
    this.qualification,
    this.height,
    this.weight,
    this.brcode,
    this.cmpid,
    this.otHours,
    this.nationalityId,
    this.photo,
    this.statusFlag,
    this.statusMessage,
    this.emplist,
    this.dlNo,
    this.nationality,
    this.bankAccount,
    this.pfNo,
    this.panNo,
    this.eslNo,
    this.bloodGroup,
    this.visaNo,
    this.passport,
    this.dateOb,
    this.dateOj,
    this.maritalStatusName,
    this.bloodGroupName,
    this.userId,
    this.firstName,
    this.lastName,
    this.middleName,
    this.employeeName,
    this.loginId,
    this.loginName,
    this.password,
    this.token,
    this.adressId,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.countryStateId,
    this.postalCode,
    this.adressTypeId,
    this.labelName,
    this.familyId,
    this.name,
    this.fdob,
    this.age,
    this.relation,
    this.occupation,
    this.adress,
    this.eapId,
    this.degree,
    this.year,
    this.division,
    this.percentage,
    this.subject,
    this.institution,
    this.slno,
    this.workPeriod,
    this.institute,
    this.board,
    this.designation,
    this.natureOfDuties,
    this.salaryDrawn,
    this.lNo,
    this.languageId,
    this.langSpeak,
    this.langRead,
    this.langWrite,
    this.languageName,
    this.base64String,
  });

  factory StaffPersonalInfoModel.fromJson(Map<String, dynamic> json) => StaffPersonalInfoModel(
        employeeId: json["EmployeeId"],
        employeeCode: json["EmployeeCode"],
        categoryId: json["CategoryId"],
        category: json["Category"],
        personId: json["PersonId"],
        departmentId: json["DepartmentId"],
        departmentName: json["DepartmentName"],
        designationId: json["DesignationId"],
        employeeTypeId: json["EmployeeTypeId"],
        tillDate: json["TillDate"],
        totalExperience: json["TotalExperience"],
        mobileNo: json["MobileNo"],
        email: json["Email"],
        dob: json["DOB"] == null ? null : DateTime.parse(json["DOB"]),
        doj: json["DOJ"] == null ? null : DateTime.parse(json["DOJ"]),
        gender: json["Gender"],
        maritalStatus: json["MaritalStatus"],
        qualification: json["Qualification"],
        height: json["Height"],
        weight: json["Weight"],
        brcode: json["brcode"],
        cmpid: json["cmpid"],
        otHours: json["OTHours"],
        nationalityId: json["NationalityId"],
        photo: json["Photo"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        emplist: json["emplist"],
        dlNo: json["DLNo"],
        nationality: json["Nationality"],
        bankAccount: json["BankAccount"],
        pfNo: json["PFNo"],
        panNo: json["PanNo"],
        eslNo: json["ESLNo"],
        bloodGroup: json["BloodGroup"],
        visaNo: json["VisaNo"],
        passport: json["Passport"],
        dateOb: json["DateOB"],
        dateOj: json["DateOJ"],
        maritalStatusName: json["MaritalStatusName"],
        bloodGroupName: json["BloodGroupName"],
        userId: json["UserId"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        middleName: json["MiddleName"],
        employeeName: json["EmployeeName"],
        loginId: json["LoginId"],
        loginName: json["LoginName"],
        password: json["Password"],
        token: json["token"],
        adressId: json["AdressId"],
        addressLine1: json["AddressLine1"],
        addressLine2: json["AddressLine2"],
        city: json["City"],
        countryStateId: json["CountryStateId"],
        postalCode: json["PostalCode"],
        adressTypeId: json["AdressTypeId"],
        labelName: json["LabelName"],
        familyId: json["FamilyId"],
        name: json["Name"],
        fdob: json["FDOB"],
        age: json["Age"],
        relation: json["Relation"],
        occupation: json["Occupation"],
        adress: json["Adress"],
        eapId: json["EAPId"],
        degree: json["Degree"],
        year: json["Year"],
        division: json["Division"],
        percentage: json["Percentage"],
        subject: json["Subject"],
        institution: json["Institution"],
        slno: json["Slno"],
        workPeriod: json["WorkPeriod"],
        institute: json["Institute"],
        board: json["Board"],
        designation: json["Designation"],
        natureOfDuties: json["NatureOfDuties"],
        salaryDrawn: json["SalaryDrawn"],
        lNo: json["LNo"],
        languageId: json["LanguageId"],
        langSpeak: json["LangSpeak"],
        langRead: json["LangRead"],
        langWrite: json["LangWrite"],
        languageName: json["LanguageName"],
        base64String: json["Base64String"],
      );

  // Map<String, dynamic> toMap() => {
  //       "EmployeeId": employeeId,
  //       "EmployeeCode": employeeCode,
  //       "CategoryId": categoryId,
  //       "Category": category,
  //       "PersonId": personId,
  //       "DepartmentId": departmentId,
  //       "DepartmentName": departmentName,
  //       "DesignationId": designationId,
  //       "EmployeeTypeId": employeeTypeId,
  //       "TillDate": tillDate,
  //       "TotalExperience": totalExperience,
  //       "MobileNo": mobileNo,
  //       "Email": email,
  //       "DOB": dob!.toIso8601String(),
  //       "DOJ": doj!.toIso8601String(),
  //       "Gender": gender,
  //       "MaritalStatus": maritalStatus,
  //       "Qualification": qualification,
  //       "Height": height,
  //       "Weight": weight,
  //       "brcode": brcode,
  //       "cmpid": cmpid,
  //       "OTHours": otHours,
  //       "NationalityId": nationalityId,
  //       "Photo": photo,
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "emplist": emplist,
  //       "DLNo": dlNo,
  //       "Nationality": nationality,
  //       "BankAccount": bankAccount,
  //       "PFNo": pfNo,
  //       "PanNo": panNo,
  //       "ESLNo": eslNo,
  //       "BloodGroup": bloodGroup,
  //       "VisaNo": visaNo,
  //       "Passport": passport,
  //       "DateOB": dateOb,
  //       "DateOJ": dateOj,
  //       "MaritalStatusName": maritalStatusName,
  //       "BloodGroupName": bloodGroupName,
  //       "UserId": userId,
  //       "FirstName": firstName,
  //       "LastName": lastName,
  //       "MiddleName": middleName,
  //       "EmployeeName": employeeName,
  //       "LoginId": loginId,
  //       "LoginName": loginName,
  //       "Password": password,
  //       "token": token,
  //       "AdressId": adressId,
  //       "AddressLine1": addressLine1,
  //       "AddressLine2": addressLine2,
  //       "City": city,
  //       "CountryStateId": countryStateId,
  //       "PostalCode": postalCode,
  //       "AdressTypeId": adressTypeId,
  //       "LabelName": labelName,
  //       "FamilyId": familyId,
  //       "Name": name,
  //       "FDOB": fdob,
  //       "Age": age,
  //       "Relation": relation,
  //       "Occupation": occupation,
  //       "Adress": adress,
  //       "EAPId": eapId,
  //       "Degree": degree,
  //       "Year": year,
  //       "Division": division,
  //       "Percentage": percentage,
  //       "Subject": subject,
  //       "Institution": institution,
  //       "Slno": slno,
  //       "WorkPeriod": workPeriod,
  //       "Institute": institute,
  //       "Board": board,
  //       "Designation": designation,
  //       "NatureOfDuties": natureOfDuties,
  //       "SalaryDrawn": salaryDrawn,
  //       "LNo": lNo,
  //       "LanguageId": languageId,
  //       "LangSpeak": langSpeak,
  //       "LangRead": langRead,
  //       "LangWrite": langWrite,
  //       "LanguageName": languageName,
  //       "Base64String": base64String,
  //     };
}
