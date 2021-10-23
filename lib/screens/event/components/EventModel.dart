class EventModel{
  final String title;
  DateTime? time;
  EventModel({ required this.title});

  String toString() => this.title;
}