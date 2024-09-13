import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_category_model.freezed.dart';
part 'total_category_model.g.dart';

@freezed
class TotalCategoryModel with _$TotalCategoryModel {
  factory TotalCategoryModel({
    required int id,
    required String name,
    @JsonKey(name: 'path') required String imageUrl,
    @JsonKey(name: 'available_products_count')
    required int availableProductsCount,
  }) = _TotalCategoryModel;

  factory TotalCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TotalCategoryModelFromJson(json);
}
