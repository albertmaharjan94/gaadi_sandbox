import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/auth/login.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  final Function changeIndex;

  static int routeIndex = 1;

  const Register({Key? key, required this.changeIndex}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  FocusNode email = FocusNode();
  FocusNode phone = FocusNode();
  FocusNode password = FocusNode();
  FocusNode passwordC = FocusNode();

  bool _passwordVisible = false;
  bool _passwordVisibleC = false;
  var _countryCode;
  var showSnipper = false;
  var playerIddd;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setDeviceToken();
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

  setDeviceToken() async {}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: WillPopScope(
          onWillPop: () {
            widget.changeIndex(Login.routeIndex);
            return Future.value(false);
          },
          child: Form(
              key: _formKey,
              child:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Register',
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 20.0,
                          fontFamily: 'Nadillas',
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 2.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: TextFormField(
                              controller: _phoneController,
                              focusNode: phone,
                              onFieldSubmitted: (a) {
                                phone.unfocus();
                                FocusScope.of(context).requestFocus(email);
                              },
                              onChanged: (value) {},
                              validator: (value) {
                                // Null check
                                if (value == "") {
                                  return 'Please enter your phone';
                                }
                                // success condition
                                return null;
                              },
                              enableSuggestions: false,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                labelText: "Phone",
                                hintText: "Enter phone",
                                fillColor: Colors.white,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: extraDarkBlue,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: darkBlue,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 16,
                                fontFamily: 'FivoSansMedium',
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              onFieldSubmitted: (a) {
                                phone.unfocus();
                                FocusScope.of(context).requestFocus(password);
                              },
                              onChanged: (value) {},
                              controller: _emailController,
                              validator: (value) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern.toString());
                                // Null check
                                if (value == "") {
                                  return 'Please enter your email';
                                }
                                // Valid email formatting check
                                else if (!regex.hasMatch(value!)) {
                                  return 'Enter valid email address';
                                }
                                // success condition
                                return null;
                              },
                              focusNode: email,
                              enableSuggestions: false,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                labelText: "Email",
                                hintText: "Enter email",
                                fillColor: Colors.white,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: extraDarkBlue,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: darkBlue,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 16,
                                fontFamily: 'FivoSansMedium',
                              ),
                            ),
                          ),

                          Container(
                            child:
                            TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value == "") {
                                  return "Please Enter Password";
                                } else if (value!.length < 6) {
                                  return "Password must be atleast 6 characters long";
                                } else {
                                  return null;
                                }
                              },
                              focusNode: password,
                              onFieldSubmitted: (a) {
                                password.unfocus();
                                FocusScope.of(context).requestFocus(passwordC);
                              },
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                labelText: "Password",
                                hintText: "Enter password",
                                fillColor: Colors.white,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: extraDarkBlue,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: darkBlue,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 16,
                                fontFamily: 'FivoSansMedium',
                              ),
                            ),
                          ),
                          Container(
                            child:
                            TextFormField(
                              controller: _confirmPasswordController,
                              validator: (value) {
                                if (value == "") {
                                  return "Please Enter Password";
                                } else if (value!.length < 6) {
                                  return "Password must be atleast 6 characters long";
                                } else if (_passwordController.text != "" && value != _passwordController.text) {
                                  return "Password did not match";
                                } else {
                                  return null;
                                }
                              },
                              focusNode: passwordC,
                              onFieldSubmitted: (a) {
                                passwordC.unfocus();
                              },
                              obscureText: !_passwordVisibleC,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_clock,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisibleC
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisibleC = !_passwordVisibleC;
                                    });
                                  },
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                labelText: "Confirm Password",
                                hintText: "Re-enter password",
                                fillColor: Colors.white,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: extraDarkBlue,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: darkBlue,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 16,
                                fontFamily: 'FivoSansMedium',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final body = {
                            "confirm": _confirmPasswordController.text,
                            "email": _emailController.text,
                            "password": _passwordController.text,
                            "phone": _phoneController.text,
                            "phone_code": _countryCode,
                          };
                          _registration(body);
                        }
                      },
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(35.0),
                        ),
                      ),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'FivoSansRegular',
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(
                              color: darkBlue,
                              fontSize: 18,
                              fontFamily: 'FivoSansRegular'),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 80,
                        child: IconButton(
                          icon: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Color(0xFF004695),
                                fontSize: 25,
                                fontFamily: 'FivoSansMedium',
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Navigator.pushNamed(context, Login.routeName);
                            widget.changeIndex(Login.routeIndex);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ]),
        ))),
    );
  }

  void _registration(data) async {
    setState(() {
      showSnipper = true;
    });
    // var res;
    // var body;
    // var resData;
    var userId;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('Register', '0');
    // var deviceToken = playerIddd;
    // var checkDeviceToken = localStorage.getBool('deviceToken');
    // if (checkDeviceToken == true) {
    //   data['device_token'] = deviceToken;
    // }
    // try {
    //   print(data);
    //   res = await CallApi().postData(data, 'Register');
    //   body = json.decode(res.body);
    //   print('function body is $body');
    //   resData = body['success'];
    //   userId = body['data']['id'];
    //   if (body['success'] == true) {
    //     if (body['data']['is_verified'] == 1) {
    //       SharedPreferences localstorage =
    //           await SharedPreferences.getInstance();
    //       localstorage.setString('token', body['data']['token']);
    //       localStorage.setString('user', json.encode(body['data']));
    //       showDialog(
    //         builder: (context) => AlertDialog(
    //           title: Text('Registration Success'),
    //           content: Text('congratulation'),
    //           actions: <Widget>[
    //             FlatButton(
    //               onPressed: () {
    //                 _usernameController.text = '';
    //                 _emailController.text = '';
    //                 _phoneController.text = '';
    //                 _passwordController.text = '';
    //                 Navigator.pop(context);
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => OnBoarding(),
    //                     ));
    //               },
    //               child: Text('OK'),
    //             )
    //           ],
    //         ),
    //         context: context,
    //       );
    //     } else {
    //       showDialog(
    //         builder: (context) => AlertDialog(
    //           title: Text('Verification Required'),
    //           content: Text('Please verify'),
    //           actions: <Widget>[
    //             FlatButton(
    //               onPressed: () {
    //                 // print('${body['data']['otp']}');
    //                 _usernameController.text = '';
    //                 _emailController.text = '';
    //                 _phoneController.text = '';
    //                 _passwordController.text = '';
    //                 Navigator.pop(context);
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => OTP(userIdOfOtp: userId),
    //                     ));
    //               },
    //               child: Text('OK'),
    //             )
    //           ],
    //         ),
    //         context: context,
    //       );
    //     }
    //   } else {
    //     showDialog(
    //       builder: (context) => AlertDialog(
    //         title: Text('Registration Error'),
    //         content: Text(body['errors'].toString()),
    //         actions: <Widget>[
    //           FlatButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //               setState(() {
    //                 showSnipper = false;
    //               });
    //             },
    //             child: Text('Try Again'),
    //           )
    //         ],
    //       ),
    //       context: context,
    //     );
    //   }
    // } catch (e) {
    //   print('$e');
    //   showDialog(
    //     builder: (context) => AlertDialog(
    //       title: Text('Registration Error'),
    //       content: Text(e.toString()),
    //       actions: <Widget>[
    //         FlatButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //             setState(() {
    //               showSnipper = false;
    //             });
    //           },
    //           child: Text('Try Again'),
    //         )
    //       ],
    //     ),
    //     context: context,
    //   );
    // }
    showSnipper = false;
    return userId;
  }
}

