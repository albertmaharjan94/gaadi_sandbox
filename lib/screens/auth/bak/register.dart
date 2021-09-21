import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/auth/bak/login.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  static String routeName = "/register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  FocusNode username = FocusNode();
  FocusNode email = FocusNode();
  FocusNode phone = FocusNode();
  FocusNode password = FocusNode();
  var _countryCode;
  var showSnipper = false;
  var playerIddd;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
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
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, Login.routeName);
        return Future.value(false);
      },
      child: Form(
        key: _formKey,
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
                        height: MediaQuery.of(context).size.height / 2.8,
                        child: Image(
                          alignment: Alignment.center,
                          height: 90.0,
                          width: 252.0,
                          image: AssetImage('assets/icons/shinewashicon.png'),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  'Register',
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontSize: 20.0,
                                    fontFamily: 'Nadillas',
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  height:
                                      MediaQuery.of(context).size.height / 2.8,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: containerShadow,
                                                blurRadius: 2,
                                                offset: Offset(0, 0),
                                                spreadRadius: 1,
                                              )
                                            ]),
                                        child: TextFormField(
                                          controller: _usernameController,
                                          validator: (value) {
                                            if (value == "") {
                                              return 'please enter username';
                                            }
                                            return null;
                                          },
                                          focusNode: username,
                                          onFieldSubmitted: (a) {
                                            username.unfocus();
                                            FocusScope.of(context)
                                                .requestFocus(email);
                                          },
                                          enableSuggestions: false,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(15),
                                            border: InputBorder.none,
                                            suffixIcon: SvgPicture.asset(
                                              'assets/icons/usericon.svg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                            hintText: 'User Name',
                                            hintStyle: TextStyle(
                                              color: darkBlue,
                                              fontSize: 16,
                                              fontFamily: 'FivoSansMedium',
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
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: containerShadow,
                                                blurRadius: 2,
                                                offset: Offset(0, 0),
                                                spreadRadius: 1,
                                              )
                                            ]),
                                        child: TextFormField(
                                          controller: _emailController,
                                          validator: (value) {
                                            Pattern pattern =
                                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                            RegExp regex =
                                                new RegExp(pattern.toString());
                                            // Null check
                                            if (value == "") {
                                              return 'please enter your email';
                                            }
                                            // Valid email formatting check
                                            else if (!regex.hasMatch(value!)) {
                                              return 'Enter valid email address';
                                            }
                                            // success condition
                                            return null;
                                          },
                                          focusNode: email,
                                          onFieldSubmitted: (a) {
                                            email.unfocus();
                                            FocusScope.of(context)
                                                .requestFocus(phone);
                                          },
                                          enableSuggestions: false,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(15),
                                            border: InputBorder.none,
                                            suffixIcon: SvgPicture.asset(
                                              'assets/icons/emailicon.svg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                            hintText: 'E-mail Address',
                                            hintStyle: TextStyle(
                                              color: darkBlue,
                                              fontSize: 16,
                                              fontFamily: 'FivoSansMedium',
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
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: containerShadow,
                                                blurRadius: 2,
                                                offset: Offset(0, 0),
                                                spreadRadius: 1,
                                              )
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.0),
                                              child: CountryCodePicker(
                                                initialSelection: 'NP',
                                                onInit: (country) {
                                                  _countryCode =
                                                      country.dialCode;
                                                },
                                                onChanged: (countrycode) {
                                                  _countryCode =
                                                      countrycode.toString();
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 1.5,
                                              height: 35.0,
                                              color: containerShadow,
                                            ),
                                            Container(
                                              width: 180,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.phone,
                                                controller: _phoneController,
                                                validator: (value) {
                                                  String patttern =
                                                      r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                                  RegExp regExp = new RegExp(
                                                      patttern.toString());
                                                  if (value == "") {
                                                    return 'Mobile number is required';
                                                  }
                                                  if (value!.length > 10) {
                                                    return 'Please enter mobile number';
                                                  } else if (!regExp
                                                      .hasMatch(value)) {
                                                    return 'Please enter valid mobile number';
                                                  }
                                                  return null;
                                                },
                                                focusNode: phone,
                                                onFieldSubmitted: (a) {
                                                  phone.unfocus();
                                                  FocusScope.of(context)
                                                      .requestFocus(password);
                                                },
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(15),
                                                  border: InputBorder.none,
                                                  hintText: 'Mobile Number',
                                                  counterText: '',
                                                  hintStyle: TextStyle(
                                                    color: darkBlue,
                                                    fontSize: 16,
                                                    fontFamily:
                                                        'FivoSansMedium',
                                                  ),
                                                ),
                                                maxLength: 10,
                                                style: TextStyle(
                                                  color: darkBlue,
                                                  fontSize: 16,
                                                  fontFamily: 'FivoSansMedium',
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15.0),
                                              child: Icon(
                                                Icons.phone,
                                                color: darkBlue,
                                                size: 22,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: containerShadow,
                                                blurRadius: 2,
                                                offset: Offset(0, 0),
                                                spreadRadius: 1,
                                              )
                                            ]),
                                        child: TextFormField(
                                          controller: _passwordController,
                                          obscureText: true,
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
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(15),
                                            border: InputBorder.none,
                                            suffixIcon: SvgPicture.asset(
                                              'assets/icons/lockicon.svg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                            hintText: 'Password',
                                            hintStyle: TextStyle(
                                              color: darkBlue,
                                              fontSize: 16,
                                              fontFamily: 'FivoSansMedium',
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
                                      width: MediaQuery.of(context).size.width,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                      ),
                                      child: RaisedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            final body = {
                                              "name": _usernameController.text,
                                              "email": _emailController.text,
                                              "password":
                                                  _passwordController.text,
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
                                        color: Theme.of(context).primaryColor,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              Navigator.pushNamed(
                                                  context, Login.routeName);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
      ),
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
    //   res = await CallApi().postData(data, 'register');
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
