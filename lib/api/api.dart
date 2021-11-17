import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

import 'api_exception.dart';


final String domain = "http://172.25.0.57:8080/api";

final String imageDomain = domain.split("/api")[0];
class API {

  // final String domain = "http://10.0.2.2:3000/api";
  // final String domain = "http://192.168.0.181:3000/api";
  // final String domain = "http://172.25.0.54:3000/api";

  Future getData(String apiUrl) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(domain + apiUrl), headers: _setHeader());
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future getWithToken(apiUrl) async {
    dynamic responseJson;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    try {
      final response = await http.get(domain + apiUrl, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future postData(data, apiUrl) async {
    dynamic responseJson;
    print("API Data "+ data);
    print("API Url "+ domain + apiUrl);
    try {
      final response = await http.post(domain + apiUrl, body: data, headers: _setHeader()).timeout(
        Duration(seconds: 30),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          throw FetchDataException('No Internet Connection');
        },
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future postDataFast(data, apiUrl) async {
    dynamic responseJson;
    print("API Data "+ data);
    print("API Url "+ domain + apiUrl);
    try {
      final response = await http.post(domain + apiUrl, body: data, headers: _setHeader()).timeout(
        Duration(seconds: 2),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          throw FetchDataException('No Internet Connection');
        },
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future postDataWithHeader(data, apiUrl) async {
    dynamic responseJson;
    try {
      final response =
          await http.post(domain + apiUrl, body: data, headers: _setHeaders());
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }



  Future postDataWithToken(data, apiUrl) async {
    dynamic responseJson;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    try {
      final response = await http.post(domain + apiUrl, body: data, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token
      });
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future postDataWithTokenAndFiles(data, apiUrl, List<Map<String, List<String>>> images) async {
    dynamic responseJson;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    };

    var request = http.MultipartRequest("POST", Uri.parse(domain + apiUrl));

    request.fields.addAll(data);
    print("IMage" + images.toString());
    images.forEach((element) {
      print(element.toString());
      element.values.first.forEach((i) {
        var _image = File(i);
        print(_image);
        request.files.add(
          http.MultipartFile(
            element.keys.first,
            _image.readAsBytes().asStream(),
            _image.lengthSync(),
            filename: "image.jpg",
            contentType: MediaType('image', 'jpeg'),
          ),
        );
      });
    });

    request.headers.addAll(headers);
    try {
      final response = await request.send();
      responseJson = await http.Response.fromStream(response);
      responseJson = returnResponse(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }



  Future deleteDataWithToken(apiUrl) async {
    dynamic responseJson;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    try {
      final response = await http.delete(domain + apiUrl, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token
      });
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


  _setHeaders() => {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
      };

  _setHeader() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}