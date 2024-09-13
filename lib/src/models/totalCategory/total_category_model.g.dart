// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TotalCategoryModelImpl _$$TotalCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TotalCategoryModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['path'] as String,
      availableProductsCount: (json['available_products_count'] as num).toInt(),
    );

Map<String, dynamic> _$$TotalCategoryModelImplToJson(
        _$TotalCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.imageUrl,
      'available_products_count': instance.availableProductsCount,
    };
