import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/size_config.dart';

class PartSingleHeader extends StatefulWidget {
  List? carousel;
  PartSingleHeader({Key? key, required this.carousel}) : super(key: key);

  @override
  _PartSingleHeaderState createState() => _PartSingleHeaderState();
}

class _PartSingleHeaderState extends State<PartSingleHeader> {
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
                      child: Image.network(i, fit: BoxFit.cover,)
                  );

                },
              );
            }).toList(),
          ),
        );
  }
}
