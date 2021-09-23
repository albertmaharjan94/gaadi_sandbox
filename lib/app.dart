import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaadi/api/repositories/user_repository.dart';
import 'package:gaadi/routes.dart';
import 'package:gaadi/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api.dart';
import 'api/responses/auth_response.dart';
import 'api/responses/user_response.dart';
import 'onboarding.dart';
import 'screens/home/homepage.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool deviceToken = false;
  var appId;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
        title: 'GAADI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF6B48FF),
          scaffoldBackgroundColor: Colors.white,
          dividerColor: Colors.transparent,
        ),
        initialRoute: SplashScreen.routeName,
        routes: routes);
  }
}

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    try {
      if (sharedPref.containsKey("LoggedInUser") &&
          sharedPref.getString("LoggedInUser") != "null") {
        print("LoggedInUser : " + sharedPref.getString("LoggedInUser"));
        print(sharedPref.getString("LoggedInUser") == "null");

        String _loggedInUser = sharedPref.getString("LoggedInUser");

        UserRepository repo = UserRepository();
        var _loggedJson = jsonDecode(_loggedInUser);
        try {
          AuthResponse res = await repo.loginFast(
              jsonEncode({"contact":_loggedJson["contact"], "password":_loggedJson["password"]}));
          if (res.success == true) {
            sharedPref.setString("token", res.authToken);
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          } else {
            Navigator.of(context).pushReplacementNamed(OnBoarding.routeName);
          }
        } catch (e) {
          print(e);
          if (_loggedJson["contact"] == null &&
              _loggedJson["password"] == null) {
            Navigator.of(context).pushReplacementNamed(OnBoarding.routeName);
          } else {
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          }
        }
      } else {
        Navigator.of(context).pushReplacementNamed(OnBoarding.routeName);
      }
    } catch (e) {
      print(e);
      sharedPref.remove("LoggedInUser");
      Navigator.of(context).pushReplacementNamed(OnBoarding.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: new Center(
          child: new Image.asset(
            'assets/images/_board3.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
