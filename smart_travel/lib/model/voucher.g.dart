// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherModel _$VoucherModelFromJson(Map<String, dynamic> json) => VoucherModel(
      name: json['name'] as String? ?? "",
      linkAdvertise: json['linkAdvertise'] as String?,
      imageUri: json['imageUri'] as String? ?? "",
      id: json['id'] as int?,
    );

Map<String, dynamic> _$VoucherModelToJson(VoucherModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'linkAdvertise': instance.linkAdvertise,
      'imageUri': instance.imageUri,
      'id': instance.id,
    };
