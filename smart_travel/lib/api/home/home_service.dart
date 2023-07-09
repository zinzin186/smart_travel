

import 'dart:convert';

import '../../model/base/list_api_response.dart';
import '../../model/content_item.dart';
import '../../model/home_block.dart';
import '../../model/menu_item.dart';
import '../../model/voucher.dart';
import '../api.dart';
import '../constants.dart';

class HomeService {
  final ApiService _service = ApiService(Constants.contentDomain);

  Future<ListAPIResponse<HomeBlockModel>> getHomeBlocks(
      {String nextLink = '', int limit = 10}) async {
    final response =
    await _service.getData(endPoint: "/V3/home");
    return ListAPIResponse.fromJson(response.data);
  }

  Future<MenuSetting> getSettingMenuItem() async {
    var result = await _service.getData(endPoint: "/V3/setting");
    final data = result.data["data"]["menus"]["left"] as List;
    var dataList = data.map((dynamic i) =>
        MenuModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final MenuSetting menu = MenuSetting();
    for (var element in dataList) {
      if (element.code == "APP_MAIN_HEADER_BOOKING") {
        menu.itemMenu.add(element);
      } else if (element.code == "APP_MAIN_FOOTER_BOOKING") {
        menu.settingApp.add(element);
      } else {
        menu.packageService.add(element);
      }
    }
    return menu;
  }

  Future<ListAPIResponse<MenuModel>> getRegionsList(String contentLink) async {
    var result = await _service.getContent(contentLink: contentLink);
    return ListAPIResponse.fromJson(result.data);
  }

  Future<ListAPIResponse<VoucherModel>> getAdsList(String contentLink) async {
    var result = await _service.getContent(contentLink: contentLink);
    return ListAPIResponse.fromJson(result.data);
  }

  Future<ListAPIResponse<ContentItemModel>> getDiscoveryItemList(String contentLink) async {
    var result = await _service.getContent(contentLink: contentLink);
    return ListAPIResponse.fromJson(result.data);
  }



  Map<String, dynamic> _parseJson(var response) {
    Map<String, dynamic> json = {};
    if (response.data is String) {
      json = jsonDecode(response.data);
    } else if (response.data is Map) {
      json = response.data;
    }
    return json;
  }


}