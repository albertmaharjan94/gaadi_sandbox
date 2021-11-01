import 'dart:convert';

import 'package:gaadi/api/models/user.dart';

Part partFromJson(String str) => Part.fromJson(json.decode(str));

String partToJson(Part data) => json.encode(data.toJson());

class Part {
  Part({
    this.id,
    this.title,
    this.model,
    this.price,
    this.location,
    this.contact,
    this.specifications,
    this.user,
    this.images,
  });

  final String? id;
  final String? title;
  final String? model;
  final String? price;
  List<double>? location;
  String? contact;
  User? user;
  List<String>? images;
  List<SpecificationModel>? specifications;

  factory Part.fromJson(Map<String, dynamic> json) => Part(
    id: json["_id"],
    title: json["title"],
    model: json["model"],
    price: json["price"],
    location: json["location"],
    contact: json["contact"],
    specifications: json["specifications"],
    user: json["user"],
    images: json["images"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "model": model,
    "price": price,
    "location": location,
    "contact": contact,
    "specifications": specifications,
    "user": user,
    "images": images,
  };
}

class SpecificationModel{
  SpecificationModel({
    this.key,
    this.value,
  });

  final String? key;
  final String? value;

  factory SpecificationModel.fromJson(Map<String, dynamic> json) => SpecificationModel(
    key: json["key"],
    value: json["value"],
  );
}
