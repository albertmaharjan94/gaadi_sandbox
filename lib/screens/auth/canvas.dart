import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/routes.dart';
import 'package:gaadi/screens/auth/login.dart';
import 'package:gaadi/screens/auth/register.dart';
import 'package:gaadi/screens/home/homepage.dart';
import 'package:gaadi/size_config.dart';
import 'package:gaadi/widgets/roundedInput.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'otp.dart';

class Canvas extends StatefulWidget {
  static String routeName = "/Canvas";

  @override
  _CanvasState createState() => _CanvasState();
}

class _CanvasState extends State<Canvas> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;

  FocusNode phone = FocusNode();
  FocusNode password = FocusNode();
  var showSnipper = false;
  var playerIddd;
  final _formKey = GlobalKey<FormState>();
  bool started = false;
  int currentIndex = 0;

  void changeIndex(index) {
    setState(() => currentIndex = index);
  }

  void changeSpinner(spinner) {
    setState(() => showSnipper = spinner);
  }

  late List<Widget> _screens = [
    Login(changeIndex: changeIndex,changeSpinner: changeSpinner),
    Register(changeIndex: changeIndex, changeSpinner: changeSpinner),
    OTP(changeIndex: changeIndex, changeSpinner: changeSpinner),
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<bool> check() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    String screen = sharedUser.getString('Register');
    try{
      print("states" + screen + " " + started.toString());
      if(screen == "1" && started == false){
        changeIndex(OTP.routeIndex);
        setState(() {
          started = true;
        });
      }
    }catch(e){
      return false;
    }

    return true;
  }


  @override
  Widget build(BuildContext context) {
    check();

    List<Map<String, double>> _settings = [
      {
        "headHeight": 3,
        "containerHeight": getProportionateScreenHeight(450),
      },
      {
        "containerHeight": getProportionateScreenHeight(650),
      },
      {
        "headHeight": 2.0,
        "containerHeight": getProportionateScreenHeight(450),
      },
    ];


    print(_settings[currentIndex]);
    return  Scaffold(
            body: ModalProgressHUD(
                inAsyncCall: showSnipper,
                child:  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: SingleChildScrollView(
                          child: GestureDetector(
                        onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                        child:
                        Column(children: [
                          if (currentIndex !=1)
                            ...[AnimatedContainer(
                                height: MediaQuery.of(context).size.height /2.8,
                                duration: new Duration(milliseconds: 200),
                                child:
                                Visibility(
                                  visible: currentIndex !=1? true: false,
                                  child:
                                  Image(
                                    alignment: Alignment.center,
                                    height: 90,
                                    width: 252,
                                    image: AssetImage('assets/icons/logo.png'),
                                  ),
                                )),
                          ],
                          Container(
                              height: _settings[currentIndex]["containerHeight"]!,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(35)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: _screens[currentIndex])),
                        ]),
                      )),
                    ))));
  }
}
