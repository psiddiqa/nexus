// To parse this JSON data, do
//
//     final getBaseUrl = getBaseUrlFromMap(jsonString);

import 'dart:convert';

class GetBaseUrl {
  String? url;
  int? statusFlag;
  String? statusMessage;
  dynamic base64;
  String? webUrl;

  GetBaseUrl({
    this.url,
    this.statusFlag,
    this.statusMessage,
    this.base64,
    this.webUrl,
  });

  factory GetBaseUrl.fromJson(Map<String, dynamic> json) => GetBaseUrl(
        url: json["Url"],
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
        base64: json["Base64"],
        webUrl: json["webUrl"],
      );

  Map<String, dynamic> toMap() => {
        "Url": url,
        "statusFlag": statusFlag,
        "statusMessage": statusMessage,
        "Base64": base64,
        "webUrl": webUrl,
      };
}
