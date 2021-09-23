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

  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  String? contact;
  String? password;
  String? token;
  String? hash;
  String? otp;


  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    contact: json["contact"],
    email: json["email"],
    password: json["password"],
    token: json["token"],
    hash: json["hash"],
    otp: json["otp"],
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
