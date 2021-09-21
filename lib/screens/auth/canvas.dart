import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/routes.dart';
import 'package:gaadi/screens/auth/login.dart';
import 'package:gaadi/screens/auth/register.dart';
import 'package:gaadi/screens/home/homepage.dart';
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

  int currentIndex = 0;

  void changeIndex(index) {
    setState(() => currentIndex = index);
  }

  late List<Widget> _screens = [
    Login(changeIndex: changeIndex),
    Register(changeIndex: changeIndex),
    OTP(changeIndex: changeIndex),
  ];

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
//                         builder: (context) => Canvas(),
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

  void _Canvas(data) async {
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
//           res = await CallApi().postData(data, 'Canvas');
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
//                   title: Text('Canvas Error'),
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
//                 title: Text('Canvas Error'),
//                 content: Text(body['message'].toString()),
//                 actions: <Widget>[
//                   FlatButton(
//                     onPressed: () {
// //                Navigator.popAndPushNamed(context, Canvas.route);
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
//               title: Text('Canvas Error'),
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
//                         builder: (context) => Canvas(),
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
    List<Map<String, double>> _settings = [
      {
        "headHeight": 3,
        "containerHeight": 1.8,
      },
      {
        "containerHeight": 1.3,
      },
      {
        "headHeight": 2.0,
        "containerHeight": 1.8,
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
                              height: MediaQuery.of(context).size.height /
                                  _settings[currentIndex]["containerHeight"]!,
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
