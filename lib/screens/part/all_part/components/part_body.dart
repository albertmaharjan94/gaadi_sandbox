import 'package:flutter/material.dart';
import 'package:gaadi/screens/part/all_part/components/single_part.dart';
import 'package:gaadi/screens/part/single_part/single_part_page.dart';

class PartBody extends StatefulWidget {
  const PartBody({Key? key}) : super(key: key);

  @override
  _PartBodyState createState() => _PartBodyState();
}

class _PartBodyState extends State<PartBody> {
  List<Widget> parts=[
    SinglePart(
        images: ["assets/demo/cars/akdLight.jpg", "assets/demo/cars/bridgestone.jpg", "assets/demo/cars/akdLight.jpg"],
        title: "Honda Accord", price: "1000000", rating: "3.5", review: "200", tap: SinglePartPage(title: 'AKD',)),
    SinglePart(
        images: ["assets/demo/cars/dunlop.jpg", "assets/demo/cars/dunlop.jpg", "assets/demo/cars/dunlop.jpg"],
        title: "Ford Focus", price: "200000", rating: "4.5", review: "120", tap: SinglePartPage(title: 'AKD',)),
    SinglePart(
        images: ["assets/demo/cars/fagisLight.jpg", "assets/demo/cars/echoGuardAirFilter.jpg", "assets/demo/cars/dunlop.jpg"],
        title: "Elantra", price: "1000000", rating: "2", review: "190", tap: SinglePartPage(title: 'AKD',)),
    SinglePart(
        images: ["assets/demo/cars/framAirFilter.jpg", "assets/demo/cars/framAirFilter.jpg", "assets/demo/cars/framAirFilter.jpg"],
        title: "Honda Accird", price: "1000000", rating: "2", review: "120", tap: SinglePartPage(title: 'AKD',)),
  ];


  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children:parts
            ),
          )
        ]
      ),
    );
  }
}
