import 'package:flutter/material.dart';
import 'package:gaadi/api/api.dart';
import 'package:gaadi/api/api_response.dart';
import 'package:gaadi/screens/part/all_part/components/single_part.dart';
import 'package:gaadi/screens/part/single_part/single_part_page.dart';
import 'package:provider/provider.dart';

import '../../part_view_model.dart';

class PartBody extends StatefulWidget {
  const PartBody({Key? key}) : super(key: key);

  @override
  _PartBodyState createState() => _PartBodyState();
}

class _PartBodyState extends State<PartBody> {
  List<Widget> parts = [];
  ApiResponse _apiResponse = ApiResponse.loading("Loading");

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<PartViewModel>(context, listen: false).getParts();
    });
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      parts = Provider.of<PartViewModel>(context, listen: true)
          .parts
          .map(
            (e) => SinglePart(
                images: e.image == null
                    ? []
                    : e.image!.map((e) => imageDomain + "/" + e).toList(),
                title: e.title,
                price: e.price.toString(),
                user: e.user!.firstname,
                rating: "4.5",
                review: "120",
                tap: SinglePartPage(
                  title: e.title,
                  id: e.id.toString(),
                )),
          )
          .toList();
      _apiResponse=Provider.of<PartViewModel>(context, listen: true).apiResponse;

    });

    print(parts.toString());
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if(_apiResponse.status == Status.ERROR)
              Center(child: Container(child: Text("CONNECTION LOST. SCROLL DOWN TO REFRESH"))),
            Expanded(
              child: RefreshIndicator(
                onRefresh: refreshPage,
                child: ListView(children:
                parts),
              ),
            )
          ]),
    );
  }

  Future<void> refreshPage() async {
    Provider.of<PartViewModel>(context, listen: false).getParts();
  }
}


