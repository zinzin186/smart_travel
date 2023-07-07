import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel/ui/home/discovery/discovery_home.dart';
import 'package:smart_travel/ui/home/top_main/top_main_home.dart';
import 'package:smart_travel/ui/home/voucher/voucher_home.dart';

import '../../api/base_api.dart';
import '../../base/base_app_bar.dart';
import '../../model/home_block.dart';
import 'ads/ads_home.dart';
import 'experience/experience_home.dart';
import 'favorite/favorite_home.dart';


class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);
  @override
  State<MainHomePage> createState() => _MainHomeState();

}

class _MainHomeState extends State<MainHomePage> {

  List<HomeBlockModel> homeBlocks = [];

  @override
  void initState() {
    super.initState();
    _getApi();

  }

  _getApi() async {
    final response = await ClientAPI.getInstance().getHomeBlocks();
    setState(() {
      homeBlocks = response;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(
        title: "w",
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              final block = homeBlocks[index];
              final code = block.code;
              if (code == "APP_SEARCH_BOX") {
                print("adddd");
                print(block.backgroundUrls?.length);
                return TopMainHomeWidget(block: block, onTapSearch: () {
                  print("tâppp");
                  _getApi();
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
              return SizedBox();
            },
            separatorBuilder: (context, position) {
              return Container(color: Color(0xFFECE9F1), height: 10,);
            },
            itemCount: homeBlocks.length),
      ),
    );
  }


}