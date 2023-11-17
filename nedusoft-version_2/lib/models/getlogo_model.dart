// To parse this JSON data, do
//
//     final getLogoModel = getLogoModelFromMap(jsonString);

import 'dart:convert';

class GetLogoModel {
  dynamic url;
  int? statusFlag;
  dynamic statusMessage;
  String? base64;
  dynamic webUrl;
  String? logo;

  GetLogoModel({
    this.url,
    this.statusFlag,
    this.statusMessage,
    this.base64,
    this.webUrl,
    this.logo,
  });

  factory GetLogoModel.fromJson(Map<String, dynamic> json) => GetLogoModel(
        url: json["Url"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        base64: json["Base64"],
        webUrl: json["webUrl"],
        logo: json["logo_url"],
      );

  // Map<String, dynamic> toMap() => {
  //       "Url": url,
  //       "statusFlag": statusFlag,
  //       "statusMessage": statusMessage,
  //       "Base64": base64,
  //       "webUrl": webUrl,
  //     };
}
