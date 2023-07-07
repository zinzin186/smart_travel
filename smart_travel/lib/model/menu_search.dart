
class MenuSearchModel {

  MenuSearchModel({
    this.name = "",
    this.link,
    this.iconUrl = "",
    this.id,
    this.code,
  });

  final String name;
  final String? link;
  final String iconUrl;
  final String? id;
  final String? code;


  factory MenuSearchModel.fromJson(Map<String, dynamic>? json) => MenuSearchModel(
    name: json?["name"] ?? "",
    link: json?["link"],
    iconUrl: json?["icon_url"] ?? "",
    id: json?["id"],
    code: json?["code"],
  );
}