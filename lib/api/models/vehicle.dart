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
    this.image,
    this.price,
    this.latitude,
    this.longitude,
    this.description,
    this.contact,
    this.features,
    this.specification,
    this.user,
  });

  final int? id;
  final String? title;
  final String? model;
  final List<String>? image;
  final String? make;
  final String? description;
  final double? price;
  double? latitude;
  double? longitude;
  List<String>? contact;
  List<Map<String, String>>? features;
  User? user;
  String? user_id;
  List<SingleSpecification>? specification;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["id"].runtimeType == String ? int.parse(json["id"]) : json["id"],
        title: json["title"] == null ? "" : json["title"],
        image: json["image"] == null ? [] : List<String>.from(json["image"].map((x) => x)),
        price: json["price"].runtimeType == String ? double.parse(json["price"]) : json["price"],
        make: json["make"] == null ? "" : json["make"],
        model: json["model"] == null ? "" : json["model"],
        description: json["description"] == null ? "" : json["description"],
        contact:  json["contact"] == null ? [] : List<String>.from(json["contact"].map((x) => x.toString())),
        latitude: json["latitude"] == null ? 0.0 : double.parse(json["latitude"].toString()),
        longitude: json["longitude"] == null ? 0.0 : double.parse(json["longitude"].toString()),
        features: json["features"] == null ? [] :
            List<Map<String, String>>.from(json["features"].map((x) => Map<String, String>.from(x))),
        specification: json["specification"] == null ? [] :
        List<SingleSpecification>.from(json["specification"].map((e) {
          return SingleSpecification(
              title: e.values.first,
              key: List<Map<String, dynamic>>.from(e.values.last).map((e){
                return {e.keys.first.toString(): e.values.first.toString()};
              }).toList());
        })),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "model": model,
        "make": make,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
        "contact": contact,
        "features": features,
        "specification": specification,
        "description": description,
        "price": price,
        "user": user,
      };

    Map<String, String> toFormString() => {
    "title": title == null ? "" : title.toString(),
    "image": image == null ? [].toString() : List<String>.from(image!.map((x) => x)).toString(),
    "price": price == null ? "": price.toString(),
    "make": make == null ? "" :make.toString(),
    "model": model == null ? "" : model.toString(),
    "description": description == null ? "" : description.toString(),
    "features": features == null ? [].toString() : jsonEncode(features!.map((x) => x.keys.first.toString()).toList()),
    "contact":
    contact == null ? [].toString() : List<String>.from(contact!.map((x) => x)).toString(),
    "latitude": latitude == null ? "0" : latitude.toString(),
    "longitude": latitude == null ? "0" : latitude.toString(),
    "specification": specification == null
    ? [].toString()
        : jsonEncode(specification!.map((x) => x.toJson()).toList()),
    "user": user == null ? new User().toString() : user!.toJson().toString(),
    "user_id": user!.id.toString(),
  };
}

class SingleSpecification {
  SingleSpecification({
    this.title,
    this.key
});
  String? title;
  List<Map<String, String>>? key;

  factory SingleSpecification.fromJson(Map<String, dynamic> json) => SingleSpecification(
    title: json["title"],
    key: json["key"] == null ? [] : json["key"],
  );

  Map<String, String> toJson() => {
    "title": title.toString(),
    "key": key == null ? [].toString() : jsonEncode(List<Map<String, String>>.from(key!.map((x) =>
  Map<String, String>.from(x.map((k, v) => MapEntry( k.toString(), v.toString()))))).toList()),
  };
}
