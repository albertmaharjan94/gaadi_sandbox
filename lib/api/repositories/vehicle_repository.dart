import 'package:gaadi/api/api.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/api/models/vehicle.dart';
import 'package:gaadi/api/responses/vehicle_response.dart';

class VehicleRepository {
  API api = API();

  Future<VehicleAddResponse> addVehicle(data) async {
    print("Vehicle Repo " + data);
    dynamic response = await api.postDataWithToken(data, "/vehicle");

    print("Response : " + response.toString());
    VehicleAddResponse res = VehicleAddResponse.fromJson(response);
    return res;
  }

  Future<VehicleDeleteResponse> deleteVehicle(data) async {
    print("Vehicle Repo " + data);
    dynamic response = await api.deleteDataWithToken("/vehicle/" + data);
    print("Response : " + response.toString());
    VehicleDeleteResponse res = VehicleDeleteResponse.fromJson(response);
    return res;
  }

  Future<VehicleAllResponse> allVehicles() async {
    dynamic response = await api.getWithToken("/vehicle");

    print("Response : " + response.toString());
    VehicleAllResponse res = VehicleAllResponse.fromJson(response);
    return res;
  }

  Future<VehicleAllResponse> searchVehicle(String search) async {
    dynamic response = await api.getWithToken("/vehicle/search/"+ search);
    print("Response : " + response.toString());
    VehicleAllResponse res = VehicleAllResponse.fromJson(response);
    return res;
  }

  Future<VehicleOneResponse> oneVehicles(id) async {
    dynamic response = await api.getWithToken("/vehicle/" + id);

    VehicleOneResponse res = VehicleOneResponse.fromJson(response);
    return res;
  }

  Future<VehicleAddResponse> addVehicleWithImages(Vehicle data,
      List<String> files, List<String> features) async {
    dynamic response =
    await api.postDataWithTokenAndFiles(data.toFormString(), "/vehicle", [
      {"image": files},
      {"features": features}
    ]);

    print("Response : " + response.toString());
    VehicleAddResponse res = VehicleAddResponse.fromJson(response);
    return res;
  }
}
