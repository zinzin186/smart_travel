
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_travel/ui/moment/moment_home_controller.dart';
import 'package:smart_travel/ui/tabbar/tabbar_controller.dart';
import '../home/home_controller.dart';

class TabbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabbarController());
    Get.lazyPut(() => MainHomeController());
    Get.lazyPut(() => MomentHomeController());
  }
}

class AppBottomTabbarWidget extends GetView<TabbarController> {
   const AppBottomTabbarWidget({Key? key}) : super(key: key);

   static final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.widgetOptions.elementAt(controller.selectedIndex.value)),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
          items: controller.tabbarItems.map((item) => BottomNavigationBarItem(
            icon: Image.asset(item.imageName, height: 20, width: 20, color: controller.selectedIndex.value == item.id ? Colors.red : Colors.grey,),
            label: item.name,
          ),).toList(),
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          onTap: controller.onItemTapped,
        ) ),
      floatingActionButton: Container(
        width: 70, height: 100,
        padding: const EdgeInsets.only(top: 30),
        child: InkWell(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/tabbar_sentrip.png"),
                      fit: BoxFit.fill
                  )
              )
          ),
          onTap: () {
            controller.onItemTapped(2);
          },
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}