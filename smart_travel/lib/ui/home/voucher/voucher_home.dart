import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel/model/home_block.dart';
import 'package:smart_travel/resource/font.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../base_widget_home.dart';

class VoucherHomeWidget extends BaseBlocHomeWidget {

  const VoucherHomeWidget({Key? key, required HomeBlockModel block}) : super(key: key, block: block);

  @override
  State<VoucherHomeWidget> createState() => _VoucherHomeState();

}

class _VoucherHomeState extends BaseBlocHomeState<VoucherHomeWidget> {

  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];
  @override
  Widget mainUI() {
    return Container(
      height: 200,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            // heightFactor: 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: CarouselSlider(
                items: imgList
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
              ),
            ),
          ),
          SizedBox(width: 10,),
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset("assets/images/banners/banner_home_fix2.png", fit: BoxFit.fill, height: double.infinity,
                        width: double.infinity,),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset("assets/images/banners/banner_home_fix1.png" , fit: BoxFit.fill, height: double.infinity,
                        width: double.infinity,),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }

}