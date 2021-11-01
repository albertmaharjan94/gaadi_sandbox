import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/api/models/part.dart';
import 'package:gaadi/screens/part/part_crud/components/e_part_single_header.dart';
import 'package:gaadi/screens/part/part_crud/components/e_part_single_specification.dart';
import 'package:gaadi/size_config.dart';
import 'package:provider/provider.dart';

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
  TextEditingController? priceController = new TextEditingController();
  List<String> imageList = [];
  List<Map<String, String>> specsData = [];
  ScrollController _scrollController = new ScrollController();

  updateImage(images){
    setState(() {
      imageList = images;
    });
  }
  updateSpecs(specs){
    setState(() {
      specsData = specs;
    });
  }
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
            EPartSingleHeader(
              setImageList: updateImage,),
            SizedBox(height: getProportionateScreenHeight(20)),
            EPartSingleHeaderContact(
              descriptionController: descriptionController,
              modelController: modelController,
              titleController: titleController,
              priceController: priceController,
              modelNode: modelNode,
              nextNode: nextNode,
              titleNode: titleNode,
              descriptionNode: descriptionNode,
            ),
          ],
        ),
      ),
      SizedBox(height: getProportionateScreenHeight(20)),
      EPartSingleSpecification(updateSpecification: updateSpecs),
      SizedBox(height: getProportionateScreenHeight(20)),
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
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 5),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: kPrimaryColor)))),
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Part _part = new Part(
                          model: modelController!.text.toString(),
                          title: titleController!.text.toString(),
                          price: priceController!.text.toString(),
                          specifications: specsData.map((e) => SpecificationModel(key: e[0], value: e[1])).toList(),

                        );
                        print(_part.toJson());
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
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: kPrimaryColor)))),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},
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
