import 'dart:convert';

import 'package:gaadi/api/models/user.dart';

Part partFromJson(String str) => Part.fromJson(json.decode(str));
String partToJson(Part data) => json.encode(data.toJson());
String partToJsonString(Part data) => json.encode(data.toFormString());

class Part {
  Part({
    this.id,
    this.title,
    this.image,
    this.price,
    this.make,
    this.model,
    this.contact,
    this.location,
    this.specification,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int? id;
  String? title;
  List<String>? image;
  int? price;
  String? make;
  String? model;
  List<String>? contact;
  dynamic location;
  List<Map<String, String>>? specification;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        id: json["id"].runtimeType == String ? int.parse(json["id"]) : json["id"],
        title: json["title"] == null ? "" : json["title"],
        image: json["image"] == null ? [] : List<String>.from(json["image"].map((x) => x)),
        price: json["price"].runtimeType == String ? int.parse(json["price"]) : json["price"],
        make: json["make"] == null ? "" : json["make"],
        model: json["model"] == null ? "" : json["model"],
        contact:  json["contact"] == null ? [] : List<String>.from(json["contact"].map((x) => x)),
        location: json["location"] == null ? [] : json["location"],
        specification: json["specification"] == null ? [] :
          List<Map<String, String>>.from(json["specification"].map((x) => Map<String, String>.from(x))),
        userId: json["user_id"].runtimeType == String ? int.parse(json["user_id"]): json["user_id"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "price": price,
        "make": make,
        "model": model,
        "contact":
            contact == null ? [] : List<dynamic>.from(contact!.map((x) => x)),
        "location": location,
        "specification": specification == null
            ? []
            : List<Map<String, String>>.from(specification!.map((x) => x)),
        "user_id": userId,
        "created_at": createdAt == null ? DateTime.now().toIso8601String() : createdAt!.toIso8601String(),
        "updated_at": updatedAt== null ? DateTime.now().toIso8601String() : updatedAt!.toIso8601String(),
        "user": user!.toJson(),
      };

  Map<String, String> toFormString() => {
    "title": title == null ? "" : title.toString(),
    // "image": image == null ? [].toString() : List<String>.from(image!.map((x) => x)).toString(),
    "price": price == null ? "": price.toString(),
    "make": make == null ? "" :make.toString(),
    "model": model == null ? "" : model.toString(),
    "contact":
    contact == null ? [].toString() : List<String>.from(contact!.map((x) => x)).toString(),
    "location": location == null ? [].toString() : location.toString(),
    "specification": specification == null
        ? [].toString()
        : jsonEncode(List<Map<String, String>>.from(specification!.map((x) =>
  Map<String, String>.from(x.map((key, value) => MapEntry( key.toString(), value.toString())))))),
    // "user_id": userId.toString(),
    "created_at": createdAt == null ? DateTime.now().toIso8601String() : createdAt!.toIso8601String(),
    "updated_at": updatedAt== null ? DateTime.now().toIso8601String() : updatedAt!.toIso8601String(),
    "user": user == null ? new User().toString() : user!.toJson().toString(),
    "user_id": userId.toString(),
  };
}
