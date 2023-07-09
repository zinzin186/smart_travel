import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel/routers/router_name.dart';
import 'package:smart_travel/ui/home/discovery/discovery_home.dart';
import 'package:smart_travel/ui/home/top_main/top_main_home.dart';
import 'package:smart_travel/ui/home/voucher/voucher_home.dart';
import 'package:get/get.dart';

import '../../base/base_app_bar.dart';
import 'ads/ads_home.dart';
import 'experience/experience_home.dart';
import 'favorite/favorite_home.dart';
import 'home_controller.dart';

class MainHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainHomeController());
  }
}

class MainHomePage extends GetView<MainHomeController> {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "w",
      ),
      body: Obx(
          () => ListView.separated(
              itemBuilder: (context, index) {
                final block = controller.homeBlocks[index];
                final code = block.code;
                if (code == "APP_SEARCH_BOX") {
                  return TopMainHomeWidget(block: block, onTapSearch: () {
                    Get.toNamed(RouterName.moment);
                  },);
                }
                if (code == "APP_VOUCHER_NOW") {
                  return VoucherHomeWidget(block: block,);
                }
                if (code == "APP_TOP_EXPERIENCE") {
                  return ExperienceHomeWidget(block: block);
                }
                if (code == "APP_FAVORITE_DESTINATION") {
                  return FavoriteHomeWidget(block: block);
                }
                if (code == "APP_PROMOTION_PARTNER"){
                  return AdsBannerWidget(block: block);
                }
                if (code == "APP_DISCOVER") {
                  return DiscoveryHomeWidget(block: block);
                }
                return const SizedBox();
              },
              separatorBuilder: (context, position) {
                return Container(color: const Color(0xFFECE9F1), height: 10,);
              },
              itemCount: controller.homeBlocks.length)
      ),
    );
  }


}