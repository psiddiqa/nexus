// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);




class LoginModel {
  int? loginId;
  dynamic loginName;
  dynamic status;
  dynamic user;
  String? authentication;
  String? fullName;
  String? token;
  String? cmpid;
  String? brcode;
  String? employeeCode;
  int? courseId;
  int? employeeId;
  int? personId;
  bool? isPlanner;
  int? yearId;
  int? classId;
  List<Section>? sections;
  bool? isSubject;
  int? statusFlag;
  String? statusMessage;

  LoginModel({
    this.loginId,
    this.loginName,
    this.status,
    this.user,
    this.authentication,
    this.fullName,
    this.token,
    this.cmpid,
    this.brcode,
    this.employeeCode,
    this.courseId,
    this.employeeId,
    this.personId,
    this.isPlanner,
    this.yearId,
    this.classId,
    this.sections,
    this.isSubject,
    this.statusFlag,
    this.statusMessage,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        loginId: json["LoginId"],
        loginName: json["LoginName"],
        status: json["Status"],
        user: json["User"],
        authentication: json["Authentication"],
        fullName: json["fullName"],
        token: json["token"],
        cmpid: json["cmpid"],
        brcode: json["brcode"],
        employeeCode: json["EmployeeCode"],
        courseId: json["CourseID"],
        employeeId: json["EmployeeId"],
        personId: json["PersonId"],
        isPlanner: json["IsPlanner"],
        yearId: json["year_id"],
        classId: json["class_id"],
        sections: json["sections"] == null ? null : List<Section>.from(json["sections"].map((x) => Section.fromMap(x))),
        isSubject: json["IsSubject"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toMap() => {
        "LoginId": loginId,
        "LoginName": loginName,
        "Status": status,
        "User": user,
        "Authentication": authentication,
        "fullName": fullName,
        "token": token,
        "cmpid": cmpid,
        "brcode": brcode,
        "EmployeeCode": employeeCode,
        "CourseID": courseId,
        "EmployeeId": employeeId,
        "PersonId": personId,
        "IsPlanner": isPlanner,
        "year_id": yearId,
        "class_id": classId,
        "sections": sections == null ? null : List<dynamic>.from(sections!.map((x) => x.toMap())),
        "IsSubject": isSubject,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
      };
}

class Section {
  int? value;
  String? text;
  dynamic ext;

  Section({
    this.value,
    this.text,
    this.ext,
  });

  factory Section.fromMap(Map<String, dynamic> json) => Section(
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
