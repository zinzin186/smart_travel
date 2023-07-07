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
  final String? contentType;
  final String name;
  final String? regionName;
  final String? thumb;
  final int viewCount;
  final String? categoryName;
  final int commentCount;
  final String? detailLink;
  final int? distance;
  final int rate;
  final num? created;


  factory ContentItemModel.fromJson(Map<String, dynamic>? json) => ContentItemModel(
    id: json?["id"] ?? "",
    contentType: json?["content_type"],
    name: json?["name"] ?? "",
    regionName: json?["region_name"],
    thumb: json?["logo_url"],
    viewCount: json?["view_count"] ?? "",
    categoryName: json?["category_name"],
    commentCount: json?["comment_count"] ?? 0,
    detailLink: json?["detail_link"],
    distance: json?["distance"],
    rate: json?["standard_rate"] ?? 0,
    created: json?["created"],
  );

}