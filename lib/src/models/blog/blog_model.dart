import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_model.freezed.dart';
part 'blog_model.g.dart';

@freezed
class BlogModel with _$BlogModel {
  factory BlogModel({
    required int id,
    @JsonKey(name: 'header_text') required String headerText,
    @JsonKey(name: 'small_text') required String smallText,
    @JsonKey(name: 'first_paragraph') required String firstParagraph,
    @JsonKey(name: 'second_paragraph') required String secondParagraph,
    @JsonKey(name: 'path') required String imageUrl,
    @JsonKey(name: 'publicator_name') required String publicatorName,
    @JsonKey(name: 'app_date') required String createdAt,
  }) = _BlogModel;

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);
}
