import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../../size_config.dart';

class EPartSingleHeaderContact extends StatelessWidget {
  EPartSingleHeaderContact(
      {Key? key,
      this.titleController,
      this.modelController,
      this.descriptionController,
      required this.titleNode,
      required this.modelNode,
      required this.descriptionNode,
      required this.nextNode})
      : super(key: key);
  TextEditingController? titleController = new TextEditingController();
  TextEditingController? modelController = new TextEditingController();
  TextEditingController? descriptionController = new TextEditingController();

  FocusNode titleNode = FocusNode();
  FocusNode modelNode = FocusNode();
  FocusNode nextNode = FocusNode();
  FocusNode descriptionNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: TextFormField(
                          focusNode: titleNode,
                          onFieldSubmitted: (value){
                            titleNode.unfocus();
                            FocusScope.of(context)
                                .requestFocus(modelNode);
                          },
                          validator: (value) {
                            // Null check
                            if (value == "") {
                              return 'Please enter title';
                            }
                            // success condition
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Title",
                              alignLabelWithHint: true,
                              hintText: "Eg. Headlight"),
                          controller: titleController,
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          focusNode: modelNode,
                          onFieldSubmitted: (value) {
                            modelNode.unfocus();
                            FocusScope.of(context)
                                .requestFocus(descriptionNode);
                          },
                          validator: (value) {
                            // Null check
                            if (value == "") {
                              return 'Please enter model number';
                            }
                            // success condition
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Model",
                              alignLabelWithHint: true,
                              hintText: "Eg. 1234567890"),
                          controller: modelController,
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          focusNode: descriptionNode,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          validator: (value) {
                            // Null check
                            if (value == "") {
                              return 'Please enter description';
                            }
                            // success condition
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            descriptionNode.unfocus();
                            FocusScope.of(context)
                                .requestFocus(nextNode);
                          },
                          decoration: InputDecoration(
                              labelText: "Description",
                              alignLabelWithHint: true,
                              hintText: "Eg. Product Description here"),
                          controller: descriptionController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
