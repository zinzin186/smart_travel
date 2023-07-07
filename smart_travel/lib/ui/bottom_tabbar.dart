

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/tabbar_model.dart';
import 'explore/explore_place.dart';
import 'video/video_home_page.dart';
import 'home/main_home.dart';
import 'moment/moment_home.dart';
import 'menu/menu_home_page.dart';

class BottomTabbarWidget extends StatefulWidget {
  const BottomTabbarWidget({Key? key}) : super(key: key);
  @override
  State<BottomTabbarWidget> createState() => _BottomTabbarState();

}

class _BottomTabbarState extends State<BottomTabbarWidget> {

  List<Widget> _widgetOptions = [];
  int _selectedIndex = 2;

  final List<TabbarModel> tabbarItems = [
    TabbarModel(imageName: "assets/images/tabbar_hightlight.png", name: "Khám phá", id: 0),
    TabbarModel(imageName: "assets/images/tabbar_motor.png", name: "Khoảnh khắc", id: 1),
    TabbarModel(imageName: "assets/images/tabbar_motor.png", name: "", id: 2),
    TabbarModel(imageName: "assets/images/tabbar_car.png", name: "Video", id: 3),
    TabbarModel(imageName: "assets/images/tabbar_search.png", name: "Menu", id: 4)
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgetOptions = tabbarItems.map((item) {
      if (item.id == 0) {
        return const ExplorePlacePage();
      }
      if (item.id == 1) {
        return const MomentHomePage();
      }
      if (item.id == 3) {
        return VideoHomePage();
      }
      if (item.id == 4) {
        return MenuHomePage();
      }
      return const MainHomePage();
    }).toList();
    // _widgetOptions[3] = MainHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: tabbarItems.map((item) => BottomNavigationBarItem(
            icon: Image.asset(item.imageName, height: 20, width: 20, color: _selectedIndex == item.id ? Colors.red : Colors.grey,),
            label: item.name,
          ),).toList(),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        )
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

}