import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const darkBlue = Color(0xFF265E9E);
const containerShadow = Color(0xFF91B4D8);
const extraDarkBlue = Color(0xFF91B4D8);



const Color WHITE = Colors.white;
const Color BLACK = Colors.black;
Color THEME_COLOR = Colors.deepOrange.shade100;
Color DEEP_ORANGE_COLOR = Colors.deepOrange;
Color LIGHT_GREY = Colors.grey.shade200;
Color GREY = Colors.grey.shade600;

var authAlertStyle = AlertStyle(
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50.0),
    side: BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: TextStyle(
    color: Color.fromRGBO(91, 55, 185, 1.0),
  ),
);