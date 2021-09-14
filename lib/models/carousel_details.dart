class Slider {
  final String imageUrl;
  final String title;
  final String description;

  Slider(
      {required this.imageUrl, required this.title, required this.description});
}

final List silderList = [
  Slider(
    imageUrl: 'assets/images/_board3.png',
    title: 'Buy Car',
    description:
        'Buy a new car. Buy a new car. Buy a new car. Buy a new car. Buy a new car. Buy a new car. Buy a new car. Buy a new car. ',
  ),
  Slider(
    imageUrl: 'assets/images/_board1.png',
    title: 'Road Accident',
    description:
        'Get a nearby car service. Get a nearby car service. Get a nearby car service. Get a nearby car service. Get a nearby car service.',
  ),
  Slider(
    imageUrl: 'assets/images/_board2.png',
    title: 'Emergency',
    description:
        'Call for emergency. Call for emergency. Call for emergency. Call for emergency. Call for emergency. Call for emergency.',
  ),
];
