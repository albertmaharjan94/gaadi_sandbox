import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/auth/otp.dart';
import 'package:gaadi/screens/auth/register.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class Login extends StatefulWidget {
  final Function changeIndex;
  static int routeIndex = 0;
  const Login({Key? key, required this.changeIndex}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child:
      Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Spacer(),
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
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: TextFormField(
                  controller: _phoneController,
                  focusNode: phone,
                  onFieldSubmitted: (a) {
                    phone.unfocus();
                    FocusScope.of(context).requestFocus(password);
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
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    widget.changeIndex(OTP.routeIndex);
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
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final body = {
                      "phone": _phoneController.text,
                      "password": _passwordController.text,
                      "provider": "LOCAL",
                    };
                    // login here
                  }

                  Navigator.pushNamed(context, '/homepage');
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
                      print("clicked");
                      widget.changeIndex(Register.routeIndex);
                      // Navigator.pushReplacementNamed(
                      // context, Register.routeName);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}



// Expanded(
//       child: Container(
//         height: double.infinity,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
//           color: Colors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: 
//           
//       ),
//     );
