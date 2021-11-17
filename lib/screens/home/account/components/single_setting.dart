import 'package:flutter/material.dart';

class SingleSetting extends StatefulWidget {
  SingleSetting({Key? key, this.title, this.subTitle, this.onTap}) : super(key: key);
  String? title = "";
  String? subTitle  = "";
  Function? onTap = (){};

  @override
  _SingleSettingState createState() => _SingleSettingState();
}

class _SingleSettingState extends State<SingleSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: ()=> widget.onTap!(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text(widget.subTitle! ,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black54),)
                ],
              ),
              Icon(Icons.arrow_forward_ios_outlined, color: Colors.black54,),
            ],
          )),
        ),
      ),
    );
  }
}
