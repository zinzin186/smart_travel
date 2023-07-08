import 'package:json_annotation/json_annotation.dart';
import 'menu_item.dart';
part 'home_block.g.dart';

@JsonSerializable()
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
    this.menus
  });

  final String name;
  final String? link;
  @JsonKey(name: "icon_url")
  final String iconUrl;
  final String? id;
  final String? code;
  final String? placeholder;
  @JsonKey(name: "content_link")
  final String? contentLink;
  @JsonKey(name: "background_urls")
  final List<String>? backgroundUrls;
  final String? description;
  final String? link_home_deal;
  @JsonKey(name: "menus")
  final List<MenuModel>? menus;
  @JsonKey(name: "items")
  final List<MenuModel>? children;

  factory HomeBlockModel.fromJson(Map<String, dynamic> data) =>
      _$HomeBlockModelFromJson(data);

  Map<String, dynamic> toJson() => _$HomeBlockModelToJson(this);


}