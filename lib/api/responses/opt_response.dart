import 'dart:convert';
import 'package:gaadi/api/models/user.dart';

SendOTP sendOTPResponseFromJson(String str) => SendOTP.fromJson(json.decode(str));
String sendOTPResponseToJson(SendOTP data) => json.encode(data.toJson());

class SendOTP {
  SendOTP({
    this.success,
    this.user,
    this.hash,
  });

  bool? success;
  User? user;
  String? hash;

  factory SendOTP.fromJson(Map<String, dynamic> json) => SendOTP(
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

