import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gaadi/carousel/slide_item.dart';
import 'package:gaadi/screens/auth/bak/login.dart';
import 'package:gaadi/screens/home/homepage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTP extends StatefulWidget {
  late final int userIdOfOtp;
  static String routeName = "/otp";

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final _otp = TextEditingController();
  var showSnipper = false;
  var _check = '';
  late int userId;
  late int userOtp;

  @override
  void initState() {
    userId = 1;
    _checkPath();
    super.initState();
  }

  _checkPath() async {
    setState(() {
      showSnipper = true;
    });
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var path = localStorage.getString('signUp');
    var path = '0';
    if (path == '0') {
      _check = 'Verification';
    } else {
      _check = 'Forgot Password';
    }

    _check = 'Verification';
    setState(() {
      showSnipper = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, Login.routeName);
        return Future.value(false);
      },
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSnipper,
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: Image(
                        alignment: Alignment.center,
                        height: 90.0,
                        width: 252.0,
                        image: AssetImage('assets/icons/logo.png'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(45.0)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: [
                                  Text(
                                    _check,
                                    style: TextStyle(
                                      color: darkBlue,
                                      fontSize: 20.0,
                                      fontFamily: 'Nadillas',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'Please enter your email/mobile and we will send an OTP number',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: extraDarkBlue,
                                        fontSize: 16.0,
                                        fontFamily: 'FivoSansRegular',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: PinCodeTextField(
                                        maxLength: 4,
                                        controller: _otp,
                                        keyboardType: TextInputType.number,
                                        highlight: true,
                                        highlightAnimation: true,
                                        pinBoxRadius: 10.0,
                                        onDone: (text) {
                                          userOtp = int.parse(_otp.text);
                                          final body = {
                                            "user_id": userId.toString(),
                                            // "user_id": json.encode(194),
                                            "otp": userOtp.toString(),
                                            // "otp": json.encode(2222),
                                          };
                                          _otpCheck(body);
                                        },
                                      )

                                      // child: PinFieldAutoFill(
                                      //   keyboardType: TextInputType.number,
                                      //   controller: _otp,
                                      //   codeLength: 4,
                                      //   autofocus: true,
                                      //   textInputAction: TextInputAction.send,
                                      // ),
                                      ),
                                  Container(
                                    height: 35,
                                    width: 80,
                                    child: IconButton(
                                      icon: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                          'Resend?',
                                          style: TextStyle(
                                            color: Color(0xFF004695),
                                            fontSize: 16,
                                            fontFamily: 'FivoSansMedium',
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                child: RaisedButton(
                                  onPressed: () {
                                    userOtp = int.parse(_otp.text);
                                    final body = {
                                      "user_id": userId.toString(),
                                      // "user_id": json.encode(194),
                                      "otp": userOtp.toString(),
                                      // "otp": json.encode(2222),
                                    };
                                    _otpCheck(body);
                                  },
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'FivoSansRegular',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _otpCheck(data) async {
    setState(() {
      showSnipper = true;
    });
    var res;
    var body;
    var resData;
    // try {
    //   res = await CallApi().postData(data, 'check_otp');
    //   body = json.decode(res.body);
    //   resData = body['data'];
    //   setState(() {
    //     showSnipper = false;
    //   });
    //   if (body['success'] == true) {
    //     int checkotpdata = body['data']['otp'];
    //     if (checkotpdata == userOtp) {
    //       SharedPreferences localStorage =
    //           await SharedPreferences.getInstance();
    //       localStorage.setString('token', resData['token']);
    //       localStorage.setString('user', json.encode(resData));
    //       var abc = localStorage.getString('token');
    //       localStorage.remove('signUp');
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => OnBoarding(),
    //           ));
    //     } else {
    //       showDialog(
    //         builder: (context) => AlertDialog(
    //           title: Text('Otp Error'),
    //           content: Text(resData.toString()),
    //           actions: <Widget>[
    //             FlatButton(
    //               onPressed: () {
    //                 Navigator.pop(context);
    //                 _otp.text = '';
    //               },
    //               child: Text('Try Again'),
    //             )
    //           ],
    //         ),
    //         context: context,
    //       );
    //     }
    //   } else {
    //     showDialog(
    //       builder: (context) => AlertDialog(
    //         title: Text('Otp Error'),
    //         content: Text(resData.toString()),
    //         actions: <Widget>[
    //           FlatButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //               _otp.text = '';
    //             },
    //             child: Text('Try Again'),
    //           )
    //         ],
    //       ),
    //       context: context,
    //     );
    //   }
    // } catch (e) {
    //   showDialog(
    //     builder: (context) => AlertDialog(
    //       title: Text('Value empty'),
    //       content: Text('${e.toString()}'),
    //       actions: <Widget>[
    //         FlatButton(
    //           onPressed: () {
    //             setState(() {
    //               showSnipper = false;
    //             });
    //             Navigator.pop(context);
    //             _otp.text = '';
    //           },
    //           child: Text('Try Again'),
    //         )
    //       ],
    //     ),
    //     context: context,
    //   );
    // }
    showSnipper = false;
  }
}
