import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaadi/carousel/slide_item.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/size_config.dart';


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/settings.svg", "text": "Parts"},
      {"icon": "assets/icons/sports-car", "text": "Buy"},
      {"icon": "assets/icons/car.svg", "text": "Decorate"},
      {"icon": "assets/icons/tools.svg", "text": "Workshop"},
      {"icon": "assets/icons/settings.svg", "text": "Parts"},
      {"icon": "assets/icons/sports_car", "text": "Buy"},
      {"icon": "assets/icons/car.svg", "text": "Decorate"},
      {"icon": "assets/icons/tools.svg", "text": "Workshop"},
    ];
    return Padding(
      padding: EdgeInsets.all(0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(50),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(40)),
              height: getProportionateScreenWidth(50),
              width: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
