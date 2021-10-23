import 'package:url_launcher/url_launcher.dart';

class PhoneCall {

  static void makePhoneCall(String url) {
    if (canLaunch(url) != null) {
      launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
