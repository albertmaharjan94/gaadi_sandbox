
import 'package:gaadi/api/api.dart';
import 'package:gaadi/api/models/user.dart';

class UserRepository {
  API api = API();
  Future<User> sendOTP(data) async{
    dynamic response = await api
        .postData("/sendOTP", data);
    final res = response['hash'];
    final user = User(email: res["user"]["email"], hash: res["hash"]);
    return user;
  }

  // WIP
  // Future<User> verifyOTP(data) async{
  //   // http://127.0.0.1:3000/api/verifyOTP
  // }
}
