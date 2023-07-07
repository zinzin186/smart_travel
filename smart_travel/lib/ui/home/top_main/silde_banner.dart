import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smart_travel/ui/home/top_main/search_home.dart';

class SlideBannerWidget extends StatefulWidget {

  List<String> banners;
  final String? placeholder;
  final String? description;
  final GestureTapCallback? onTapSearch;

  SlideBannerWidget({Key? key, required this.banners, this.placeholder, this.description, this.onTapSearch}) : super(key: key);

  @override
  State<SlideBannerWidget> createState() => _SlideBannerState();

}

class _SlideBannerState extends State<SlideBannerWidget> {

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            right: 0,
            child: CarouselSlider(
          items: widget.banners
              .map((item) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(item),
                fit: BoxFit.cover,
              ),
            ),
          ))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: double.infinity,
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // aspectRatio: 3.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        )),
        Positioned(
          bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.banners.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            )),
        Positioned(
            bottom: 60,
            top: 80,
            left: 30,
            right: 30,
            child: SearchHomeWidget(placeholder: widget.placeholder, description: widget.description, onTapSearch: widget.onTapSearch,))
      ]),
    );

  }

}