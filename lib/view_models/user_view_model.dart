import 'package:flutter/cupertino.dart';
import 'package:gaadi/api/api_response.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/api/repositories/user_repository.dart';

class DeviceViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  ApiResponse _apiResponseOne = ApiResponse.initial('Empty data');
  User? _user;

  ApiResponse get response {
    return _apiResponse;
  }

  User? get user {
    return _user;
  }


  Future<void> sendOTP({String? data}) async {
    _apiResponse = ApiResponse.loading('Fetching device data');

    notifyListeners();
    try {
      User u = await UserRepository().sendOTP(data);
      _apiResponse = ApiResponse.completed(u);
    } catch (e) {
      print("User viewmodel error");
      _apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
      print(e);
    }
    notifyListeners();
  }

}
