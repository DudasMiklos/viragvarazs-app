import 'package:freezed_annotation/freezed_annotation.dart';

part 'size_model.freezed.dart';
part 'size_model.g.dart';

@freezed
class SizeModel with _$SizeModel {
  factory SizeModel({
    required final int id,
    required final String name,
  }) = _SizeModel;

  // This will generate the JSON serialization logic
  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
}
