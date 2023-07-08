

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:smart_travel/routers/router_name.dart';
import 'package:smart_travel/ui/home/main_home.dart';
import 'package:smart_travel/ui/tabbar/app_bottom_tabbar.dart';

import '../ui/moment/moment_home.dart';

class Pages {
  static List<GetPage> pages = [
    GetPage(
        name: RouterName.moment,
        page: () => MomentHomePage(),
        binding: MomentHomeBinding()),
    GetPage(
        name: RouterName.home,
        page: () => const MainHomePage(),
        binding: MainHomeBinding()),
    GetPage(
        name: RouterName.mainTabbar,
        page: () => const AppBottomTabbarWidget(),
        binding: TabbarBinding()),
  ];
}