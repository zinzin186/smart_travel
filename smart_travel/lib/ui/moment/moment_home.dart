

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smart_travel/resource/color.dart';
import 'package:smart_travel/resource/font.dart';
import 'package:smart_travel/ui/moment/post_moment_item.dart';
import '../../base/base_app_bar.dart';

class MomentHomePage extends StatefulWidget {
  const MomentHomePage({Key? key}) : super(key: key);
  @override
  State<MomentHomePage> createState() => _MomentHomeState();

}

class _MomentHomeState extends State<MomentHomePage> {


  final List<Widget> images = [
    Image.asset("assets/images/bg_home_favorite_location.png", fit: BoxFit.cover, width: 300, height: 300,),
    Image.asset("assets/images/bg_home_favorite_location.png", fit: BoxFit.cover, width: 300, height: 300,),
    Image.asset("assets/images/bg_home_favorite_location.png", fit: BoxFit.cover, width: 300, height: 300,),
    Image.asset("assets/images/bg_home_favorite_location.png", fit: BoxFit.cover, width: 300, height: 300,),
    Image.asset("assets/images/bg_home_favorite_location.png", fit: BoxFit.cover, width: 300, height: 300,),
    // Image.asset("assets/images/bg_moment.jpg", fit: BoxFit.fill, width: 100, height: 300,),
    // Image.asset("assets/images/bg_moment.jpg", fit: BoxFit.fill, width: 100, height: 300,),
    // Image.asset("assets/images/bg_moment.jpg", fit: BoxFit.fill, width: 100, height: 300,),
    // Image.asset("assets/images/bg_moment.jpg", fit: BoxFit.fill, width: 100, height: 300,),
    // Image.asset("assets/images/bg_moment.jpg", fit: BoxFit.fill, width: 100, height: 300,),
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backgroundColor: AppColor.mainColor,
        titleWidget: Container(
          padding: EdgeInsets.only(left: 32, right: 32),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                    ),
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      children: [
                        Text("Ha noi", style: AppTextStyle.font12Regular.copyWith(color: Colors.black26),),
                        Icon(Icons.arrow_circle_down)
                      ],
                    ),
                  ),
                  Expanded(child: Container(
                    child: TextField(
                      readOnly: false,
                      // onTap: onTapSearch,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8, top: 10, right: 8, bottom: 10),
                          hintText: "Ban muon tim gi",
                          hintStyle: TextStyle(
                            color: Color(0xFF686565),
                          ),
                          border: InputBorder.none
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xffF2F2F2),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 400,
              padding: EdgeInsets.only(top: 32),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_moment.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Khoảnh khắc", textAlign: TextAlign.right, style: AppTextStyle.font25Bold,),
                        SizedBox(width: 8,),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/bg_label.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Text("Du lịch", style: AppTextStyle.font25Bold.copyWith(color: Colors.white)),
                        )
                      ],),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    child: Text("Blog chia se ve nhung kinh nghiem khi di du lich voi trai nghiem thuc te va day thu vi",
                      textAlign: TextAlign.center, style: AppTextStyle.font12Regular.copyWith(color: Colors.red),),
                  ),
                  SizedBox(height: 20,),
                  CarouselSlider(
                    items: images,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.5,
                        // enlargeFactor: 0.1,
                        // aspectRatio: 1.5,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: GridView(shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 2,
                ),
                children: [
                  PostMomentItemWidget(),
                  PostMomentItemWidget(),
                  PostMomentItemWidget(),
                  PostMomentItemWidget(),
                  PostMomentItemWidget(),
                  PostMomentItemWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
