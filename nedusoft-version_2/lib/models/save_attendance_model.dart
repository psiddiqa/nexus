// To parse this JSON data, do
//
//     final saveAttendanceResult = saveAttendanceResultFromMap(jsonString);

import 'dart:convert';


class SaveAttendanceResult {
  dynamic list;
  OutputModel? output;
  dynamic input;
  dynamic compose;
  dynamic fromTime;
  dynamic toTime;
  bool? isSession;
  dynamic headerId;
  dynamic branchName;
  dynamic apiKey;

  SaveAttendanceResult({
    this.list,
    this.output,
    this.input,
    this.compose,
    this.fromTime,
    this.toTime,
    this.isSession,
    this.headerId,
    this.branchName,
    this.apiKey,
  });

  factory SaveAttendanceResult.fromJson(Map<String, dynamic> json) => SaveAttendanceResult(
        list: json["List"],
        output: json["output"] == null ? null : OutputModel.fromJson(json["output"]),
        input: json["input"],
        compose: json["Compose"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        isSession: json["IsSession"],
        headerId: json["HeaderId"],
        branchName: json["BranchName"],
        apiKey: json["ApiKey"],
      );

}

class OutputModel {
  int? statusFlag;
  String? statusMessage;

  OutputModel({
    this.statusFlag,
    this.statusMessage,
  });

  factory OutputModel.fromJson(Map<String, dynamic> json) => OutputModel(
        statusFlag: json["statusFlag"],
        statusMessage: json["statusMessage"],
      );

}
