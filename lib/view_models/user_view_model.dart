import 'package:flutter/cupertino.dart';
import 'package:gaadi/api/api_response.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/api/repositories/user_repository.dart';
import 'package:gaadi/api/responses/auth_response.dart';

class UserViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  ApiResponse _apiResponseOne = ApiResponse.initial('Empty data');

  User? _user;

  AuthResponse? _opt;

  ApiResponse get response {
    return _apiResponse;
  }

  User? get user {
    return _user;
  }

  AuthResponse? get opt {
    return _opt;
  }


  Future<void> sendOTP({User? data}) async {
    _apiResponse = ApiResponse.loading('Fetching device data');
    notifyListeners();
    try {
      AuthResponse opt = await UserRepository().sendOTP(data!);
      _apiResponse = ApiResponse.completed(opt);
    } catch (e) {
      print("User viewmodel error");
      _apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
      print(e);
    }
    notifyListeners();
  }

}
