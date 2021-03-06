// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';
import 'package:gaadi/api/models/user.dart';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.success,
    this.user,
    this.hash,
    this.message,
  });

  bool? success;
  User? user;
  String? hash;
  String? message;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    success: json["success"],
    user: json["user"]!=null ? User.fromJson(json["user"]): null,
    hash: json["hash"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "user": user?.toJson(),
    "hash": hash,
    "message": message,
  };
}

