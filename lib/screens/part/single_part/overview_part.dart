import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/api/api.dart';
import 'package:gaadi/api/models/part.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/api/repositories/part_repository.dart';
import 'package:gaadi/api/responses/part_response.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/home/homepage.dart';
import 'package:gaadi/screens/part/part_view_model.dart';
import 'package:gaadi/screens/part/single_part/components/part_single_specification.dart';
import 'package:gaadi/screens/single_car/components/similar_product.dart';
import 'package:gaadi/widgets/bottom_contact_bar.dart';
import 'package:gaadi/widgets/feature.dart';
import 'package:gaadi/widgets/single_feature.dart';
import 'package:gaadi/widgets/single_review.dart';
import 'package:gaadi/size_config.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/part_single_header.dart';
import 'components/part_single_header_contact.dart';

class OverviewPart extends StatefulWidget {
  OverviewPart({Key? key, required this.id}) : super(key: key);
  String? id;

  @override
  _OverviewPartState createState() => _OverviewPartState();
}

class _OverviewPartState extends State<OverviewPart>  with SingleTickerProviderStateMixin{
  List bannerList = [];
  List<Widget>? _body;

  List<Widget> _features = [
    Feature(image: "assets/demo/cars/dunlop.jpg", text: "Grip"),
    Feature(image: "assets/demo/cars/bridgestone.jpg", text: "Circular"),
    Feature(image: "assets/demo/cars/dunlop.jpg", text: "Grip"),
    Feature(image: "assets/demo/cars/bridgestone.jpg", text: "Circular"),
  ];
  var _scrollController, _tabController;
  Part _part = new Part();

  SharedPreferences? sharedPreferences;
  User? _loggedInUser;

  @override
  initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 4);
    super.initState();

    getLoggedIn();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<PartViewModel>(context, listen: false).getOnePart(widget.id);
    });
  }
  getLoggedIn() async {
    sharedPreferences = await SharedPreferences.getInstance().then((value) {
      setState(() {
        _loggedInUser = User.fromJson(jsonDecode(value.getString("LoggedInUser")));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _part = Provider.of<PartViewModel>(context, listen: true).part;
      bannerList = _part.image == null ? []  : _part.image!.map((e) => imageDomain+ "/" + e).toList();
      print("INSIDE: "+bannerList.toString());
      print(_part.contact);
    });
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: _loggedInUser != _part.user ? ButtomContactBar(tel: _part.user == null || _part.user?.contact == null ? "0909" : _part.user!.contact.toString()) : Container(),
      body: SafeArea(
        child: NestedScrollView(
            controller: _scrollController,
            // floatHeaderSlivers: true,
            dragStartBehavior: DragStartBehavior.start,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actionsIconTheme: IconThemeData(color: Colors.black54),
                  actions: <Widget>[
                    if(_loggedInUser != null && _part.userId == _loggedInUser!.id) IconButton(
                        icon: Icon(Icons.delete_outline), onPressed: () {
                      Alert(
                        context: context,
                        style: commonAlertStyle,
                        type: AlertType.error,
                        title: "Delete",
                        desc: "Do you really want to delete this part?",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () async {
                              try{
                                PartDeleteResponse response = await PartRepository().deletePart(widget.id);
                                if(response.success == true){
                                  Navigator.pop(context);
                                  Alert(
                                    context: context,
                                    style: commonAlertStyle,
                                    type: AlertType.error,
                                    title: "Delete Sucessful",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Close",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        color: Colors.redAccent.shade700,
                                        radius: BorderRadius.circular(10.0),
                                      ),
                                    ],
                                  ).show();
                                }else{

                                }
                              }catch(e){
                                print(e);
                              }
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            color: Colors.redAccent.shade700,
                            radius: BorderRadius.circular(10.0),
                          ),
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
                    }),
                    IconButton(
                        icon: Icon(Icons.home), onPressed: () {
                      goHome(context, HomePage());
                    }),
                  ],
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: Text(
                    _part.title.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  pinned: true,
                  floating: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                ),
              ];
            },
            body: Container(
              child: ListView(children: [
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
                      PartSingleHeader(carousel: bannerList),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      PartSingleHeaderContact(title: _part.title, price: _part.price.toString(), model: _part.model, seller: _part.user,),
                    ],
                  ),
                ),

                // // review
                SizedBox(height: getProportionateScreenHeight(20)),
                PartSingleSpecification(
                  specsData: _part.specification == null ? [] : _part.specification!,
                ),
                //
                // // features
                // SizedBox(height: getProportionateScreenHeight(20)),
                // SingleReview(),

                // similar products
                SizedBox(height: getProportionateScreenHeight(20)),
                Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        SimilarProduct(),
                      ],
                    )),
                SizedBox(height: getProportionateScreenHeight(20)),
              ]),
            )),
      ),
    );
  }


}
