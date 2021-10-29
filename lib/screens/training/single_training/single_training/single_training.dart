import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/training/single_training/single_training/components/single_training_body.dart';
import 'package:gaadi/screens/training/single_training/single_training/components/single_training_map.dart';
import 'package:gaadi/screens/training/single_training/single_training/components/single_training_similar.dart';
import 'package:gaadi/size_config.dart';
import 'package:gaadi/services/phone_call.dart';

import 'components/single_training_title.dart';

class SingleTraining extends StatefulWidget {
  SingleTraining({Key? key, required this.title}) : super(key: key);
  String? title;

  @override
  _SingleTrainingState createState() => _SingleTrainingState();
}

class _SingleTrainingState extends State<SingleTraining> {
  ScrollController _scrollController = new ScrollController();
  List<Widget> _body = [
    SingleTrainingTitle(),
    SizedBox(height: getProportionateScreenHeight(20),),
    SingleTrainingBody(),
    SizedBox(height: getProportionateScreenHeight(20),),

    SingleTrainingMap(),
    SizedBox(height: getProportionateScreenHeight(20),),
    SingleTrainingSimilar(),
    SizedBox(height: getProportionateScreenHeight(20),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: new BottomAppBar(
        elevation: 10,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.transparent
          ),
          child: Row(children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: kPrimaryColor)))),
                child: Text("Contact", style: TextStyle(color: Colors.white),),
                onPressed: () {
                  PhoneCall.makePhoneCall("tel://${9860311104}");
                },
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(color: kPrimaryColor)))),
                  child: Text("Save", style: TextStyle(color: kPrimaryColor),),
                  onPressed: ()  {
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: NestedScrollView(
            controller: _scrollController,
            // floatHeaderSlivers: true,
            dragStartBehavior: DragStartBehavior.start,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: Text(
                    widget.title!,
                    style: TextStyle(color: Colors.black),
                  ),
                  pinned: true,
                  floating: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                ),
              ];
            },
            body: ListView(
              children: _body,
            )),
      ),
    );
  }
}
