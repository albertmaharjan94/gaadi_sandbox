import 'package:flutter/material.dart';
import 'package:gaadi/Transitions/RouteSlide.dart';
import 'package:gaadi/screens/home/dashboard/components/card.dart';
import 'package:gaadi/screens/home/dashboard/components/section_title.dart';
import 'package:gaadi/screens/single_car/single_product.dart';
import 'package:gaadi/size_config.dart';

class PopularComponent extends StatelessWidget {
  List<Map<String, dynamic>> demoPopular = [
    {
      "id": 1,
      "title": "Chevrolet Malibu",
      "price": 87800,
      "image": "assets/demo/cars/chevroletMalibu.jpg",
      "isFavourite": true
    },
    {
      "id": 2,
      "title": "Ford Focus",
      "price": 78900,
      "image": "assets/demo/cars/fordFocus.jpg",
      "isFavourite": false
    },
    {
      "id": 3,
      "title": "Honda Accord",
      "price": 90000,
      "image": "assets/demo/cars/hondaAccord.jpg",
      "isFavourite": true
    },
    {
      "id": 4,
      "title": "Toyota Corolla",
      "price": 7800,
      "image": "assets/demo/cars/toyotaCorolla.jpg",
      "isFavourite": false
    },
    {
      "id": 5,
      "title": "Hyundai Elantra",
      "price": 10800,
      "image": "assets/demo/cars/hyundaiElantra.jpg",
      "isFavourite": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
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
                  return Container(
                      margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(20)),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: HomeCard(product: demoPopular[index]),
                        onTap: () {
                          Navigator.push(context, SlideLeftRoute(page: SingleProduct()));
                          // Navigator.pushNamed(context, );
                          print(index);
                        },
                      ));

                  // return SizedBox
                  //     .shrink(); // here by default width and height is 0
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
