

import 'dart:convert';

import 'menu_item.dart';

class HomeBlockModel {
  HomeBlockModel({
    this.name = "",
    this.link,
    this.iconUrl = "",
    this.id,
    this.code,
    this.placeholder,
    this.contentLink,
    this.backgroundUrls,
    this.description,
    this.link_home_deal,
    this.children,
  });

  final String name;
  final String? link;
  final String iconUrl;
  final String? id;
  final String? code;
  final String? placeholder;
  final String? contentLink;
  final List<String>? backgroundUrls;
  final String? description;
  final String? link_home_deal;
  final List<MenuModel>? children;



  factory HomeBlockModel.fromRawJson(String str) => HomeBlockModel.fromJson(json.decode(str));

  factory HomeBlockModel.fromJson(Map<String, dynamic>? json) => HomeBlockModel(
      name: json?["name"] ?? "",
      link: json?["link"],
      iconUrl: json?["icon_url"] ?? "",
      id: json?["id"],
      code: json?["code"],
      placeholder: json?["placeholder"] ?? "",
      description: json?["description"],
      link_home_deal: json?["link_home_deal"],
      contentLink: json?["content_link"],
      backgroundUrls: json?["background_urls"] == null ? null : (json?["background_urls"] as List).map((e) => e.toString()).toList(),
      children: json?["menus"] == null ?
      (json?["items"] == null ? null : (json?["items"] as List).map((e) => MenuModel.fromJson(e as Map<String, dynamic>))
          .toList())
          : (json?["menus"] as List).map((e) => MenuModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  );

}