import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/api/repositories/user_repository.dart';
import 'package:gaadi/api/responses/auth_response.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/auth/register.dart';
import 'package:gaadi/screens/home/homepage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class OTP extends StatefulWidget {
  final Function changeIndex;
  final Function changeSpinner;

  static int routeIndex = 2;

  const OTP({Key? key, required this.changeIndex, required this.changeSpinner}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final _otp = TextEditingController();
  var showSnipper = false;
  var _check = '';
  late int userId;
  late int userOtp;
  User? _pendingUser;

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
    checkUser();
    return WillPopScope(
      onWillPop: () {
        widget.changeIndex(Login.routeIndex);
        return Future.value(false);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  'Please enter OTP number',
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
                    errorBorderColor: Colors.red,
                    pinBoxWidth: 42,
                    pinTextStyle: TextStyle(
                      fontSize: 24,
                    ),
                    pinBoxHeight: 42,
                    maxLength: 6,
                    controller: _otp,
                    keyboardType: TextInputType.number,
                    highlight: true,
                    highlightAnimation: true,
                    pinBoxRadius: 10.0,
                    onDone: (text) {
                      try {
                        userOtp = int.parse(_otp.text);
                        _sendOTP(userOtp.toString());
                      } catch (e) {
                        final snackBar = SnackBar(content: Text('OTP is required.'), backgroundColor: darkBlue);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
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
                width: 150,
                child: FlatButton(
                  onPressed: () {
                    widget.changeIndex(Login.routeIndex);
                  },
                  child: Text(
                    'Back to Login',
                    style: TextStyle(
                      color: extraDarkBlue,
                      fontFamily: 'FivoSansRegular',
                      fontSize: 15,
                    ),
                  ),
                ),
                // child: IconButton(
                //   icon: FittedBox(
                //     fit: BoxFit.contain,
                //     child: Text(
                //       'Go back to login',
                //       style: TextStyle(
                //         color: Color(0xFF004695),
                //         fontSize: 16,
                //         fontFamily: 'FivoSansMedium',
                //       ),
                //     ),
                //   ),
                //
                // ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
            ),
            child: RaisedButton(
              onPressed: () {
                try {
                  userOtp = int.parse(_otp.text);
                  if(_otp.text.length <6){
                    final snackBar = SnackBar(content: Text('Please insert a valid pin.'), backgroundColor: darkBlue);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                  _sendOTP(userOtp.toString());
                } catch (e) {
                  final snackBar = SnackBar(content: Text('OTP is required.'), backgroundColor: darkBlue);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
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
    );
  }

  Future<bool> checkUser() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    try {
      Map<String, dynamic> userMap =
          jsonDecode(sharedPref.getString('PendingUser'));
      _pendingUser = User.fromJson(userMap);
      print("Pending User " + _pendingUser!.toJson().toString());
      return true;
    } catch (e) {
      return false;
    }
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

  void _sendOTP(String otpCode) async {
    widget.changeSpinner(true);
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String pendingUser = sharedPref.getString('PendingUser');
    if(pendingUser == null){
      widget.changeSpinner(false);
      Alert(
        context: context,
        style: authAlertStyle,
        type: AlertType.info,
        title: "Invalid OTP",
        desc: "Please register your email inorder to get OTP.",
        buttons: [
          DialogButton(
            child: Text(
              "Register",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: (){
              widget.changeIndex(Register.routeIndex);
              Navigator.pop(context);
            },
            color: Colors.greenAccent.shade700,
            radius: BorderRadius.circular(10.0),
          ),
          DialogButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(91, 55, 185, 1.0),
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
    }else{
      try{

        UserRepository repo =  UserRepository();

        Map<String, dynamic> _user = jsonDecode(pendingUser);
        _pendingUser!.otp = otpCode;

        AuthResponse res = await repo.verifyOTP(jsonEncode(_pendingUser));
        print("SCREEN DATA :: "+ res.authToken.toString());
        if(res.success == true){
          sharedPref.remove("Register");
          sharedPref.setString("token", res.authToken);
          print(res.user!.toJson().toString());

          sharedPref.setString("token", res.authToken);
          res.user!.token = res.authToken;
          res.user!.password = _pendingUser!.password;
          res.user!.contact = _pendingUser!.contact;
          sharedPref.setString("LoggedInUser", jsonEncode(res.user));

          sharedPref.remove("PendingUser");
          widget.changeSpinner(false);
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        }else{
          widget.changeSpinner(false);
          Alert(
            context: context,
            style: authAlertStyle,
            type: AlertType.error,
            title: "OTP Error",
            desc: res.message,
            buttons: [
              DialogButton(
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                color: Colors.greenAccent.shade700,
                radius: BorderRadius.circular(10.0),
              )
            ],
          ).show();
        }

      }catch(e){
        print(e);
        widget.changeSpinner(false);
        Alert(
          context: context,
          style: authAlertStyle,
          type: AlertType.error,
          title: "Server Error",
          desc: "Please try again.",
          buttons: [
            DialogButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: (){
                Navigator.pop(context);
              },
              color: Colors.greenAccent.shade700,
              radius: BorderRadius.circular(10.0),
            )
          ],
        ).show();
      }
      widget.changeSpinner(false);
      // Alert(
      //   context: context,
      //   style: authAlertStyle,
      //   type: AlertType.info,
      //   title: "Invalid OTP",
      //   desc: "Please register your email inorder to get OTP.",
      //   buttons: [
      //     DialogButton(
      //       child: Text(
      //         "Register",
      //         style: TextStyle(color: Colors.white, fontSize: 20),
      //       ),
      //       onPressed: (){
      //         widget.changeIndex(Register.routeIndex);
      //         Navigator.pop(context);
      //       },
      //       color: Colors.greenAccent.shade700,
      //       radius: BorderRadius.circular(10.0),
      //     ),
      //     DialogButton(
      //       child: Text(
      //         "Cancel",
      //         style: TextStyle(color: Colors.white, fontSize: 20),
      //       ),
      //       onPressed: () => Navigator.pop(context),
      //       color: Color.fromRGBO(91, 55, 185, 1.0),
      //       radius: BorderRadius.circular(10.0),
      //     ),
      //   ],
      // ).show();
    }


  }
}
