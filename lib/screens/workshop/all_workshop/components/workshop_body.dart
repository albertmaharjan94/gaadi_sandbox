import 'package:flutter/material.dart';
import 'package:gaadi/screens/workshop/all_workshop/components/single_workshop.dart';
import 'package:gaadi/screens/workshop/single_workshop/single_workshop_page.dart';

class WorkshopBody extends StatefulWidget {
  const WorkshopBody({Key? key}) : super(key: key);

  @override
  _WorkshopBodyState createState() => _WorkshopBodyState();
}

class _WorkshopBodyState extends State<WorkshopBody> {
  List<Widget> workshops=[
    SingleWorkshop(
        images: ["assets/images/portfolio1.png", "assets/images/portfolio2.png", "assets/images/portfolio3.png"],
        title: "Today garage", phone: "989123", address: "Kathmandu, Bagmati", rating: "3.5", review: "200", tap: SingleWorkshopPage(title: 'Workshop',)),
    SingleWorkshop(
        images: ["assets/images/portfolio2.png", "assets/images/portfolio3.png", "assets/images/portfolio4.png"],
        title: "Tommor workshop",phone: "989123", address: "Kathmandu, Bagmati", rating: "4.5", review: "120", tap: SingleWorkshopPage(title: 'WORKSHOP',)),
    SingleWorkshop(
        images: ["assets/images/portfolio5.png", "assets/images/portfolio6.png", "assets/images/portfolio7.png"],
        title: "THIS IS WORK", phone: "989123", address: "Kathmandu, Bagmati", rating: "2", review: "190", tap: SingleWorkshopPage(title: 'WORKSHOP 123',)),
    SingleWorkshop(
        images: ["assets/images/portfolio8.png", "assets/images/portfolio9.png", "assets/images/portfolio6.png"],
        title: "Marriage D", phone: "989123", address: "Kathmandu, Bagmati", rating: "2", review: "120", tap: SingleWorkshopPage(title: 'AKD',)),
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
              children:workshops
            ),
          )
        ]
      ),
    );
  }
}
