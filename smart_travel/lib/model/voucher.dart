import 'package:json_annotation/json_annotation.dart';
part 'voucher.g.dart';

@JsonSerializable()
class VoucherModel {

  VoucherModel({
    this.name = "",
    this.linkAdvertise,
    this.imageUri = "",
    this.id,
  });

  final String name;
  final String? linkAdvertise;
  final String imageUri;
  final int? id;

  // factory VoucherModel.fromJson(Map<String, dynamic>? json) => VoucherModel(
  //   name: json?["name"] ?? "",
  //   linkAdvertise: json?["linkAdvertise"],
  //   imageUri: json?["imageUri"] ?? "",
  //   id: json?["id"],
  // );
  factory VoucherModel.fromJson(Map<String, dynamic> data) =>
      _$VoucherModelFromJson(data);

  Map<String, dynamic> toJson() => _$VoucherModelToJson(this);
}