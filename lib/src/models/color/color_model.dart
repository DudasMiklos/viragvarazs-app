import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_model.freezed.dart';
part 'color_model.g.dart';

@freezed
class ColorModel with _$ColorModel {
  factory ColorModel({
    required final int id,
    required final String name,
  }) = _ColorModel;

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);
}
