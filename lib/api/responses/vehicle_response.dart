// To parse this JSON data, do
//
//     final vehicleAddResponse = vehicleAddResponseFromJson(jsonString);

import 'dart:convert';

import 'package:gaadi/api/models/vehicle.dart';


VehicleAddResponse vehicleAddResponseFromJson(String str) => VehicleAddResponse.fromJson(json.decode(str));
String vehicleAddResponseToJson(VehicleAddResponse data) => json.encode(data.toJson());

class VehicleAddResponse {
  VehicleAddResponse({
    this.success,
    this.message,
    this.result,
  });

  bool? success;
  String? message;
  Vehicle? result;

  factory VehicleAddResponse.fromJson(Map<String, dynamic> json) => VehicleAddResponse(
    success: json["success"],
    message: json["message"],
    result: Vehicle.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result!.toJson(),
  };
}



VehicleAllResponse vehicleAllResponseFromJson(String str) => VehicleAllResponse.fromJson(json.decode(str));

String vehicleAllResponseToJson(VehicleAllResponse data) => json.encode(data.toJson());

class VehicleAllResponse {
  VehicleAllResponse({
    this.success,
    this.message,
    this.result,
  });

  bool? success;
  String? message;
  List<Vehicle>? result;

  factory VehicleAllResponse.fromJson(Map<String, dynamic> json) => VehicleAllResponse(
    success: json["success"],
    message: json["message"],
    result: List<Vehicle>.from(json["result"].map((x) => Vehicle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}




VehicleOneResponse vehicleOneResponseFromJson(String str) => VehicleOneResponse.fromJson(json.decode(str));

String vehicleOneResponseToJson(VehicleAllResponse data) => json.encode(data.toJson());

class VehicleOneResponse {
  VehicleOneResponse({
    this.success,
    this.message,
    this.result,
  });

  bool? success;
  String? message;
  Vehicle? result;

  factory VehicleOneResponse.fromJson(Map<String, dynamic> json) => VehicleOneResponse(
    success: json["success"],
    message: json["message"],
    result: Vehicle.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result == null ? [] : result!.toJson(),
  };
}



class VehicleDeleteResponse {
  VehicleDeleteResponse({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory VehicleDeleteResponse.fromJson(Map<String, dynamic> json) => VehicleDeleteResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}