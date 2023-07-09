

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/base_controller.dart';
import '../../model/tabbar_model.dart';
import '../explore/explore_place.dart';
import '../video/video_home_page.dart';
import '../home/main_home.dart';
import '../moment/moment_home.dart';
import '../menu/menu_home_page.dart';


class TabbarController extends BaseController {
  RxInt selectedIndex = 2.obs;
  final List<TabbarModel> tabbarItems = [
    const TabbarModel(imageName: "assets/images/tabbar_hightlight.png", name: "Khám phá", id: 0, widget: ExplorePlacePage()),
    const TabbarModel(imageName: "assets/images/tabbar_motor.png", name: "Khoảnh khắc", id: 1, widget: MomentHomePage()),
    const TabbarModel(imageName: "assets/images/tabbar_motor.png", name: "", id: 2, widget: MainHomePage()),
    const TabbarModel(imageName: "assets/images/tabbar_car.png", name: "Video", id: 3, widget: VideoHomePage()),
    const TabbarModel(imageName: "assets/images/tabbar_search.png", name: "Menu", id: 4, widget: MenuHomePage())
  ];

  @override
  void onInit() {
    super.onInit();
    // _initData();
  }

  void _initData() async {
  }
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  List<Widget> get widgetOptions => tabbarItems.map((e) => e.widget).toList();

}