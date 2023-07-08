import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_travel/routers/router_name.dart';
import 'package:smart_travel/ui/home/main_home.dart';
import 'package:smart_travel/ui/moment/moment_home.dart';
import 'package:smart_travel/ui/tabbar/app_bottom_tabbar.dart';

class Routers {

  static void pushAndReplaceUntil(String routeName, String untilRoute,
      {arguments}) {
    Get.until(ModalRoute.withName(untilRoute));
    Get.toNamed(routeName, arguments: arguments);

  }

  static void pushAndReplaceRoot(String routeName, {arguments}) {
    Get.offAllNamed(routeName, arguments: arguments);
  }

  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case RouterName.moment:
  //       return GetPageRoute(
  //           settings: settings,
  //           page: () => MomentHomePage(),
  //           binding: MomentHomeBinding(),
  //           transition: Transition.cupertino);
  //     case RouterName.home:
  //       return GetPageRoute(
  //           settings: settings,
  //           page: () => const MainHomePage(),
  //           binding: MainHomeBinding(),
  //           transition: Transition.cupertino);
  //     default:
  //       return GetPageRoute(
  //           settings: settings,
  //           page: () => const AppBottomTabbarWidget(),
  //           binding: TabbarBinding(),
  //           transition: Transition.cupertino);
  //   }
  // }
}