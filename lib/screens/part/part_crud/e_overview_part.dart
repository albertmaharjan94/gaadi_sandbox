import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/screens/part/part_crud/components/e_part_single_header.dart';
import 'package:gaadi/screens/part/part_crud/components/e_part_single_specification.dart';
import 'package:gaadi/size_config.dart';

import '../../../constants.dart';
import 'components/e_part_single_header_contact.dart';

class EOverviewPart extends StatefulWidget {
  const EOverviewPart({Key? key}) : super(key: key);

  @override
  _EOverviewPartState createState() => _EOverviewPartState();
}

class _EOverviewPartState extends State<EOverviewPart> {
  List bannerList = [
    "assets/demo/cars/akdLight.jpg",
    "assets/demo/cars/dunlop.jpg"
  ];
  List<Widget>? _body;

  FocusNode titleNode = FocusNode();
  FocusNode modelNode = FocusNode();
  FocusNode nextNode = FocusNode();
  FocusNode descriptionNode = FocusNode();

  final _formKey = GlobalKey<FormState>();


  TextEditingController? titleController = new TextEditingController();
  TextEditingController? modelController = new TextEditingController();
  TextEditingController? descriptionController = new TextEditingController();

  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    _body = [
      // header
      Container(
        padding: EdgeInsets.only(bottom: 20),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            EPartSingleHeader(carousel: bannerList),
            SizedBox(height: getProportionateScreenHeight(20)),
            EPartSingleHeaderContact(
              descriptionController: descriptionController,
              modelController: modelController,
              titleController: titleController,
              modelNode: modelNode,
              nextNode: nextNode,
              titleNode: titleNode,
              descriptionNode: descriptionNode,
            ),
          ],
        ),
      ),
      SizedBox(height: getProportionateScreenHeight(20)),
      EPartSingleSpecification()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(

        bottomNavigationBar: BottomAppBar(
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
                    child: Text("Save", style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        print("FOrm COMPLETe");
                      }
                    },
                  ),
                ),
              ),
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
                    child: Text("Cancel", style: TextStyle(color: Colors.black),),
                    onPressed: () {

                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
        backgroundColor: Colors.grey.shade300,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                    "Add Vehicle",
                    style: TextStyle(color: Colors.black),
                  ),
                  pinned: true,
                  floating: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                ),
              ];
            },
            body: Container(child: ListView(children: _body!)),
          ),
        ),
      ),
    );
  }
}
