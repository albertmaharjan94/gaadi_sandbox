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
    this.token,
    this.hash,
  });

  final String? id;
  final String? firstname;
  final String? lastname;
  final DateTime? contact;
  final DateTime? email;
  final int? token;
  final String? hash;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    contact: json["contact"],
    email: json["email"],
    token: json["token"],
    hash: json["hash"],
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "contact":contact,
    "email": email,
    "token": token,
    "hash": hash,
  };
}
