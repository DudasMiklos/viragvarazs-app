import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:viragvarazs/src/models/color/color_model.dart';
import 'package:viragvarazs/src/models/size/size_model.dart';

part 'option_model.freezed.dart';
part 'option_model.g.dart';

@freezed
class OptionModel with _$OptionModel {
  factory OptionModel({
    required int id,
    required String sku,
    required int price,
    required int available,
    required int stock,
    required ColorModel color,
    required SizeModel size,
  }) = _OptionModel;

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);
}

extension OptionPrice on OptionModel {
  String formattedPrice() {
    MoneyFormatter formatter = MoneyFormatter(
      amount: price.toDouble(),
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
