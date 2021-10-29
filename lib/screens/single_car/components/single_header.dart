import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/size_config.dart';

class SingleHeader extends StatefulWidget {
  List? carousel;

  SingleHeader({Key? key, required this.carousel}) : super(key: key);

  @override
  _SingleHeaderState createState() => _SingleHeaderState();
}

class _SingleHeaderState extends State<SingleHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            height: getProportionateScreenHeight(200)),
        items: widget.carousel!.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Image.asset(
                    i,
                    fit: BoxFit.cover,
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}
