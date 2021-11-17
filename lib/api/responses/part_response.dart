// To parse this JSON data, do
//
//     final partAddResponse = partAddResponseFromJson(jsonString);

import 'dart:convert';

import 'package:gaadi/api/models/part.dart';

PartAddResponse partAddResponseFromJson(String str) => PartAddResponse.fromJson(json.decode(str));
String partAddResponseToJson(PartAddResponse data) => json.encode(data.toJson());

class PartAddResponse {
  PartAddResponse({
    this.success,
    this.message,
    this.result,
  });

  bool? success;
  String? message;
  Part? result;

  factory PartAddResponse.fromJson(Map<String, dynamic> json) => PartAddResponse(
    success: json["success"],
    message: json["message"],
    result: Part.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result!.toJson(),
  };
}



PartAllResponse partAllResponseFromJson(String str) => PartAllResponse.fromJson(json.decode(str));

String partAllResponseToJson(PartAllResponse data) => json.encode(data.toJson());

class PartAllResponse {
  PartAllResponse({
    this.success,
    this.message,
    this.result,
  });

  bool? success;
  String? message;
  List<Part>? result;

  factory PartAllResponse.fromJson(Map<String, dynamic> json) => PartAllResponse(
    success: json["success"],
    message: json["message"],
    result: List<Part>.from(json["result"].map((x) => Part.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}




PartOneResponse partOneResponseFromJson(String str) => PartOneResponse.fromJson(json.decode(str));

String partOneResponseToJson(PartAllResponse data) => json.encode(data.toJson());

class PartOneResponse {
  PartOneResponse({
    this.success,
    this.message,
    this.result,
  });

  bool? success;
  String? message;
  Part? result;

  factory PartOneResponse.fromJson(Map<String, dynamic> json) => PartOneResponse(
    success: json["success"],
    message: json["message"],
    result: Part.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result == null ? [] : result!.toJson(),
  };
}



class PartDeleteResponse {
  PartDeleteResponse({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory PartDeleteResponse.fromJson(Map<String, dynamic> json) => PartDeleteResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}