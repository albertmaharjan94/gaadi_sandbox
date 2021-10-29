import 'package:flutter/material.dart';
import 'package:gaadi/api/models/vehicle.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/size_config.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

import 'components/single_specification.dart';

class Specification extends StatefulWidget {
  const Specification({Key? key}) : super(key: key);

  @override
  _SpecificationState createState() => _SpecificationState();
}

class _SpecificationState extends State<Specification> {
  @override
  void initState() {
    super.initState();
    Vehicle v = new Vehicle(
        id: null,
        title: "COROLA",
        contact: "23456789o",
        features: [ FeatureModel(title: "LIT", image: "sdfghjk.jpg")],
        location: [4567.123, 123.123],
        make: "BMC",
        model: "123456789",
        specifications: [
          SpecificationModel(key: "Engine and Transmission",
              value: [SingleSpecificationModel(key: "Engine ty", value: "1.2l")])
        ],
        user: null
    );

    print(v.toJson());
  }

  @override
  Widget build(BuildContext context) {
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
          Container(
            height: getProportionateScreenHeight(450),
            child: VerticalTabs(
              tabBackgroundColor: Colors.white,
              backgroundColor: Colors.white,
              indicatorColor: kPrimaryColor,
              selectedTabBackgroundColor: kPrimaryColor.withOpacity(0.2),
              contentScrollAxis: Axis.horizontal,
              tabsWidth: 150,
              tabs: <Tab>[
                Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Engine and Transmission',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
                Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Fuel & Performance',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
                Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Suspension, Steering & Brakes',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
                Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Dimensions & Capacity',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
                Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Interiors',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
                Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Exteriors',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
                Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Safety',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
                Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Entertainment & Communication',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
              contents: <Widget>[
                // Container(child: Text('Flutter'), padding: EdgeInsets.all(20)),
                SingleSpecification(
                  heading: "Engine and Transmission",
                  specs: [
                    {"Engine Type": "1.2L Revotron"},
                    {"Displacement (cc)": "1199"},
                    {"Max Power": "6000 rpm"},
                    {"Max Torque": "3300 rpm"},
                    {"Cylinder": "3"},
                    {"Valves Per Cylinder": "3"},
                    {"Gear Box": "5 Speed"},
                    {"Transmission Type": "Automatic"},
                    {"Drive Type": "FWD"},
                  ],
                ),
                SingleSpecification(
                  heading: 'Fuel & Perfomance',
                  specs: [
                    {"Fuel Type": "Petrol"},
                    {"Milage": "23.84"},
                    {"Fuel Tank Capacity": "35.0"},
                    {"Emission Norm Compliance": "BS VI"}
                  ],
                ),
                SingleSpecification(
                  heading: 'Suspension, Steering & Brakes',
                  specs: [
                    {
                      "Front Suspension": "Independent, Lower wishbone, McPherson (dual path) strut type"
                    },
                    {
                      "Rear Suspension": "Twist beam with coil spring mounted on hydraulic shocks"
                    },
                    {"Steering Type": "Electric"},
                    {"Steering Column": "Tile"},
                    {"Steering Gear Type": "Rack & Pinion"},
                    {"Turning Radius": "4.9 meters"},
                    {"Front Brake Type": "Disc"},
                    {"Rear Brake Type": "Drum"},
                  ],
                ),
                SingleSpecification(
                  heading: 'Dimensions & Capacity',
                  specs: [
                    {"Length (mm)": "3765"},
                    {"Width (mm)": "1677"},
                    {"Height (mm)": "1535"},
                    {"Seating Capacity": "5"},
                    {"Ground Clearance (mm)": "170"},
                  ],
                ),
                Container(child: Text('HTML 5'), padding: EdgeInsets.all(20)),
                Container(child: Text('HTML 5'), padding: EdgeInsets.all(20)),
                Container(child: Text('HTML 5'), padding: EdgeInsets.all(20)),
                Container(child: Text('HTML 5'), padding: EdgeInsets.all(20))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
