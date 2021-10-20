import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/size_config.dart';


class SearchFieldCar extends StatelessWidget {
  const SearchFieldCar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) => print(value),
            decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(2)),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search car...",
                prefixIcon: Icon(Icons.search)),
          ),
        ),
      ],
    );
  }
}
