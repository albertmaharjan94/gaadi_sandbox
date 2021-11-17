// To parse this JSON data, do
//
//     final decorationResponse = decorationResponseFromJson(jsonString);

import 'dart:convert';
import 'package:gaadi/api/models/decoration.dart';

DecorationResponse decorationResponseFromJson(String str) => DecorationResponse.fromJson(json.decode(str));
String decorationResponseToJson(DecorationResponse data) => json.encode(data.toJson());

class DecorationResponse {
  DecorationResponse({
    required this.success,
    required this.message,
    required this.result,
  });

  bool success;
  String message;
  Decoration result;

  factory DecorationResponse.fromJson(Map<String, dynamic> json) => DecorationResponse(
    success: json["success"],
    message: json["message"],
    result: Decoration.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result.toJson(),
  };
}
