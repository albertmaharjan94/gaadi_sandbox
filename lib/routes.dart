import 'package:flutter/widgets.dart';
import 'package:gaadi/app.dart';
import 'package:gaadi/onboarding.dart';
import 'package:gaadi/screens/auth/bak/login.dart';
import 'package:gaadi/screens/auth/bak/otp.dart';
import 'package:gaadi/screens/auth/bak/register.dart';
import 'package:gaadi/screens/home/dashboard/Child.dart';
import 'package:gaadi/screens/home/homepage.dart';
import 'package:gaadi/screens/auth/canvas.dart';
import 'package:gaadi/screens/single_product/review/write_review.dart';
import 'package:gaadi/screens/single_product/single_product.dart';

// named routes

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  SingleProduct.routeName: (context) => SingleProduct(),

  // entrey screen / choose between login and register
  SplashScreen.routeName: (context) => SplashScreen(),
  OnBoarding.routeName: (context) => OnBoarding(),
  Login.routeName: (context) => Login(),
  Register.routeName: (context) => Register(),
  OTP.routeName: (context) => OTP(),
  Canvas.routeName: (context) => Canvas(),


  Child.routeName: (context) => Child(),
  WriteReview.routeName: (context) => WriteReview(),
};
