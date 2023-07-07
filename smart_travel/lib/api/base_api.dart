import 'package:dio/dio.dart';
import 'package:smart_travel/model/voucher.dart';

import '../model/content_item.dart';
import '../model/home_block.dart';
import '../model/menu_item.dart';


class ClientAPI {
  static final ClientAPI _instance = ClientAPI();

  static ClientAPI getInstance() {
    return _instance;
  }
  static Dio? dio;
  Future<MenuSetting> getSettingMenuItem() async {
    var _result = await Dio().get(
        "https://api-testing.sentrip.vn/V3/setting?lang_code=vi");

    final data = _result.data["data"]["menus"]["left"] as List;
    var dataList = data.map((dynamic i) =>
        MenuModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final MenuSetting menu = MenuSetting();

    dataList.forEach((element) {
      if (element.code == "APP_MAIN_HEADER_BOOKING") {
        menu.itemMenu.add(element);
      } else if (element.code == "APP_MAIN_FOOTER_BOOKING") {
        menu.settingApp.add(element);
      } else {
        menu.packageService.add(element);
      }
    });
    return menu;
  }

  Future<List<HomeBlockModel>> getHomeBlocks() async {
    final result = await Dio().get(
        "https://api-testing.sentrip.vn/V3/home?lang_code=vi");
    final data = result.data["data"] as List;
    var dataList = data.map((dynamic i) => HomeBlockModel.fromJson(i as Map<String, dynamic>)).toList();
    return dataList;
  }

  Future<List<MenuModel>> getRegionsList(String contentLink) async {
    final result = await Dio().get(
        contentLink);
    final data = result.data["data"]["items"] as List;
    var dataList = data.map((dynamic i) => MenuModel.fromJson(i as Map<String, dynamic>)).toList();
    return dataList;
  }

  Future<List<VoucherModel>> getAdsList(String contentLink) async {
    final result = await Dio().get(
        contentLink);
    final data = result.data["data"]["items"] as List;
    var dataList = data.map((dynamic i) => VoucherModel.fromJson(i as Map<String, dynamic>)).toList();
    return dataList;
  }

  Future<List<ContentItemModel>> getDiscoveryItemList(String contentLink) async {
    print("day la url$contentLink");
    final result = await Dio().get(
        contentLink);
    final data = result.data["data"]["items"] as List;
    var dataList = data.map((dynamic i) => ContentItemModel.fromJson(i as Map<String, dynamic>)).toList();
    return dataList;
  }
}