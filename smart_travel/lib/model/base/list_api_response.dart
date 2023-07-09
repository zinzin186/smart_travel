import 'dart:convert';
import 'base_parser_json.dart';

ListAPIResponse assigneeFromJson(String str) =>
    ListAPIResponse.fromJson(json.decode(str));

String assigneeToJson(ListAPIResponse data) => json.encode(data.toJson());

class ListAPIResponse<T> {
  ListAPIResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  final String code;
  final String message;
  final List<T> data;

  factory ListAPIResponse.fromJson(Map<String, dynamic> json) =>
      ListAPIResponse(
        code: json["code"] ?? "",
        message: json["message"] ?? "",
        data: json["data"] is List ?
        List<T>.from(json["data"].map((x) => AppParserJson.parseJson<T>(x))) : List<T>.from(json["data"]["items"].map((x) => AppParserJson.parseJson<T>(x))),
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toString())),
  };
}