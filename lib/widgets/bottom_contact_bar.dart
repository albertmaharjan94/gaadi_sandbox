import 'package:flutter/material.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/services/phone_call.dart';

class ButtomContactBar extends StatelessWidget {
  ButtomContactBar({Key? key, required this.tel, this.from, this.bookNow}) : super(key: key);
  String tel = "";
  User? to;
  User? from;
  Function? bookNow = ()=> print("Booknow");

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
            color: Colors.transparent
        ),
        child: Row(children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: kPrimaryColor)))),
                child: Text("Contact", style: TextStyle(color: Colors.white),),
                onPressed: () {
                  PhoneCall.makePhoneCall("tel://$tel");
                },
              ),
            ),
          ),
          if(from!=null)
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: kPrimaryColor)))),
                child: Text("Book Now", style: TextStyle(color: Colors.black),),
                onPressed: () {
                  if(bookNow != null){
                    bookNow!();
                  }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
