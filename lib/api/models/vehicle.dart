import 'dart:convert';

import 'package:gaadi/api/models/user.dart';

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));

String vehicleToJson(Vehicle data) => json.encode(data.toJson());

class Vehicle {
  Vehicle({
    this.id,
    this.title,
    this.model,
    this.make,
    this.location,
    this.contact,
    this.features,
    this.specifications,
    this.user,
  });

  final String? id;
  final String? title;
  final String? model;
  final String? make;
  List<double>? location;
  String? contact;
  List<FeatureModel>? features;
  User? user;
  List<SpecificationModel>? specifications;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["_id"],
        title: json["title"],
        model: json["model"],
        make: json["make"],
        location: json["location"],
        contact: json["contact"],
        features: json["features"],
        specifications: json["specifications"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "model": model,
        "make": make,
        "location": location,
        "contact": contact,
        "features": features,
        "specifications": specifications,
        "user": user,
      };
}

class SpecificationModel{
  SpecificationModel({
    this.key,
    this.value,
  });

  final String? key;
  final List<SingleSpecificationModel>? value;

  factory SpecificationModel.fromJson(Map<String, dynamic> json) => SpecificationModel(
    key: json["key"],
    value: json["value"],
  );
}


class SingleSpecificationModel{
  SingleSpecificationModel({
    this.key,
    this.value,
  });

  final String? key;
  final String? value;

  factory SingleSpecificationModel.fromJson(Map<String, dynamic> json) => SingleSpecificationModel(
    key: json["key"],
    value: json["value"],
  );
}


class FeatureModel{
  FeatureModel({
    this.title,
    this.image,
  });

  final String? title;
  final String? image;

  factory FeatureModel.fromJson(Map<String, dynamic> json) => FeatureModel(
    title: json["title"],
    image: json["image"],
  );
}
