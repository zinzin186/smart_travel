import 'package:json_annotation/json_annotation.dart';
part 'content_item.g.dart';

@JsonSerializable()
class ContentItemModel {

  ContentItemModel({
    this.id = "",
    this.contentType,
    this.name = "",
    this.regionName,
    this.thumb,
    this.viewCount = 0,
    this.categoryName,
    this.commentCount = 0,
    this.detailLink,
    this.distance,
    this.rate = 0,
    this.created
  });

  final String id;
  @JsonKey(name: "content_type")
  final String? contentType;
  final String name;
  @JsonKey(name: "region_name")
  final String? regionName;
  @JsonKey(name: "logo_url")
  final String? thumb;
  @JsonKey(name: "view_count")
  final int viewCount;
  @JsonKey(name: "category_name")
  final String? categoryName;
  @JsonKey(name: "comment_count")
  final int commentCount;
  @JsonKey(name: "detail_link")
  final String? detailLink;
  final int? distance;
  final int rate;
  final num? created;


  // factory ContentItemModel.fromJson(Map<String, dynamic>? json) => ContentItemModel(
  //   id: json?["id"] ?? "",
  //   contentType: json?["content_type"],
  //   name: json?["name"] ?? "",
  //   regionName: json?["region_name"],
  //   thumb: json?["logo_url"],
  //   viewCount: json?["view_count"] ?? "",
  //   categoryName: json?["category_name"],
  //   commentCount: json?["comment_count"] ?? 0,
  //   detailLink: json?["detail_link"],
  //   distance: json?["distance"],
  //   rate: json?["standard_rate"] ?? 0,
  //   created: json?["created"],
  // );

  factory ContentItemModel.fromJson(Map<String, dynamic> data) =>
      _$ContentItemModelFromJson(data);

  Map<String, dynamic> toJson() => _$ContentItemModelToJson(this);

}