import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gaadi/api/api.dart';
import 'package:gaadi/api/models/part.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/api/responses/auth_response.dart';
import 'package:gaadi/api/responses/part_response.dart';
import 'package:gaadi/api/responses/user_response.dart';

class PartRepository {
  API api = API();
  Future<PartAddResponse> addPart(data) async{
    print("Part Repo " + data);
    dynamic response = await api
        .postDataWithToken( data, "/parts");

    print("Response : " + response.toString());
    PartAddResponse res = PartAddResponse.fromJson(response);
    return res;
  }

  Future<PartDeleteResponse> deletePart(data) async{
    print("Part Repo " + data);
    dynamic response = await api
        .deleteDataWithToken( "/parts/" + data);
    print("Response : " + response.toString());
    PartDeleteResponse res = PartDeleteResponse.fromJson(response);
    return res;
  }

  Future<PartAllResponse> allParts() async{
    dynamic response = await api
        .getWithToken( "/parts");

    print("Response : " + response.toString());
    PartAllResponse res = PartAllResponse.fromJson(response);
    return res;
  }
  Future<PartAllResponse> searchParts(String search) async{
    dynamic response = await api
        .getWithToken( "/parts/search/"+ search);

    print("Response : " + response.toString());
    PartAllResponse res = PartAllResponse.fromJson(response);
    return res;
  }

  Future<PartOneResponse> oneParts(id) async{
    dynamic response = await api
        .getWithToken( "/parts/" + id);
    print("Response : " + response.toString());
    PartOneResponse res = PartOneResponse.fromJson(response);
    return res;
  }

  Future<PartAddResponse> addPartWithImages(Part data, List<String> files) async{

    dynamic response = await api
        .postDataWithTokenAndFiles( data.toFormString(), "/parts", [{"image": files}]);

    print("Response : " + response.toString());
    PartAddResponse res = PartAddResponse.fromJson(response);
    return res;
  }
}
