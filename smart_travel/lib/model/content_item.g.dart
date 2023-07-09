// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentItemModel _$ContentItemModelFromJson(Map<String, dynamic> json) =>
    ContentItemModel(
      id: json['id'] as String? ?? "",
      contentType: json['content_type'] as String?,
      name: json['name'] as String? ?? "",
      regionName: json['region_name'] as String?,
      thumb: json['logo_url'] as String?,
      viewCount: json['view_count'] as int? ?? 0,
      categoryName: json['category_name'] as String?,
      commentCount: json['comment_count'] as int? ?? 0,
      detailLink: json['detail_link'] as String?,
      distance: json['distance'] as int?,
      rate: json['rate'] as int? ?? 0,
      created: json['created'] as num?,
    );

Map<String, dynamic> _$ContentItemModelToJson(ContentItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content_type': instance.contentType,
      'name': instance.name,
      'region_name': instance.regionName,
      'logo_url': instance.thumb,
      'view_count': instance.viewCount,
      'category_name': instance.categoryName,
      'comment_count': instance.commentCount,
      'detail_link': instance.detailLink,
      'distance': instance.distance,
      'rate': instance.rate,
      'created': instance.created,
    };
