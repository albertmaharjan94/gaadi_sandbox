import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/event/components/EventModel.dart';
import 'package:gaadi/screens/modals/modals.dart';
import 'package:gaadi/size_config.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:table_calendar/table_calendar.dart';

import 'event_modal.dart';


class AllCalendar extends StatefulWidget {
  const AllCalendar({Key? key}) : super(key: key);

  @override
  _AllCalendarState createState() => _AllCalendarState();
}

class _AllCalendarState extends State<AllCalendar> {
  DateTime selectedDay =
  DateTime.utc(
      DateTime
          .now()
          .year, DateTime
      .now()
      .month, DateTime
      .now()
      .day);

  DateTime focusedDay =
  DateTime.utc(
      DateTime
          .now()
          .year, DateTime
      .now()
      .month, DateTime
      .now()
      .day);

  Map<DateTime, List<EventModel>>? selectedEvents = {
    DateTime.utc(
        DateTime
            .now()
            .year, DateTime
        .now()
        .month, DateTime
        .now()
        .day - 1): [
      EventModel(title: "1D ago"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello")
    ],
    DateTime.utc(
        DateTime
            .now()
            .year, DateTime
        .now()
        .month, DateTime
        .now()
        .day): [
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello"),
      EventModel(title: "Hello")
    ]
  };

  List<EventModel> _getEventsFromToday(DateTime date) {
    return selectedEvents?[date] ?? [];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("INIT " + selectedEvents.toString());
  }

  void _onDaySelected(DateTime _selectedDay, DateTime _focusedDay) {
    if (!isSameDay(selectedDay, _selectedDay)) {
      setState(() {
        selectedDay =
            DateTime.utc(
                _selectedDay.year, _selectedDay.month, _selectedDay.day);
        focusedDay =
            DateTime.utc(
                _focusedDay.year, _focusedDay.month, _focusedDay.day);
      });
    }
  }
  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }
  Widget _buildEventsMarker(DateTime date, List events) {
    return Container(
      // duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(5.5),
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: kPrimaryColor)),
      child:
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
              color: Colors.blueAccent.shade400
            ),
            child: Text(
              events.length.toString(),
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
    );
  }
  // Widget _buildEventsMarker(DateTime date, List events) {
  //   return Container(
  //     padding: EdgeInsets.zero,
  //     alignment: Alignment.bottomRight,
  //     decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         border: Border.all(color: kPrimaryColor),
  //     ),
  //     // child:
  //     // Container(
  //     //   padding: EdgeInsets.all(4),
  //     //   decoration: BoxDecoration(
  //     //       shape: BoxShape.circle,
  //     //     color: Colors.blueAccent.shade400
  //     //   ),
  //     //   child: Text(
  //     //     events.length.toString(),
  //     //     textAlign: TextAlign.end,
  //     //     style: TextStyle(color: Colors.white, fontSize: 12),
  //     //   ),
  //     // ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(DateTime
                  .now()
                  .year + 10),

              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  Widget children = Container();
                  if (events.isNotEmpty) {
                     children = _buildEventsMarker(date, events);
                  }

                  // if (holidays.isNotEmpty) {
                  //   children.add(
                  //     Positioned(
                  //       right: -2,
                  //       top: -2,
                  //       child: _buildHolidaysMarker(),
                  //     ),
                  //   );
                  // }

                  return children;
                },
              ),
              pageAnimationEnabled: true,
              daysOfWeekVisible: true,
              pageJumpingEnabled: true,
              onDaySelected: _onDaySelected,
              eventLoader: _getEventsFromToday,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  todayTextStyle: TextStyle(color: Colors.black),
                  disabledDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  outsideDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  todayDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      color: kPrimaryColor.withOpacity(0.2),
                      // border: Border.all(color: kPrimaryColor)
                  ),
                  selectedDecoration: BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  )),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonShowsNext: true,
              ),
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          GestureDetector(
            onHorizontalDragEnd: (details) {
              // Note: Sensitivity is integer used when you don't want to mess up vertical drag
              if (details.primaryVelocity! > 5) {
                print("right");
                setState(() {
                  selectedDay = new DateTime(
                      selectedDay.year, selectedDay.month, selectedDay.day - 1);
                });
              }

              // Swiping in left direction.
              if (details.primaryVelocity! < 5) {
                setState(() {
                  selectedDay = new DateTime(
                      selectedDay.year, selectedDay.month, selectedDay.day + 1);
                });
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: _getEventsFromToday(selectedDay).length > 0
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Events",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${selectedDay.year}-${selectedDay.month}-${selectedDay
                            .day}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ..._getEventsFromToday(selectedDay).map((EventModel e) {
                    return ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: InkWell(
                          onTap: () {
                            showFloatingModalBottomSheet(context: context, builder: (BuildContext context){
                              return EventModal();
                            });
                          },
                          child: Card(
                              margin: EdgeInsets.zero,
                              elevation: 2,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Text(e.title))),
                        ));
                  })
                ],
              )
                  : ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Events",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${selectedDay.year}-${selectedDay
                              .month}-${selectedDay.day}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Text("No Events Available")
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
        ],
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, List<EventModel>> selectedEvents = {};
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedEvents[selectedDay] = [
      EventModel(title: "AASSDF"),
    ];
  }

  List<EventModel> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ESTech Calendar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
                (EventModel event) =>
                ListTile(
                  title: Text(
                    event.title,
                  ),
                ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    title: Text("Add Event"),
                    content: TextFormField(
                      controller: _eventController,
                    ),
                    actions: [
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: Text("Ok"),
                        onPressed: () {
                          if (_eventController.text.isEmpty) {} else {
                            if (selectedEvents[selectedDay] != null) {
                              selectedEvents[selectedDay]!.add(
                                EventModel(title: _eventController.text),
                              );
                              print(selectedEvents.toString());
                            } else {
                              selectedEvents[selectedDay] = [
                                EventModel(title: _eventController.text)
                              ];

                              print(selectedEvents.toString());
                            }
                          }
                          Navigator.pop(context);
                          _eventController.clear();
                          setState(() {});
                          return;
                        },
                      ),
                    ],
                  ),
            ),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
