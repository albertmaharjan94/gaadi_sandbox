import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/api/models/part.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/api/repositories/part_repository.dart';
import 'package:gaadi/api/responses/part_response.dart';
import 'package:gaadi/screens/part/part_crud/components/e_part_map.dart';
import 'package:gaadi/widgets/grid_image_picker.dart';
import 'package:gaadi/screens/part/part_crud/components/e_part_single_specification.dart';
import 'package:gaadi/size_config.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

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
  FocusNode brandNode = FocusNode();
  FocusNode modelNode = FocusNode();
  FocusNode nextNode = FocusNode();
  FocusNode descriptionNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  TextEditingController? titleController = new TextEditingController();
  TextEditingController? brandController = new TextEditingController();
  TextEditingController? modelController = new TextEditingController();
  TextEditingController? descriptionController = new TextEditingController();
  TextEditingController? priceController = new TextEditingController();
  List<String> imageList = [];
  List<Map<String, String>> specsData = [];
  ScrollController _scrollController = new ScrollController();
  bool showSpinner = false;
  updateImage(images) {
    setState(() {
      imageList = images;
    });
  }

  updateSpecs(specs) {
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
            GridImagePicker(
              setImageList: updateImage,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            EPartSingleHeaderContact(
              descriptionController: descriptionController,
              modelController: modelController,
              brandController: brandController,
              titleController: titleController,
              priceController: priceController,
              modelNode: modelNode,
              brandNode: brandNode,
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
      EPartMap(),
      SizedBox(height: getProportionateScreenHeight(20)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      dismissible: false,
      inAsyncCall: showSpinner,
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Add Parts",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
            ),
            titleTextStyle: TextStyle(color: Colors.black54),
            toolbarTextStyle: TextStyle(color: Colors.black54),
            iconTheme: IconThemeData(color: Colors.black),
          ),
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
                      onPressed: () async {
                        updateSpinner(true);
                        if (_formKey.currentState!.validate()) {
                          SharedPreferences sharedPref =
                              await SharedPreferences.getInstance();
                          User _user = userFromJson(
                              sharedPref.getString("LoggedInUser"));
                          Part _part = new Part(
                              model: modelController!.text.toString(),
                              title: titleController!.text.toString(),
                              price: int.parse(priceController!.text.toString()),
                              image: imageList,
                              specification: specsData,
                              contact: [_user.contact == null ? "" : _user.contact!],
                              userId: _user.id,
                              user: _user);
                          PartRepository repo = PartRepository();
                          try {
                            PartAddResponse res =
                                await repo.addPartWithImages(_part, imageList);
                            updateSpinner(false);
                            if (res.success == true) {
                              Alert(
                                context: context,
                                style: commonAlertStyle,
                                type: AlertType.success,
                                title: "Parts Created",
                                desc: "You can see your listing in my listings",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Successfull",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);

                                    },
                                    color: Colors.greenAccent.shade700,
                                    radius: BorderRadius.circular(10.0),
                                  ),
                                ],
                              ).show();
                            } else {
                              Alert(
                                context: context,
                                style: commonAlertStyle,
                                type: AlertType.error,
                                title: "Sorry",
                                desc: "Parts could not be created",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Close",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // Navigator.pop(context);
                                    },
                                    color: Colors.redAccent.shade700,
                                    radius: BorderRadius.circular(10.0),
                                  ),
                                ],
                              ).show();
                            }
                          } catch (e) {
                            print(e);
                            updateSpinner(false);
                            Alert(
                              context: context,
                              style: commonAlertStyle,
                              type: AlertType.error,
                              title: "Sorry",
                              desc: "Could not connect to the server",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Close",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // Navigator.pop(context);
                                  },
                                  color: Colors.redAccent.shade700,
                                  radius: BorderRadius.circular(10.0),
                                ),
                              ],
                            ).show();
                          }
                          updateSpinner(false);
                        }
                        updateSpinner(false);
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
            child: SingleChildScrollView(
              controller: _scrollController,
              dragStartBehavior: DragStartBehavior.start,
              // headerSliverBuilder:
              //     (BuildContext context, bool innerBoxIsScrolled) {
              //   return <Widget>[
              //     SliverAppBar(
              //       iconTheme: IconThemeData(color: Colors.black),
              //       backgroundColor: Colors.white,
              //       title: Text(
              //         "Add Vehicle",
              //         style: TextStyle(color: Colors.black),
              //       ),
              //       pinned: true,
              //       floating: true,
              //       snap: false,
              //       forceElevated: innerBoxIsScrolled,
              //     ),
              //   ];
              // },
              child: Container(child: Column(children: _body!)),
            ),
          ),
        ),
      ),
    );
  }

  void updateSpinner(bool b) {
    setState(() {
      showSpinner = b;
    });
  }
}
