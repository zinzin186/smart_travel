import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../base/base_app_bar.dart';
import '../../resource/color.dart';
import '../../resource/font.dart';
import '../../routers/router_name.dart';
import '../main_category.dart';

class ExplorePlacePage extends StatefulWidget {
  const ExplorePlacePage({Key? key}) : super(key: key);
  @override
  State<ExplorePlacePage> createState() => _ExplorePlaceState();

}

class _ExplorePlaceState extends State<ExplorePlacePage> {

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
        titleWidget: Container(
          padding: EdgeInsets.only(left: 32, right: 32),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouterName.home);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                      ),
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        children: [
                          Text("Ha noi1"),
                          Icon(Icons.arrow_circle_down)
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container(
                    child: TextField(
                      readOnly: false,
                      // onTap: onTapSearch,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8, top: 10, right: 8, bottom: 10),
                          hintText: "Ban muon tim gi",
                          hintStyle: TextStyle(
                            color: Color(0xFF686565),
                          ),
                          border: InputBorder.none
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
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
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
                      itemCount: 6,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            children: <Widget>[
                              ExplorePlaceItem(),
                              Divider(), //                           <-- Divider
                            ]);
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

class ExplorePlaceItem extends StatelessWidget {

  const ExplorePlaceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              height: 197,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_home_favorite_location.png"),
              fit: BoxFit.fill,
            ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                      left: 14,
                      child: Container(
                    child: Row(
                      children: [
                        Image.asset("assets/images/btn_home_search.png", fit: BoxFit.fill, width: 28, height: 28,),
                        SizedBox(width: 4,),
                        Image.asset("assets/images/btn_home_search.png", fit: BoxFit.fill, width: 28, height: 28,)
                      ],
                    ),
                  )),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        child: Image.asset("assets/images/btn_home_search.png", fit: BoxFit.fill, width: 50, height: 50,),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: 6,),
          Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Day la noi dung sdfds fdsfds fdsfds dfsdf aefas fdsfd", textAlign: TextAlign.left,),
                Container(child: Row(
                  children: [
                    Image.asset("assets/images/ic-material-my-location.png", width: 14, height: 14,),
                    SizedBox(width: 2,),
                    Text("Cach ban 180 m", style: AppTextStyle.font12Regular.copyWith(color: Colors.grey))
                  ],
                ),),
                Container(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                      children: [
                        Image.asset("assets/images/icon-metro-location.png", width: 14, height: 14,),
                        SizedBox(width: 2,),
                        Text("Quan Hoang Mai Ha noi1", style: AppTextStyle.font12Regular.copyWith(color: Colors.grey),),
                      ],
                    ),),
                    SizedBox(
                      height: 30,
                      child: TextButton(onPressed: () {
                        print("fdsfdfd");
                      },
                        style: ButtonStyle(
                            alignment: Alignment.centerRight, // <-- had to set alignment
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.zero, // <-- had to set padding to zero
                            )
                        ), child: Text("Xem ban do", style: AppTextStyle.font14Semi.copyWith(color: Color(0xFF06575D3)),),
                      )
                    )
                  ],
                ),),
                Divider(color: Colors.black26, height: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  PlaceOpenTimeItem(),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            color: Colors.green
                          ),
                      ),
                      SizedBox(width: 4,),
                      Text("Open"),
                    ],
                  )
                ],)
              ],
            ),
          )

        ],
      ),
    );
  }


}

class PlaceOpenTimeItem extends StatelessWidget {

  const PlaceOpenTimeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset("assets/images/btn_home_search.png", fit: BoxFit.fill, width: 20, height: 20,),
          SizedBox(width: 4,),
          Column(
            children: [
              Text("T2 - CN"),
              Container(
                  padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(width: 1.0, color: Colors.black38)
                ),
                child: Text("07:00 - 21:00"),
              )
            ],
          )
        ],
      ),
    );
  }
}