import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:viragvarazs/src/models/category/category_model.dart';
import 'package:viragvarazs/src/models/option/option_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'path') required String imageUrl,
    @JsonKey(name: 'total_option_count') required int totalOptionCount,
    @JsonKey(name: 'available_option_count') required int availableOptionCount,
    @JsonKey(name: 'stock_option_count') required int stockOptionCount,
    @JsonKey(name: 'min_price') required int minPrice,
    @JsonKey(name: 'max_price') required int maxPrice,
    @JsonKey(name: 'total_times_sold') required int totalTimesSold,
    List<CategoryModel>? categories,
    List<OptionModel>? options,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

extension ProductMinPrice on ProductModel {
  String formattedMinPrice() {
    MoneyFormatter formatter = MoneyFormatter(
      amount: minPrice.toDouble(),
      settings: MoneyFormatterSettings(
        symbol: 'Ft',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 0,
        compactFormatType: CompactFormatType.short,
      ),
    );

    return formatter.output.symbolOnRight;
  }
}

extension ProductMaxPrice on ProductModel {
  String formattedMaxPrice() {
    MoneyFormatter formatter = MoneyFormatter(
      amount: maxPrice.toDouble(),
      settings: MoneyFormatterSettings(
        symbol: 'Ft',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 0,
        compactFormatType: CompactFormatType.short,
      ),
    );

    return formatter.output.symbolOnRight;
  }
}
