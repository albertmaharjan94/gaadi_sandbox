import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/size_config.dart';

class EPartSingleSpecification extends StatefulWidget {
  EPartSingleSpecification({Key? key, required this.updateSpecification}) : super(key: key);
  Function? updateSpecification;
  @override
  _EPartSingleSpecificationState createState() =>
      _EPartSingleSpecificationState();
}

class _EPartSingleSpecificationState extends State<EPartSingleSpecification> {
  List<Widget> specs = [Text("Test")];

  List<Map<String, String>> specsData = [];

  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();

  FocusNode titleNode = new FocusNode();
  FocusNode descriptionNode = new FocusNode();
  FocusNode submitNode = new FocusNode();
  final _formKey = GlobalKey<FormState>();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Specification'),
            content: Form(
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
                      decoration:
                          InputDecoration(hintText: "Specification Title"),
                    ),
                    TextFormField(
                      controller: description,
                      enableSuggestions: false,
                      focusNode: descriptionNode,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (a) {
                        descriptionNode.unfocus();
                        FocusScope.of(context).requestFocus(submitNode);
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
                      decoration:
                          InputDecoration(hintText: "Specification Detail"),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 10, top: 5),
                                child: ElevatedButton(
                                  focusNode: submitNode,
                                  onPressed: () {
                                    if(_formKey.currentState!.validate()){
                                      Navigator.pop(context);
                                      setState(() {
                                        specsData.add({
                                          title.text.toString():
                                          description.text.toString()
                                        });
                                        widget.updateSpecification!(specsData);
                                      });
                                      // specs.add(_makeSpecification(title.text.toString(), description.text.toString()));
                                      title.text = "";
                                      description.text = "";
                                      print("Specs Data : " + specsData.toString());
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
            ),
          );
        });
  }

  void reorderData(int oldindex, int newindex){
    setState(() {
      if(newindex>oldindex){
        newindex-=1;
      }
      final items =specsData.removeAt(oldindex);
      specsData.insert(newindex, items);
      widget.updateSpecification!(specsData);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Specification",
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
          specsData.length == 0 ? Text("Add the specifications of parts", style: TextStyle(
              fontStyle: FontStyle.italic, color: Colors.black45),) :
          ReorderableListView(
              onReorder: reorderData,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                for (final items in specsData)
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
                                    "${items.keys.first} ",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                                Container(
                                  width: getProportionateScreenWidth(120),
                                  child: Text(
                                    "${items.values.first}",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(1),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          side: BorderSide(color: kPrimaryColor)))),
                              child: Icon(
                                Icons.delete,
                                color: kPrimaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  specsData.removeAt(
                                      specsData.indexOf(items));
                                  widget.updateSpecification!(specsData);
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
                //     child: Text('${specsData[index]}'),
                //   ));
              )
        ],
      ),
    );
  }
}
