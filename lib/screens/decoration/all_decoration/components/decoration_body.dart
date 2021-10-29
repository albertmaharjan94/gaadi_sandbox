import 'package:flutter/material.dart';
import 'package:gaadi/screens/decoration/all_decoration/components/single_decoration.dart';
import 'package:gaadi/screens/decoration/single_decoration/single_decoration_page.dart';

class DecorationBody extends StatefulWidget {
  const DecorationBody({Key? key}) : super(key: key);

  @override
  _DecorationBodyState createState() => _DecorationBodyState();
}

class _DecorationBodyState extends State<DecorationBody> {
  List<Widget> decorations=[
    SingleDecoration(
        images: ["assets/demo/cars/decoration1.jpg", "assets/demo/cars/decoration2.jpg", "assets/demo/cars/decoration3.jpg"],
        title: "Flower House",  rating: "3.5", review: "200", tap: SingleDecorationPage(title: 'Decorate',)),
    SingleDecoration(
        images: ["assets/demo/cars/decoration2.jpg", "assets/demo/cars/decoration1.jpg", "assets/demo/cars/decoration3.jpg"],
        title: "Nice Deocration", rating: "4.5", review: "120", tap: SingleDecorationPage(title: 'Decorate',)),
    SingleDecoration(
        images: ["assets/demo/cars/decoration3.jpg", "assets/demo/cars/decoration2.jpg", "assets/demo/cars/decoration1.jpg"],
        title: "Decorte",  rating: "2", review: "190", tap: SingleDecorationPage(title: 'AKD',)),
    SingleDecoration(
        images: ["assets/demo/cars/decoration1.jpg", "assets/demo/cars/decoration2.jpg", "assets/demo/cars/decoration3.jpg"],
        title: "Marriage D",  rating: "2", review: "120", tap: SingleDecorationPage(title: 'AKD',)),
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
              children:decorations
            ),
          )
        ]
      ),
    );
  }
}
