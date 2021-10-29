import 'package:flutter/material.dart';
import 'package:gaadi/screens/training/all_training/components/training_adapter.dart';
import 'package:gaadi/screens/training/single_training/single_training/single_training.dart';

class TrainingBody extends StatefulWidget {
  const TrainingBody({Key? key}) : super(key: key);

  @override
  _TrainingBodyState createState() => _TrainingBodyState();
}

class _TrainingBodyState extends State<TrainingBody> {
  List<Widget> cars=[
    TrainingAdapter(
        image: "assets/images/portfolio8.png",
        title: "Mechanic", company: "Softwarica", date: "Oct 2, 2021", opening: "10", location: "Kathmandu, Bagmati",tap: SingleTraining(title: "Washing"), isFavorite:true),
    TrainingAdapter(
        image: "assets/images/portfolio9.png",
        title: "Washing", company: "Sunrise ", date: "Mar 12, 2021", opening: "20", location: "Kathmandu, Bagmati",tap: SingleTraining(title: "Washing"), isFavorite:false),
    TrainingAdapter(
        image: "assets/images/portfolio10.png",
        title: "Machine", company: "Tesla", date: "Feb 20, 2021", opening: "190", location: "Bhaktapur, Bagmati",tap: SingleTraining(title: "Washing"), isFavorite: true,),
    TrainingAdapter(
        image: "assets/images/portfolio11.png",
        title: "Washing", company: "Softwarica", date: "Oct 2, 2021",location: "Lalitpur, Bagmati", opening: "10", tap: SingleTraining(title: "Washing"), isFavorite: false,),
    TrainingAdapter(
        image: "assets/images/portfolio12.png",
        title: "Metal works", company: "Sunrise ", date: "Mar 12, 2021",location: "Kathmandu, Bagmati", opening: "20", tap: SingleTraining(title: "Washing"), isFavorite: false,),
    TrainingAdapter(
        image: "assets/images/portfolio13.png",
        title: "Elantra", company: "Tesla", date: "Feb 20, 2021", opening: "190", location: "Kathmandu, Bagmati",tap: SingleTraining(title: "Washing"), isFavorite: true,),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
