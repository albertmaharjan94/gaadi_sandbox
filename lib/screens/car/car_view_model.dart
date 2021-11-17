import 'package:flutter/material.dart';
import 'package:gaadi/api/api_response.dart';
import 'package:gaadi/api/models/vehicle.dart';
import 'package:gaadi/api/models/vehicle.dart';
import 'package:gaadi/api/repositories/vehicle_repository.dart';
import 'package:gaadi/api/repositories/vehicle_repository.dart';
import 'package:gaadi/api/responses/vehicle_response.dart';
import 'package:gaadi/api/responses/vehicle_response.dart';

class CarViewModel with ChangeNotifier{
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  VehicleAllResponse? get all {
    return all;
  }

  Vehicle _vehicle = new Vehicle();
  Vehicle get vehicle => _vehicle;

  set setVehicle(Vehicle vehicle) {
    _vehicle = vehicle;
  }

  List<Vehicle> _vehicles= [];
  List<Vehicle> get vehicles => _vehicles;

  ApiResponse get apiResponse => _apiResponse;

  setVehicles(List<Vehicle> vehicles) {
    _vehicles = vehicles;
    notifyListeners();
  }


  Future<void> getVehicles() async {
    _apiResponse = ApiResponse.loading('Fetching device data');
    notifyListeners();
    try {
      VehicleAllResponse data = await VehicleRepository().allVehicles();
      _apiResponse = ApiResponse.completed(data);
      _vehicles = data.result!;
      notifyListeners();
    } catch (e) {
      print("Viewmodel error");
      _apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
      print(e);
    }
    notifyListeners();
  }

  Future<void> searchVehicles(String search) async {
    _apiResponse = ApiResponse.loading('Fetching device data');
    notifyListeners();
    try {
      VehicleAllResponse data = await VehicleRepository().searchVehicle(search);
      _apiResponse = ApiResponse.completed(data);
      _vehicles = data.result!;
      notifyListeners();
    } catch (e) {
      print("Viewmodel error");
      _apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
      print(e);
    }
    notifyListeners();
  }

  Future<void> getOneVehicle(id) async {
    _apiResponse = ApiResponse.loading('Fetching device data');
    notifyListeners();
    try {
      VehicleOneResponse data = await VehicleRepository().oneVehicles(id);
      _apiResponse = ApiResponse.completed(data);
      _vehicle = data.result!;
      notifyListeners();
    } catch (e) {
      print("Viewmodel error");
      _apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
      print(e);
    }
    notifyListeners();
  }
}