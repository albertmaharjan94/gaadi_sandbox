import 'package:flutter/material.dart';
import 'package:gaadi/screens/home/dashboard/components/card.dart';
import 'package:gaadi/screens/home/dashboard/components/section_title.dart';
import 'package:gaadi/size_config.dart';

class PopularPart extends StatelessWidget {

  List<Map<String, dynamic>> demoPopular = [
    {"id": 1, "title": "Akd Light for Elantra", "price": 800, "image": "assets/demo/cars/akdLight.jpg", "isFavourite": false},
    {"id": 2, "title": "BridgeStone Tyres", "price": 1900, "image": "assets/demo/cars/bridgestone.jpg", "isFavourite": true},
    {"id": 3, "title": "Dunlop tyres", "price": 2000, "image": "assets/demo/cars/dunlop.jpg", "isFavourite": true},
    {"id": 4, "title": "Echo Guard Air Filter", "price": 700, "image": "assets/demo/cars/echoGuardAirFIlter.jpg", "isFavourite": false},
    {"id": 5, "title": "Fagis Light", "price": 1800, "image": "assets/demo/cars/fagisLight.jpg", "isFavourite": true},
    {"id": 5, "title": "Fram Air Filter", "price": 300, "image": "assets/demo/cars/framAirFilter.jpg", "isFavourite": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Parts", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoPopular.length,
                (index) {
                  // if (demoProducts[index].isPopular)
                    return HomeCard(product: demoPopular[index]);

                  // return SizedBox
                  //     .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
