
import 'dart:convert';

import 'package:gaadi/api/api.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/api/responses/auth_response.dart';
import 'package:gaadi/api/responses/user_response.dart';

class UserRepository {
  API api = API();
  Future<AuthResponse> sendOTP(data) async{
    print("User Repo " + data);
    dynamic response = await api
        .postData( data, "/auth/sendOTP");

    print(response.toString());
    AuthResponse res = AuthResponse.fromJson(response);
    return res;
  }

  Future<AuthResponse> verifyOTP(data) async{
    print("User Repo " + data);

    dynamic response = await api
        .postData( data, "/auth/verifyOTP");

    print(response.toString());
    AuthResponse res = AuthResponse.fromJson(response);
    print("Verify OTP "+res.toString());
    return res;
  }


  Future<AuthResponse> login(data) async{
    print("User Repo " + data);

    dynamic response = await api
        .postData( data, "/auth/login");

    print("Login res "+response.toString());
    AuthResponse res = AuthResponse.fromJson(response);
    print("Login OTP "+res.toString());
    return res;
  }

  Future<AuthResponse> loginFast(data) async{
    print("User Repo " + data);

    dynamic response = await api
        .postDataFast( data, "/auth/login");

    print("Login res "+response.toString());
    AuthResponse res = AuthResponse.fromJson(response);
    print("Login OTP "+res.toString());
    return res;
  }

}
