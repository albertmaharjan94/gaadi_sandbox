// To parse this JSON data, do
//
//     final decoration = decorationFromJson(jsonString);

import 'dart:convert';

import 'package:gaadi/api/models/user.dart';

Decoration decorationFromJson(String str) => Decoration.fromJson(json.decode(str));

String decorationToJson(Decoration data) => json.encode(data.toJson());

class Decoration {
  Decoration({
    this.title,
    this.price,
    this.make,
    this.model,
    this.image,
    this.contacts,
    this.longitude,
    this.latitude,
    this.description,
    this.userId,
    this.id,
    this.user,
  });

  String? title;
  String? price;
  String? make;
  String? model;
  String? description;
  List<String>? image;
  List<String>? contacts;
  String? longitude;
  String? latitude;
  String? userId;
  User? user;
  int? id;

  factory Decoration.fromJson(Map<String, dynamic> json) => Decoration(
    title: json["title"],
    price: json["price"],
    make: json["make"],
    model: json["model"],
    description: json["description"],
    image: List<String>.from(json["image"].map((x) => x)),
    contacts: List<String>.from(json["contacts"].map((x) => x)),
    longitude: json["longitude"],
    latitude: json["latitude"],
    userId: json["user_id"],
    user: json["user"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "price": price,
    "make": make,
    "model": model,
    "description": description,
    "image": image== null ? []: List<dynamic>.from(image!.map((x) => x)),
    "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x)),
    "longitude": longitude,
    "latitude": latitude,
    "user_id": userId,
    "user": user,
    "id": id,
  };
}
