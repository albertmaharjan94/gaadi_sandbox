import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/size_config.dart';
import 'package:gaadi/widgets/map_wo_container.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
class EventModal extends StatefulWidget {
  EventModal({Key? key}) : super(key: key);

  String event_desc = """
Q&A during sessions

Attendees will always have questions – give them a chance to ask them! The best way to do Q&A virtually is through a chat, which allows a moderator to approve questions before having the speaker answer them.
Create a hashtag for your virtual conference

Promote your event on social media using a hashtag. Have attendees use a hashtag when posting about the event and use it during promotion before the event to generate interest.
Send swag to attendees who register early

Event swag is always one of the best parts of any conference. Send attendees hats, t-shirts, mousepads, hand sanitizer, branded masks, or whatever else is popular at the moment. There’s nothing better than a surprise delivery.
Gamification through a mobile event app

Activate your attendees through the mobile app by adding gamification challenges that keep them engaged during the event.
Breakout sessions

Find a virtual conferencing tool that allows you to send attendees into breakout sessions. These breakouts can be used to facilitate lively discussions during sessions.
1:1 appointments

Sponsors and exhibitors are always looking for ways to network with attendees. Allow attendees to self-schedule meetings with sponsors and exhibitors before the conference and have them added to the agenda.
Trade Show booth hours

Have exhibitors offer drop-in hours at booths so that attendees can network with them during free moments in their schedule. Gather
Live polling during sessions

Engagement is the name of the game. Have speakers utilize live polling during sessions to gauge attendee’s answers in real-time.
Find event sponsors

Sponsors can alleviate the cost of your event and attract more attendees. Put together an attractive sponsorship package and find quality sponsors who align with your event’s purpose.
Cooking lessons from the comfort of your own home

Hire a chef to give a cooking lesson during the virtual conference. This lesson can occur during the lunch break or at the end of the day. Send attendees the recipe ahead of time and maybe even a gift card for groceries or a little swag, and have them tune in to follow along with real pro.
Limit access based on different registration levels

If you’re charging for your virtual event, consider offering different levels of access to content that is clearly stated on the event website, just like you would at an in-person event. Come up with different offerings for a basic attendee and a VIP attendee that are worth the cost difference.
  """;

  @override
  _EventModalState createState() => _EventModalState();
}

class _EventModalState extends State<EventModal> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
                child: Text("Event Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Icon(Icons.calendar_today_outlined),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Feb 2020"),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Icon(Icons.watch_later_outlined),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("10:00"),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Icon(
                      Icons.location_on_outlined,),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Kathmandu, Bagmati"),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
                child: Image.asset("assets/images/mobilebanner.jpg")),
            SizedBox(height: getProportionateScreenHeight(10),),
            Text(widget.event_desc),
            MapWoContainer()
          ],
        ),

      ),
    );
  }
}
