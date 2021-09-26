import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/api/repositories/user_repository.dart';
import 'package:gaadi/api/responses/auth_response.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/auth/login.dart';
import 'package:gaadi/screens/auth/otp.dart';
import 'package:gaadi/size_config.dart';
import 'package:gaadi/view_models/user_view_model.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  final Function changeIndex;
  final Function changeSpinner;

  static int routeIndex = 1;

  const Register({Key? key, required this.changeIndex, required this.changeSpinner}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  FocusNode firstname = FocusNode();
  FocusNode lastname = FocusNode();
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
              child: Center(
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
                        height: getProportionateScreenHeight(500),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: TextFormField(
                                controller: _firstNameController,
                                focusNode: firstname,
                                onFieldSubmitted: (a) {
                                  firstname.unfocus();
                                  FocusScope.of(context).requestFocus(lastname);
                                },
                                onChanged: (value) {},
                                validator: (value) {
                                  // Null check
                                  if (value == "") {
                                    return 'Please enter your first name';
                                  }
                                  // success condition
                                  return null;
                                },
                                enableSuggestions: false,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.supervised_user_circle_outlined,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "First name",
                                  hintText: "Enter first name",
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
                                controller: _lastNameController,
                                focusNode: lastname,
                                onFieldSubmitted: (a) {
                                  lastname.unfocus();
                                  FocusScope.of(context).requestFocus(phone);
                                },
                                onChanged: (value) {},
                                validator: (value) {
                                  // Null check
                                  if (value == "") {
                                    return 'Please enter your last name';
                                  }
                                  // success condition
                                  return null;
                                },
                                enableSuggestions: false,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.supervised_user_circle_sharp,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  labelText: "Last name",
                                  hintText: "Enter last name",
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
                                  contentPadding: EdgeInsets.symmetric(
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
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
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
                              child: TextFormField(
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
                                  FocusScope.of(context)
                                      .requestFocus(passwordC);
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
                                  contentPadding: EdgeInsets.symmetric(
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
                              child: TextFormField(
                                controller: _confirmPasswordController,
                                validator: (value) {
                                  if (value == "") {
                                    return "Please Enter Password";
                                  } else if (value!.length < 6) {
                                    return "Password must be atleast 6 characters long";
                                  } else if (_passwordController.text != "" &&
                                      value != _passwordController.text) {
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
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
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
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
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
    widget.changeSpinner(true);
    if(await check() ==false){
      widget.changeSpinner(false);
      showDialog(
        builder: (context) => AlertDialog(
          title: Text('No Internet Connection'),
          content: Text('Seems like you don\'t have internet connection.\nPlease check the internet connection and try again.'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {

              },
              child: Text('OK'),
            )
          ],
        ),
        context: context,
      );
    }
    var userId;
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    try{
      User user = User(email: data["email"], contact: data["phone"], password: data["password"]);
      UserRepository repo =  UserRepository();
      AuthResponse otp = await repo.sendOTP(jsonEncode(user.toJson()));

      widget.changeSpinner(false);
      if (otp.success==true) {
        user.hash = otp.hash;
        localStorage.setString('Register', '1');
        localStorage.setString("PendingUser", jsonEncode(user.toJson()));


        Alert(
          context: context,
          style: authAlertStyle,
          type: AlertType.success,
          title: "Registration Success",
          desc: "You will be redirected to OTP page.",
          buttons: [
            DialogButton(
              child: Text(
                "Okay",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: (){
                widget.changeIndex(OTP.routeIndex);
                Navigator.pop(context);
              },
              color: Colors.greenAccent.shade700,
              radius: BorderRadius.circular(10.0),
            ),
          ],
        ).show();
      }else{

        Alert(
          context: context,
          style: authAlertStyle,
          type: AlertType.success,
          title: "Registration Fail",
          desc: "Please try again.",
          buttons: [
            DialogButton(
              child: Text(
                "Okay",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: (){
                Navigator.pop(context);
              },
              color: Colors.orangeAccent.shade700,
              radius: BorderRadius.circular(10.0),
            ),
          ],
        ).show();

      }
    }catch(e){
      print(e.toString());
      Alert(
        context: context,
        style: authAlertStyle,
        type: AlertType.error,
        title: "Cannot connect to the server",
        desc: "Please try again.",
        buttons: [
          DialogButton(
            child: Text(
              "Okay",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: (){
              Navigator.pop(context);
            },
            color: Colors.orangeAccent.shade700,
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
      widget.changeSpinner(false);
    }

    widget.changeSpinner(false);
    return userId;
  }
}
