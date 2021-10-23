import 'package:flutter/material.dart';
import 'package:gaadi/screens/job/all_jobs/components/job_adapter.dart';
import 'package:gaadi/screens/job/single_job/single_job.dart';

class JobBody extends StatefulWidget {
  const JobBody({Key? key}) : super(key: key);

  @override
  _JobBodyState createState() => _JobBodyState();
}

class _JobBodyState extends State<JobBody> {
  List<Widget> cars=[
    JobAdapter(
        image: "assets/demo/cars/hondaAccord.jpg",
        title: "Honda Accord", company: "Softwarica", date: "Oct 2, 2021", opening: "10", location: "Kathmandu, Bagmati",tap: SingleJob(title: "Washing"), isFavorite:true),
    JobAdapter(
        image: "assets/demo/cars/fordFocus.jpg",
        title: "Ford Focus", company: "Sunrise ", date: "Mar 12, 2021", opening: "20", location: "Kathmandu, Bagmati",tap: SingleJob(title: "Washing"), isFavorite:false),
    JobAdapter(
        image: "assets/demo/cars/hyundaiElantra.jpg",
        title: "Elantra", company: "Tesla", date: "Feb 20, 2021", opening: "190", location: "Bhaktapur, Bagmati",tap: SingleJob(title: "Washing"), isFavorite: true,),
    JobAdapter(
        image: "assets/demo/cars/hondaAccord.jpg",
        title: "Honda Accord", company: "Softwarica", date: "Oct 2, 2021",location: "Lalitpur, Bagmati", opening: "10", tap: SingleJob(title: "Washing"), isFavorite: false,),
    JobAdapter(
        image: "assets/demo/cars/fordFocus.jpg",
        title: "Ford Focus", company: "Sunrise ", date: "Mar 12, 2021",location: "Kathmandu, Bagmati", opening: "20", tap: SingleJob(title: "Washing"), isFavorite: false,),
    JobAdapter(
        image: "assets/demo/cars/hyundaiElantra.jpg",
        title: "Elantra", company: "Tesla", date: "Feb 20, 2021", opening: "190", location: "Kathmandu, Bagmati",tap: SingleJob(title: "Washing"), isFavorite: true,),
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
