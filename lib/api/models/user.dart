import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.contact,
    this.email,
    this.password,
    this.token,
    this.hash,
    this.otp,
  });

  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  String? contact;
  String? password;
  String? token;
  String? hash;
  String? otp;


  factory User.fromJson(Map<String, dynamic> json) => User(
    id: int.parse(json["id"]),
    firstname: json["firstname"] == null ? "" : json["firstname"],
    lastname:json["lastname"] == null ? "" :  json["lastname"],
    contact:json["contact"] == null ? "": json["contact"],
    email:json["email"] == null ? "": json["email"],
    password: json["password"] == null ? "" : json["password"],
    token:json["token"] == null ? "":  json["token"],
    hash:json["hash"] == null ? "": json["hash"],
    otp: json["otp"] == null ? "" : json["otp"],
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "contact":contact,
    "email": email,
    "password": password,
    "token": token,
    "hash": hash,
    "otp": otp,
  };
}
