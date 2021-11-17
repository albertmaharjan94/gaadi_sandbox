import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';

import 'package:gaadi/size_config.dart';
import 'package:image_picker/image_picker.dart';

class ECarSingleFeature extends StatefulWidget {
  ECarSingleFeature({Key? key, required this.updateFeature})
      : super(key: key);
  Function? updateFeature;

  @override
  _ECarSingleFeatureState createState() => _ECarSingleFeatureState();
}

class _ECarSingleFeatureState extends State<ECarSingleFeature> {
  final List<Widget> specs = [];

  final ImagePicker _picker = ImagePicker();

  PickedFile? _image;
  List<Map<String, String>> featureData = [];

  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();

  FocusNode titleNode = new FocusNode();
  FocusNode descriptionNode = new FocusNode();
  FocusNode submitNode = new FocusNode();
  final _formKey = GlobalKey<FormState>();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String _selected = "";
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter ss) {
              return Form(
                key: _formKey,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: title,
                        enableSuggestions: false,
                        focusNode: titleNode,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (a) {
                          titleNode.unfocus();
                          FocusScope.of(context).requestFocus(descriptionNode);
                        },
                        validator: (value) {
                          // Null check
                          if (value == "") {
                            return 'Please enter title';
                          }
                          // success condition
                          return null;
                        },
                        onChanged: (value) {},
                        decoration: InputDecoration(hintText: "Feature Title"),
                      ),
                      InkWell(
                          onTap: () async {
                            selectImage().then((value) {
                              ss(() {
                                _selected = value;
                              });
                            });
                          },
                          child: _selected == ""
                              ? Image.asset(
                                  "assets/images/default.jpg",
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  File(_selected),
                                  fit: BoxFit.fill,
                                )),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(right: 10, top: 5),
                                  child: ElevatedButton(
                                    focusNode: submitNode,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate() && _selected!= "") {
                                        Navigator.pop(context);
                                        setState(() {
                                          featureData.add({
                                            title.text.toString():
                                                _selected
                                          });
                                          widget.updateFeature!(
                                              featureData);
                                        });
                                        // specs.add(_makeSpecification(title.text.toString(), description.text.toString()));
                                        title.text = "";
                                        print("Specs Data : " +
                                            featureData.toString());
                                      }
                                    },
                                    child: Text("Save"),
                                  ))),
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Close"),
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
    // return showDialog(
    //     context: context,
    //     builder: (context) {
    //       return StatefulBuilder(
    //           builder: (context, setState) {
    //             return AlertDialog(
    //         title: Text('Add Feature'),
    //         content: Form(
    //           key: _formKey,
    //           child: Container(
    //             constraints: BoxConstraints(
    //               maxHeight: double.infinity,
    //             ),
    //             child: Column(
    //
    //               mainAxisSize: MainAxisSize.min,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 TextFormField(
    //                   controller: title,
    //                   enableSuggestions: false,
    //                   focusNode: titleNode,
    //                   keyboardType: TextInputType.text,
    //                   onFieldSubmitted: (a) {
    //                     titleNode.unfocus();
    //                     FocusScope.of(context).requestFocus(descriptionNode);
    //                   },
    //                   validator: (value) {
    //                     // Null check
    //                     if (value == "") {
    //                       return 'Please enter title';
    //                     }
    //                     // success condition
    //                     return null;
    //                   },
    //                   onChanged: (value) {},
    //                   decoration:
    //                   InputDecoration(hintText: "Feature Title"),
    //                 ),
    //                 InkWell(
    //                   onTap: () => selectImage(),
    //                   child: _image == null ? Image.asset(
    //                     "assets/images/default.jpg",
    //                     fit: BoxFit.fill,
    //                   ) : Image.file(
    //                     File(_image!.path),
    //                     fit: BoxFit.fill,
    //                   ),
    //                 ),
    //                 Row(
    //                   children: [
    //                     Expanded(
    //                         child: Container(
    //                             margin: EdgeInsets.only(right: 10, top: 5),
    //                             child: ElevatedButton(
    //                               focusNode: submitNode,
    //                               onPressed: () {
    //                                 if(_formKey.currentState!.validate()){
    //                                   Navigator.pop(context);
    //                                   setState(() {
    //                                     featureData.add({
    //                                       title.text.toString():
    //                                       description.text.toString()
    //                                     });
    //                                     widget.updateFeature!(featureData);
    //                                   });
    //                                   // specs.add(_makeSpecification(title.text.toString(), description.text.toString()));
    //                                   title.text = "";
    //                                   description.text = "";
    //                                   print("Specs Data : " + featureData.toString());
    //                                 }
    //
    //                               },
    //                               child: Text("Save"),
    //                             ))),
    //                     Expanded(
    //                         child: Container(
    //                             margin: EdgeInsets.only(left: 10, top: 5),
    //                             child: ElevatedButton(
    //                               onPressed: () {
    //                                 Navigator.pop(context);
    //                               },
    //                               child: Text("Close"),
    //                             )))
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     });});
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = featureData.removeAt(oldindex);
      featureData.insert(newindex, items);
      widget.updateFeature!(featureData);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(" BUILD FEATURE ");
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Feature",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("Add"),
                  onPressed: () {
                    _displayTextInputDialog(context);
                  })
            ],
          ),
          featureData.length == 0
              ? Text(
                  "Add the features of parts",
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black45),
                )
              : ReorderableListView(
                  onReorder: reorderData,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                      for (final items in featureData)
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          key: ValueKey(items),
                          title: Card(
                              child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: getProportionateScreenWidth(100),
                                      child: Text(
                                        "${items.keys.first}",
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(120),
                                      child:
                                      Image.file(
                                        File(items.values.first),
                                        fit: BoxFit.fill,
                                      )
                                      // Text(
                                      //   "${items.values.first}",
                                      //   style: TextStyle(color: Colors.black54),
                                      // ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.all<double>(1),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              side: BorderSide(
                                                  color: kPrimaryColor)))),
                                  child: Icon(
                                    Icons.delete,
                                    color: kPrimaryColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      featureData
                                          .removeAt(featureData.indexOf(items));
                                      // widget.updateFeature!(featureData);
                                    });
                                  },
                                ),
                              ],
                            ),
                          )),
                        )
                    ]

                  // Card(
                  //   child: Container(
                  //     padding: EdgeInsets.all(16.0),
                  //     child: Text('${featureData[index]}'),
                  //   ));
                  )
        ],
      ),
    );
  }

  Future<String> selectImage() async {
    final PickedFile selected =
        await _picker.getImage(source: ImageSource.gallery);
    return selected.path;
  }
}
