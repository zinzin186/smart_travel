import 'dart:core';
import 'dart:convert';

class MenuSetting {
List<MenuModel> itemMenu = [];
List<MenuModel> packageService = [];
List<MenuModel> settingApp = [];

}

class MenuModel {

  MenuModel({
    this.name = "",
    this.link,
    this.iconUrl = "",
    this.id,
    this.code,
    this.bannerUrl,
    this.contentLink
  });

  final String name;
  final String? link;
  final String iconUrl;
  final String? id;
  final String? code;
  final String? bannerUrl;
  final String? contentLink;

  factory MenuModel.fromRawJson(String str) => MenuModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MenuModel.fromJson(Map<String, dynamic>? json) => MenuModel(
    name: json?["name"] ?? "",
    link: json?["link"],
    iconUrl: json?["icon_url"] ?? "",
    id: json?["id"],
    code: json?["code"],
    bannerUrl: json?["banner_url"],
    contentLink: json?["content_link"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "link": link,
    "status": iconUrl,
    "icon_url": iconUrl,
    "id": id,
  };
}
