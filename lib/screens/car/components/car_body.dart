import 'package:flutter/material.dart';
import 'package:gaadi/screens/car/components/search_field_car.dart';
import 'package:gaadi/screens/car/components/single_car.dart';
import 'package:gaadi/screens/single_car/single_product.dart';
import 'package:gaadi/size_config.dart';

class CarBody extends StatefulWidget {
  const CarBody({Key? key}) : super(key: key);

  @override
  _CarBodyState createState() => _CarBodyState();
}

class _CarBodyState extends State<CarBody> {
  List<Widget> cars=[
    SingleCar(
        images: ["assets/demo/cars/hondaAccord.jpg", "assets/demo/cars/hondaAccord.jpg", "assets/demo/cars/hondaAccord.jpg"],
        title: "Honda Accord", price: "1000000", rating: "3.5", review: "200", tap: SingleProduct()),
    SingleCar(
        images: ["assets/demo/cars/fordFocus.jpg", "assets/demo/cars/fordFocus.jpg", "assets/demo/cars/fordFocus.jpg"],
        title: "Ford Focus", price: "200000", rating: "4.5", review: "120", tap: SingleProduct()),
    SingleCar(
        images: ["assets/demo/cars/hyundaiElantra.jpg", "assets/demo/cars/toyotaCorolla.jpg", "assets/demo/cars/hyundaiElantra.jpg"],
        title: "Elantra", price: "1000000", rating: "2", review: "190", tap: SingleProduct()),
    SingleCar(
        images: ["assets/demo/cars/hondaAccord.jpg", "assets/demo/cars/hondaAccord.jpg", "assets/demo/cars/hondaAccord.jpg"],
        title: "Honda Accird", price: "1000000", rating: "2", review: "120", tap: SingleProduct()),
    SingleCar(
        images: ["assets/demo/cars/hondaAccord.jpg", "assets/demo/cars/hondaAccord.jpg", "assets/demo/cars/hondaAccord.jpg"],
        title: "Honda Accird", price: "1000000", rating: "2", review: "120", tap: SingleProduct()),

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
              children:cars
            ),
          )
        ]
      ),
    );
  }
}
