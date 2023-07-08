

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
  var widgetOptions = <Widget>[].obs;
  final List<TabbarModel> tabbarItems = [
    const TabbarModel(imageName: "assets/images/tabbar_hightlight.png", name: "Khám phá", id: 0),
    const TabbarModel(imageName: "assets/images/tabbar_motor.png", name: "Khoảnh khắc", id: 1),
    const TabbarModel(imageName: "assets/images/tabbar_motor.png", name: "", id: 2),
    const TabbarModel(imageName: "assets/images/tabbar_car.png", name: "Video", id: 3),
    const TabbarModel(imageName: "assets/images/tabbar_search.png", name: "Menu", id: 4)
  ];

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void _initData() async {
    widgetOptions.value = tabbarItems.map((item) {
      if (item.id == 0) {
        return const ExplorePlacePage();
      }
      if (item.id == 1) {
        return MomentHomePage();
      }
      if (item.id == 3) {
        return VideoHomePage();
      }
      if (item.id == 4) {
        return const MenuHomePage();
      }
      return MainHomePage();
    }).toList();
  }
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

}