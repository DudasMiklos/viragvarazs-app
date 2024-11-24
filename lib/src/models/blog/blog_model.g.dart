// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlogModelImpl _$$BlogModelImplFromJson(Map<String, dynamic> json) =>
    _$BlogModelImpl(
      id: (json['id'] as num).toInt(),
      headerText: json['header_text'] as String,
      smallText: json['small_text'] as String,
      firstParagraph: json['first_paragraph'] as String,
      secondParagraph: json['second_paragraph'] as String,
      imageUrl: json['path'] as String,
      publicatorName: json['publicator_name'] as String,
      createdAt: json['app_date'] as String,
    );

Map<String, dynamic> _$$BlogModelImplToJson(_$BlogModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'header_text': instance.headerText,
      'small_text': instance.smallText,
      'first_paragraph': instance.firstParagraph,
      'second_paragraph': instance.secondParagraph,
      'path': instance.imageUrl,
      'publicator_name': instance.publicatorName,
      'app_date': instance.createdAt,
    };
