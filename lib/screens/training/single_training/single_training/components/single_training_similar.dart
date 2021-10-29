import 'package:flutter/material.dart';
import 'package:gaadi/screens/job/single_job/single_job.dart';
import 'package:gaadi/screens/training/all_training/components/training_adapter.dart';

class SingleTrainingSimilar extends StatefulWidget {
  const SingleTrainingSimilar({Key? key}) : super(key: key);

  @override
  _SingleTrainingSimilarState createState() => _SingleTrainingSimilarState();
}

class _SingleTrainingSimilarState extends State<SingleTrainingSimilar> {
  List<Widget> cars=[
    TrainingAdapter(
        image: "assets/demo/cars/hondaAccord.jpg",
        title: "Honda Accord", company: "Softwarica", date: "Oct 2, 2021", opening: "10", location: "Kathmandu, Bagmati",tap: SingleJob(title: "Washing"), isFavorite:true),
    TrainingAdapter(
        image: "assets/demo/cars/fordFocus.jpg",
        title: "Ford Focus", company: "Sunrise ", date: "Mar 12, 2021", opening: "20", location: "Kathmandu, Bagmati",tap: SingleJob(title: "Washing"), isFavorite:false),
    TrainingAdapter(
      image: "assets/demo/cars/hyundaiElantra.jpg",
      title: "Elantra", company: "Tesla", date: "Feb 20, 2021", opening: "190", location: "Bhaktapur, Bagmati",tap: SingleJob(title: "Washing"), isFavorite: true,),
    TrainingAdapter(
      image: "assets/demo/cars/hondaAccord.jpg",
      title: "Honda Accord", company: "Softwarica", date: "Oct 2, 2021",location: "Lalitpur, Bagmati", opening: "10", tap: SingleJob(title: "Washing"), isFavorite: false,),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
            Text(
              "Similar Trainings",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              cars
          ),
        ],
      ),
    );
  }
}
