import 'package:flutter/material.dart';
import 'package:gaadi/api/models/vehicle.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/size_config.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

import 'components/single_specification_page.dart';

class Specification extends StatefulWidget {
  Specification({Key? key, required this.vehicle}) : super(key: key);
  Vehicle vehicle = new Vehicle();
  @override
  _SpecificationState createState() => _SpecificationState();
}

class _SpecificationState extends State<Specification> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.vehicle.specification);
    return Container(
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0), topLeft: Radius.circular(16.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 10, left: 20),
              child: Text(
                "Specifications",
                style: TextStyle(fontSize: 20),
              )),
          if(widget.vehicle.specification != null)
          Container(
            height: getProportionateScreenHeight(350),
            child: VerticalTabs(
              tabBackgroundColor: Colors.white,
              backgroundColor: Colors.white,
              indicatorColor: kPrimaryColor,
              selectedTabBackgroundColor: kPrimaryColor.withOpacity(0.2),
              contentScrollAxis: Axis.horizontal,
              tabsWidth: 150,
              tabs: <Tab>[

                for(var v in widget.vehicle.specification!)
                Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        v.title.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
              contents: <Widget>[
                for(var v in widget.vehicle.specification!)
                SingleSpecificationPage(
                  heading: v.title.toString(),
                  specs: v.key!
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
