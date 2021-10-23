import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaadi/Transitions/RouteSlide.dart';
import 'package:gaadi/carousel/slide_item.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/car/car.dart';
import 'package:gaadi/screens/event/all_event.dart';
import 'package:gaadi/screens/event/components/all_calendar.dart';
import 'package:gaadi/screens/job/all_jobs/job.dart';
import 'package:gaadi/size_config.dart';


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/settings.svg", "text": "Parts", "link": Car()},
      {"icon": "assets/icons/sports_car.svg", "text": "Buy", "link": Car()},
      {"icon": "assets/icons/car.svg", "text": "Decorate", "link": Car()},
      {"icon": "assets/icons/tools.svg", "text": "Workshop", "link": Car()},
      {"icon": "assets/icons/siren.svg", "text": "Emergency", "link": Car()},
      {"icon": "assets/icons/ticket.svg", "text": "Ticket","link": AllEvent()},
      {"icon": "assets/icons/event.svg", "text": "Event", "link": Calendar()},
      {"icon": "assets/icons/education.svg", "text": "Training","link": Car()},
      {"icon": "assets/icons/suitcase.svg", "text": "Job", "link": Job()},
      {"icon": "assets/icons/boxes.svg", "text": "Logistic", "link": Car()},
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
            press: () {
              print(index);
              Navigator.push(context, SlideLeftRoute(page: categories[index]["link"]));
            },
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
       InkWell(
         onTap: this.press,
         child: SizedBox(
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
      ),
       );
  }
}
