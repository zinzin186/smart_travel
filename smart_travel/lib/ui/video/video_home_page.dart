import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../base/base_app_bar.dart';
import '../../resource/color.dart';
import '../../resource/font.dart';
import '../main_category.dart';

class VideoHomePage extends StatefulWidget {
  const VideoHomePage({Key? key}) : super(key: key);
  @override
  State<VideoHomePage> createState() => _VideoHomeState();

}

class _VideoHomeState extends State<VideoHomePage> {

  List<Tab> tabs = <Tab>[
    // Tab(text: 'Xe máy', key: Key(MainCategory.motor.code)),
    // Tab(text: 'Ô tô', key: Key(Vehicle.car.code)),
  ];

  @override
  void initState() {
    super.initState();
    tabs = [
      MainCategory.eat,
      MainCategory.stay,
      MainCategory.go,
      MainCategory.play
    ].map((item) => Tab(text: item.title, key: Key(item.code))).toList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(
        title: "VIDEO",
        backgroundColor: AppColor.mainColor,
      ),
      body: DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: AppBar(
                titleSpacing: 0,
                backgroundColor: Colors.white,
                bottom: TabBar(
                  indicatorColor: Colors.red,
                  labelColor: Colors.red,
                  labelStyle: AppTextStyle.naviTitle,
                  unselectedLabelColor: Colors.black54,
                  unselectedLabelStyle: AppTextStyle.contentViolation,
                  tabs: tabs,
                ),
              ),
            ),
            body: TabBarView(
              children: tabs.map((Tab tab) {
                // final Vehicle vehicle = tab.key == Key(Vehicle.motor.code) ? Vehicle.motor : Vehicle.car;
                return Center(
                  child: Container(
                    color: Colors.white,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
                      itemCount: 6,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            children: <Widget>[
                              VideoHomeItem(),
                              // Divider(), //                           <-- Divider
                            ]);
                      },
                      separatorBuilder: (context, position) {
                        return Container(color: Color(0xFFECE9F1), height: 10,);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }),
      ),
    );
  }

}

class VideoHomeItem extends StatelessWidget {

  const VideoHomeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              height: 197,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_home_favorite_location.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Image.asset("assets/images/ic_player_white.png",height: 35, width: 35,),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Row(
            children: [
              Image.asset("assets/images/ic_player_green.png", width: 12, height: 9,),
              SizedBox(width: 2,),
              Text("Video", style: AppTextStyle.font12Regular.copyWith(color: Colors.grey))
            ],
          ),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Day la noi dung fdsfds ihuh= aefas fdsfd", textAlign: TextAlign.left, style: AppTextStyle.textStyle(color: Colors.black, fontSize: 14, fontStyle: FontStyle.medium),),
                SizedBox(height: 4,),
                const Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    TagItemWidget(tagName: "dfdfdf sdsf"),
                    TagItemWidget(tagName: "dfdfdf sdsf adj jds"),
                    TagItemWidget(tagName: "dfdfdf sdsf adds"),
                    TagItemWidget(tagName: "dfdfdf sdsf adds"),
                  ],
                )

              ],
            ),
          ),
          Divider(color: Colors.black26, height: 1,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoInfoItem(),
                Container(
                  child: Row(
                    children: [
                      Image.asset("assets/images/btn_home_search.png", fit: BoxFit.fill, width: 20, height: 20,),
                      SizedBox(width: 4,),
                      Text("T2 - CN"),
                    ],
                  ),
                ),
              ],),
          )
        ],
      ),
    );
  }


}

class VideoInfoItem extends StatelessWidget {

  const VideoInfoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Row(
        children: [
          Image.asset("assets/images/btn_home_search.png", fit: BoxFit.fill, width: 20, height: 20,),
          SizedBox(width: 4,),
          Text("T2 - CN"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Container(
                width: 2,
                height: 20,
                color: Colors.black38,
              ),
            ),
          ),
          Image.asset("assets/images/btn_home_search.png", fit: BoxFit.fill, width: 20, height: 20,),
          SizedBox(width: 4,),
          Text("135"),
        ],
      ),
    );
  }
}

class TagItemWidget extends StatelessWidget {
  final String tagName;
  const TagItemWidget({Key? key, title, required this.tagName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color:  Color(0xFF487ADC).withOpacity(0.47),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(tagName, style: AppTextStyle.textStyle(color: AppColor.blueTag, fontSize: 12, fontStyle: FontStyle.regular)),
    );
  }


}