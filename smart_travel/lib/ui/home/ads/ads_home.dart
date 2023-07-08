import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smart_travel/model/home_block.dart';
import 'package:smart_travel/model/voucher.dart';
import 'package:smart_travel/ui/home/top_main/search_home.dart';

import '../../../api/base_api.dart';
import '../base_widget_home.dart';

class AdsBannerWidget extends BaseBlock {
  const AdsBannerWidget({Key? key, required HomeBlockModel block}) : super(key: key, block: block);
  @override
  State<AdsBannerWidget> createState() => _AdsBannerState();

}

class _AdsBannerState extends State<AdsBannerWidget> {

  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<VoucherModel> items = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    if (widget.block.contentLink?.isEmpty ?? true) {
      return;
    }
    final response = await ClientAPI.getInstance().getAdsList(widget.block.contentLink!);
    if (mounted) {
      setState(() {
        items = response;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      padding: EdgeInsets.only(left: 6, right: 6, top: 14, bottom: 14),
      child: Stack(children: [
        Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: CarouselSlider(
                items: items
                    .map((item) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(item.imageUri),
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
              ),
            )),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.asMap().entries.map((entry) {
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
      ]),
    );

  }

}