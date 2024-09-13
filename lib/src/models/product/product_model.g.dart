// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['path'] as String,
      totalOptionCount: (json['total_option_count'] as num).toInt(),
      availableOptionCount: (json['available_option_count'] as num).toInt(),
      stockOptionCount: (json['stock_option_count'] as num).toInt(),
      minPrice: (json['min_price'] as num).toInt(),
      maxPrice: (json['max_price'] as num).toInt(),
      totalTimesSold: (json['total_times_sold'] as num).toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'path': instance.imageUrl,
      'total_option_count': instance.totalOptionCount,
      'available_option_count': instance.availableOptionCount,
      'stock_option_count': instance.stockOptionCount,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'total_times_sold': instance.totalTimesSold,
      'categories': instance.categories,
      'options': instance.options,
    };
