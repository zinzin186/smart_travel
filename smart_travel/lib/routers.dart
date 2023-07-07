import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_travel/ui/moment/moment_home.dart';

class Routers {
  static const String root = "/";
  static const String moment = "/moment";


  static void pushAndReplaceUntil(String routeName, String untilRoute,
      {arguments}) {
    Get.until(ModalRoute.withName(untilRoute));
    Get.toNamed(routeName, arguments: arguments);

  }

  static void pushAndReplaceRoot(String routeName, {arguments}) {
    Get.offAllNamed(routeName, arguments: arguments);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.moment:
        return GetPageRoute(
            settings: settings,
            page: () => MomentHomePage(),
            transition: Transition.cupertino);
    }
    return GetPageRoute(
        settings: settings,
        page: () => MomentHomePage(),
        transition: Transition.cupertino);
  }
}