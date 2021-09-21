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
  });

  bool? success;
  User? user;
  String? hash;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    success: json["success"],
    user: User.fromJson(json["user"]),
    hash: json["hash"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "user": user?.toJson(),
    "hash": hash,
  };
}

