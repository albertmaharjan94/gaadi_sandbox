import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/Transitions/RouteSlide.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SingleWorkshop extends StatefulWidget {
  SingleWorkshop(
      {Key? key,
      required this.images,
      required this.title,
      required this.rating,
      required this.review,
      required this.phone,
      required this.address,
      required this.tap})
      : super(key: key);
  List<String>? images;
  String? title;
  String? phone;
  String? address;
  String? rating;
  String? review;
  Widget? tap;

  @override
  _SingleWorkshopState createState() => _SingleWorkshopState();
}

class _SingleWorkshopState extends State<SingleWorkshop> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          onTap: (){
            Navigator.push(context, SlideLeftRoute(page: widget.tap!));
          },
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                    children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        height: 200.0,
                        aspectRatio: 2.0,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: widget.images!.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Image(
                                  image: AssetImage(i),
                                  fit: BoxFit.cover,
                                )),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.images!.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(_current == entry.key ? 0.9 : 0.4),
                                  // (Theme.of(context).brightness == Brightness.dark
                                  //     ? Colors.white
                                  //     : Colors.black)
                                  //     .withOpacity(_current == entry.key ? 0.9 : 0.4)
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                      Positioned.fill(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.favorite_outline, color: Colors.red,),
                            ),
                          )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  widget.title!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  widget.phone!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  widget.address!,
                  style: TextStyle(fontSize: 16),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    SmoothStarRating(
                      isReadOnly: true,
                      allowHalfRating: false,
                      rating: 1,
                      size: 20,
                      starCount: 1,
                      color: Colors.yellow.shade700,
                      borderColor: Colors.yellow.shade700,
                      spacing: 0.0,
                      onRated: (value) {
                        // setState(() {
                        //   rating = value;
                        // });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: Text(
                        widget.rating!,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: Text(
                        "(${widget.review!} reviews)",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black45),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
