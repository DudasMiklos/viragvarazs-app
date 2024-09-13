// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionModelImpl _$$OptionModelImplFromJson(Map<String, dynamic> json) =>
    _$OptionModelImpl(
      id: (json['id'] as num).toInt(),
      sku: json['sku'] as String,
      price: (json['price'] as num).toInt(),
      available: (json['available'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      color: ColorModel.fromJson(json['color'] as Map<String, dynamic>),
      size: SizeModel.fromJson(json['size'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OptionModelImplToJson(_$OptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'price': instance.price,
      'available': instance.available,
      'stock': instance.stock,
      'color': instance.color,
      'size': instance.size,
    };
