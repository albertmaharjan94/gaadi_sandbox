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
      {"icon": "assets/icons/sports_car.svg", "text": "Buy"},
      {"icon": "assets/icons/car.svg", "text": "Decorate"},
      {"icon": "assets/icons/tools.svg", "text": "Workshop"},
      {"icon": "assets/icons/siren.svg", "text": "Emergency"},
      {"icon": "assets/icons/ticket.svg", "text": "Ticket"},
      {"icon": "assets/icons/event.svg", "text": "Event"},
      {"icon": "assets/icons/education.svg", "text": "Training"},
      {"icon": "assets/icons/suitcase.svg", "text": "Job"},
      {"icon": "assets/icons/boxes.svg", "text": "Logistic"},
    ];
    return Padding(
      padding: EdgeInsets.all(0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        primary: true,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 0.9,
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
    return
       SizedBox(
        width: getProportionateScreenWidth(50),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              height: getProportionateScreenWidth(50),
              width: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!, color: Colors.black54,),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center, style: TextStyle(fontSize: 10),)
          ],
        ),
      );
  }
}
