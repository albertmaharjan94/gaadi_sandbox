import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/routes.dart';
import 'package:gaadi/screens/auth/bak/otp.dart';
import 'package:gaadi/screens/auth/bak/register.dart';
import 'package:gaadi/screens/home/homepage.dart';
import 'package:gaadi/widgets/roundedInput.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;

  FocusNode phone = FocusNode();
  FocusNode password = FocusNode();
  var showSnipper = false;
  var playerIddd;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // getDeviceToken();
  }

//   Future<bool> check() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       return true;
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       return true;
//     }
//     return false;
//   }

//   getDeviceToken() async {
//     check().then((intenet) async {
//       if (intenet != null && intenet) {
//         // Internet Present Case
//         OneSignal.shared
//             .setInFocusDisplayType(OSNotificationDisplayType.notification);

//         await OneSignal.shared
//             .promptUserForPushNotificationPermission(fallbackToSettings: true);

//         var status = await OneSignal.shared.getPermissionSubscriptionState();

//         var playerId = status.subscriptionStatus.userId;
//         playerIddd = playerId;
//         print('device token is $playerIddd');
//         SharedPreferences localStorage = await SharedPreferences.getInstance();
//         localStorage.setString('device_token', playerId);
//       } else {
//         showDialog(
//           builder: (context) => AlertDialog(
//             title: Text('Internet connection'),
//             content: Text('Check your internet connection'),
//             actions: <Widget>[
//               FlatButton(
//                 onPressed: () async {
//                   Navigator.pop(context);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Login(),
//                       ));
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//           context: context,
//         );
//       }
//     });
//   }

  void _login(data) async {
//     check().then((intenet) async {
//       if (intenet != null && intenet) {
//         setState(() {
//           showSnipper = true;
//         });
//         SharedPreferences localStorage = await SharedPreferences.getInstance();
//         var isFrom = localStorage.getString('isFrom');
//         var navigate;
//         navigate = HomePage.routeName;
//         var deviceToken = playerIddd;
//         var checkDeviceToken = localStorage.getBool('deviceToken');
//         if (checkDeviceToken == true) {
//           data['device_token'] = deviceToken;
//         }
//         var res;
//         var body;
//         var resData;
//         var userId;
//         try {
//           res = await CallApi().postData(data, 'login');
//           body = json.decode(res.body);
//           resData = body['data'];
//           if (body['success'] == true) {
//             if (body['data']['is_verified'] == 1) {
//               _phoneController.text = '';
//               _passwordController.text = '';
//               SharedPreferences localStorage =
//                   await SharedPreferences.getInstance();
//               localStorage.setString('token', resData['token']);
//               localStorage.setString('user', json.encode(resData));
//               var abc = localStorage.getString('token');
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => navigate,
//                   ));
//             } else {
//               showDialog(
//                 builder: (context) => AlertDialog(
//                   title: Text('Login Error'),
//                   content: Text('Please verify your account'),
//                   actions: <Widget>[
//                     FlatButton(
//                       onPressed: () async {
//                         _phoneController.text = '';
//                         _passwordController.text = '';
//                         SharedPreferences localStorage =
//                             await SharedPreferences.getInstance();
//                         localStorage.setString('token', resData['token']);
//                         localStorage.setString('user', json.encode(resData));
//                         var abc = localStorage.getString('token');
//                         userId = body['data']['id'];
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => OTP(
//                                 userIdOfOtp: userId,
//                               ),
//                             ));
//                       },
//                       child: Text('OK'),
//                     )
//                   ],
//                 ),
//                 context: context,
//               );
//             }
//           } else {
//             print(body['message']);
//             showDialog(
//               builder: (context) => AlertDialog(
//                 title: Text('Login Error'),
//                 content: Text(body['message'].toString()),
//                 actions: <Widget>[
//                   FlatButton(
//                     onPressed: () {
// //                Navigator.popAndPushNamed(context, Login.route);
//                       Navigator.pop(context);
//                     },
//                     child: Text('Try Again'),
//                   )
//                 ],
//               ),
//               context: context,
//             );
//           }
//         } catch (e) {
//           showDialog(
//             builder: (context) => AlertDialog(
//               title: Text('Login Error'),
//               content: Text(e.toString()),
//               actions: <Widget>[
//                 FlatButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('Try Again'),
//                 )
//               ],
//             ),
//             context: context,
//           );
//         }
//         setState(() {
//           showSnipper = false;
//         });
//       } else {
//         showDialog(
//           builder: (context) => AlertDialog(
//             title: Text('Internet connection'),
//             content: Text('Check your internet connection'),
//             actions: <Widget>[
//               FlatButton(
//                 onPressed: () async {
//                   Navigator.pop(context);
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Login(),
//                       ));
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//           context: context,
//         );
//       }
//     });
    // Navigator.pop(context);

    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                              topLeft: Radius.circular(35.0),
                              topRight: Radius.circular(35.0)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Login',
                                style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 20.0,
                                  fontFamily: 'Nadillas',
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: TextFormField(
                                        controller: _phoneController,
                                        focusNode: phone,
                                        onFieldSubmitted: (a) {
                                          phone.unfocus();
                                          FocusScope.of(context)
                                              .requestFocus(password);
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
                                            color: darkBlue,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          labelText: "Phone",
                                          hintText: "Enter phone",
                                          fillColor: Colors.white,
                                          errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                            borderSide: BorderSide(
                                              color: extraDarkBlue,
                                              width: 2.0,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(35.0),
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
                                        },
                                        obscureText: !_passwordVisible,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: darkBlue,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: darkBlue,
                                            ),
                                            onPressed: () {
                                              // Update the state i.e. toogle the state of passwordVisible variable
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          labelText: "Password",
                                          hintText: "Enter password",
                                          fillColor: Colors.white,
                                          errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                            borderSide: BorderSide(
                                              color: extraDarkBlue,
                                              width: 2.0,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(35.0),
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
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, OTP.routeName);
                                        },
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: extraDarkBlue,
                                            fontFamily: 'FivoSansRegular',
                                            fontSize: 15,
                                          ),
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
                                        if (_formKey.currentState!.validate()) {
                                          final body = {
                                            "phone": _phoneController.text,
                                            "password":
                                                _passwordController.text,
                                            "provider": "LOCAL",
                                          };
                                          _login(body);
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
                                        'Login',
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
                                          'If you are new user?',
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
                                              'Register',
                                              style: TextStyle(
                                                color: Color(0xFF004695),
                                                fontSize: 25,
                                                fontFamily: 'FivoSansMedium',
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                                context, Register.routeName);
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
    );
  }
}
