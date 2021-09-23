import 'dart:convert';
import 'package:gaadi/api/models/user.dart';

AuthResponse sendOTPResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));
String sendOTPResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    this.success,
    this.user,
    this.hash,
    this.message,
    this.authToken,
  });

  bool? success;
  User? user;
  String? hash;
  String? message;
  String? authToken;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    success: json["success"],
    user: json["user"]!=null ? User.fromJson(json["user"]): null,
    hash: json["hash"],
    message: json["message"],
    authToken: json["authToken"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "user": user?.toJson(),
    "hash": hash,
    "message": message,
    "authToken": authToken,
  };
}

