import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  List bannerList = [
    "assets/images/carforsale.jpg",
    "assets/images/mobilebanner.jpg",
    "assets/images/usedcar.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 10),
        viewportFraction: 1,
        aspectRatio: 2.0,
        enlargeCenterPage: true,),
      items: bannerList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {print(i);},
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image(image: AssetImage(i), fit: BoxFit.cover,)
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
