import 'package:flutter/material.dart';
import 'package:gaadi/api/api_response.dart';
import 'package:gaadi/api/models/part.dart';
import 'package:gaadi/api/repositories/part_repository.dart';
import 'package:gaadi/api/responses/part_response.dart';

class PartViewModel with ChangeNotifier{
  ApiResponse apiResponse = ApiResponse.initial('Empty data');

  PartAllResponse? get all {
    return all;
  }

  Part _part = new Part();
  Part get part => _part;


  set setPart(Part part) {
    _part = part;
  }

  List<Part> _parts= [];
  List<Part> get parts => _parts;

  setParts(List<Part> parts) {
    _parts = parts;
    notifyListeners();
  }


  Future<void> getParts() async {
    apiResponse = ApiResponse.loading('Fetching device data');
    notifyListeners();
    try {
      PartAllResponse data = await PartRepository().allParts();
      apiResponse = ApiResponse.completed(data);
      _parts = data.result!;
      notifyListeners();
    } catch (e) {
      print("Viewmodel error");
      apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
      print(e);
    }
    notifyListeners();
  }
  Future<void> searchParts(String search) async {
    apiResponse = ApiResponse.loading('Fetching device data');
    notifyListeners();
    try {
      PartAllResponse data = await PartRepository().searchParts(search);
      apiResponse = ApiResponse.completed(data);
      _parts = data.result!;
      notifyListeners();
    } catch (e) {
      print("Viewmodel error");
      apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
      print(e);
    }
    notifyListeners();
  }

  Future<void> getOnePart(id) async {
    apiResponse = ApiResponse.loading('Fetching device data');
    notifyListeners();
    try {
      PartOneResponse data = await PartRepository().oneParts(id);
      apiResponse = ApiResponse.completed(data);
      _part = data.result!;
      notifyListeners();
    } catch (e) {
      print("Viewmodel error");
      apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
      print(e);
    }
    notifyListeners();
  }
}