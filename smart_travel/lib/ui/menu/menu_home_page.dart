import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel/resource/font.dart';

import '../../api/base_api.dart';
import '../../model/menu_item.dart';
import '../../resource/button.dart';
import '../home/top_main/category_item.dart';


class MenuHomePage extends StatefulWidget {
  const MenuHomePage({Key? key}) : super(key: key);
  @override
  State<MenuHomePage> createState() => _MenuHomeState();

}

class _MenuHomeState extends State<MenuHomePage> {

  @override
  void initState() {
    super.initState();
    _getApi();

  }

  MenuSetting menus = MenuSetting();

  _getApi() async {
    final response = await ClientAPI.getInstance().getSettingMenuItem();
    setState(() {
      menus = response;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: BaseAppBar(
      //   title: "VIDEO",
      //   backgroundColor: AppColor.mainColor,
      // ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              _coverWidget(),
              Container(
                padding: EdgeInsets.only(left: 12, top: 40, right: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _weatherWidger(),
                    const SizedBox(height: 12),
                    _accountWidget(),
                    const SizedBox(height: 10,),
                    _packageWidget(),
                    const SizedBox(height: 10,),
                    _settingWidget()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _coverWidget() {
    return AspectRatio(
        aspectRatio: 375 / 193,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/menu_banner_morning.png"),
              fit: BoxFit.fill,
            ),
          ),
        )
    );
  }

  Widget _weatherWidger() {
    return Container(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Image.asset("assets/images/icon_no_avatar.png", fit: BoxFit.fill, height: 50, width: 50,),
                Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hà Nội, Việt Nam",
                        style: AppTextStyle.textStyle(color: Colors.white, fontSize: 14.0, fontStyle: FontStyle.bold),),
                      Text("Chúc bạn một ngày tốt lành!",
                        style: AppTextStyle.textStyle(color: Colors.white, fontSize: 14.0, fontStyle: FontStyle.regular),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _accountWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset("assets/images/icon_no_avatar.png", fit: BoxFit.fill, height: 40, width: 40,),
          Text("Quý khách chưa đăng nhập", style: AppTextStyle.textStyle(color: Colors.black, fontSize: 16, fontStyle: FontStyle.bold),),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text("Quý khách cần đăng nhập để sử dụng những tính năng của Smart Travel", textAlign: TextAlign.center,style: AppTextStyle.textStyle(color: Colors.black54, fontSize: 13, fontStyle: FontStyle.regular),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextButton(title: "Đăng nhập", width: 95, height: 36, cornerRadius: 18, onPressed: () {
                _getApi();
              },),
              SizedBox(width: 10,),
              AppTextButton(title: "Đăng ký", width: 95, height: 36, cornerRadius: 18),
            ],
          )
        ],
      ),
    );
  }

  Widget _packageWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tiện ích dành cho bạn", style: AppTextStyle.font16Bold.copyWith(color: Colors.black),),
          Container(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: menus.packageService.
              map((item) => CateogryItemWidget(height: 80, title: item.name, iconUrl: item.iconUrl,)).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _settingWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ListView.separated(
        itemCount: menus.settingApp.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 1, color: Colors.black12,);
        },
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 4),
        itemBuilder: (context, index) {
          final item = menus.settingApp[index];
          return SettingAppItem(title: item.name ?? "", iconUrl: item.iconUrl ?? "",);
        },
      ),
    );
  }

}

class SettingAppItem extends StatelessWidget {

  final String title;
  final String iconUrl;
  const SettingAppItem({Key? key, required this.title, required this.iconUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image.network(iconUrl, fit: BoxFit.fill, height: 30, width: 30,),
                const SizedBox(width: 10,),
                Text(title),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.black54,)
        ],),
    );
  }

}