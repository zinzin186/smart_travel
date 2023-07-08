// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBlockModel _$HomeBlockModelFromJson(Map<String, dynamic> json) =>
    HomeBlockModel(
      name: json['name'] as String? ?? "",
      link: json['link'] as String?,
      iconUrl: json['icon_url'] as String? ?? "",
      id: json['id'] as String?,
      code: json['code'] as String?,
      placeholder: json['placeholder'] as String?,
      contentLink: json['content_link'] as String?,
      backgroundUrls: (json['background_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      link_home_deal: json['link_home_deal'] as String?,
      children: (json['items'] as List<dynamic>?)
          ?.map((e) => MenuModel.fromJson(e as Map<String, dynamic>?))
          .toList(),
      menus: (json['menus'] as List<dynamic>?)
          ?.map((e) => MenuModel.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$HomeBlockModelToJson(HomeBlockModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'link': instance.link,
      'icon_url': instance.iconUrl,
      'id': instance.id,
      'code': instance.code,
      'placeholder': instance.placeholder,
      'content_link': instance.contentLink,
      'background_urls': instance.backgroundUrls,
      'description': instance.description,
      'link_home_deal': instance.link_home_deal,
      'menus': instance.menus,
      'items': instance.children,
    };
