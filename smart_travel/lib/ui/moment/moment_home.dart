

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:smart_travel/resource/color.dart';
import 'package:smart_travel/resource/font.dart';
import 'package:smart_travel/ui/moment/post_moment_item.dart';
import '../../base/base_app_bar.dart';
import 'moment_home_controller.dart';

class MomentHomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => MomentHomeController());
  }
}

class MomentHomePage extends GetView<MomentHomeController> {

  static List<Widget> images = [
    Image.asset("assets/images/bg_home_favorite_location.png", fit: BoxFit.cover, width: 300, height: 300,),
    Image.asset("assets/images/bg_home_favorite_location.png", fit: BoxFit.cover, width: 300, height: 300,),
    Image.asset("assets/images/bg_home_favorite_location.png", fit: BoxFit.cover, width: 300, height: 300,),
    Image.asset("assets/images/bg_home_favorite_location.png", fit: BoxFit.cover, width: 300, height: 300,),
    Image.asset("assets/images/bg_home_favorite_location.png", fit: BoxFit.cover, width: 300, height: 300,),
  ];


  const MomentHomePage({super.key});

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
                  const Expanded(child: TextField(
                    readOnly: false,
                    // onTap: onTapSearch,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8, top: 10, right: 8, bottom: 10),
                        hintText: "Ban muon tim gi",
                        hintStyle: TextStyle(
                          color: Color(0xFF686565),
                        ),
                        border: InputBorder.none
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xffF2F2F2),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 400,
              padding: EdgeInsets.only(top: 32),
              width: double.infinity,
              decoration: const BoxDecoration(
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
                        const Text("Khoảnh khắc", textAlign: TextAlign.right, style: AppTextStyle.font25Bold,),
                        const SizedBox(width: 8,),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                          decoration: const BoxDecoration(
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
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    child: Text("Blog chia se ve nhung kinh nghiem khi di du lich voi trai nghiem thuc te va day thu vi",
                      textAlign: TextAlign.center, style: AppTextStyle.font12Regular.copyWith(color: Colors.red),),
                  ),
                  const SizedBox(height: 20,),
                  CarouselSlider(
                    items: images,
                    carouselController: controller.carouselController,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.5,
                        // enlargeFactor: 0.1,
                        // aspectRatio: 1.5,
                        onPageChanged: (index, reason) {
                          // setState(() {
                          //   _current = index;
                          // });
                        }),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: GridView(shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 2,
                ),
                children: const [
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