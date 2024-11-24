// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) {
  return _BlogModel.fromJson(json);
}

/// @nodoc
mixin _$BlogModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'header_text')
  String get headerText => throw _privateConstructorUsedError;
  @JsonKey(name: 'small_text')
  String get smallText => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_paragraph')
  String get firstParagraph => throw _privateConstructorUsedError;
  @JsonKey(name: 'second_paragraph')
  String get secondParagraph => throw _privateConstructorUsedError;
  @JsonKey(name: 'path')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'publicator_name')
  String get publicatorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_date')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this BlogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlogModelCopyWith<BlogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogModelCopyWith<$Res> {
  factory $BlogModelCopyWith(BlogModel value, $Res Function(BlogModel) then) =
      _$BlogModelCopyWithImpl<$Res, BlogModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'header_text') String headerText,
      @JsonKey(name: 'small_text') String smallText,
      @JsonKey(name: 'first_paragraph') String firstParagraph,
      @JsonKey(name: 'second_paragraph') String secondParagraph,
      @JsonKey(name: 'path') String imageUrl,
      @JsonKey(name: 'publicator_name') String publicatorName,
      @JsonKey(name: 'app_date') String createdAt});
}

/// @nodoc
class _$BlogModelCopyWithImpl<$Res, $Val extends BlogModel>
    implements $BlogModelCopyWith<$Res> {
  _$BlogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? headerText = null,
    Object? smallText = null,
    Object? firstParagraph = null,
    Object? secondParagraph = null,
    Object? imageUrl = null,
    Object? publicatorName = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      headerText: null == headerText
          ? _value.headerText
          : headerText // ignore: cast_nullable_to_non_nullable
              as String,
      smallText: null == smallText
          ? _value.smallText
          : smallText // ignore: cast_nullable_to_non_nullable
              as String,
      firstParagraph: null == firstParagraph
          ? _value.firstParagraph
          : firstParagraph // ignore: cast_nullable_to_non_nullable
              as String,
      secondParagraph: null == secondParagraph
          ? _value.secondParagraph
          : secondParagraph // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publicatorName: null == publicatorName
          ? _value.publicatorName
          : publicatorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogModelImplCopyWith<$Res>
    implements $BlogModelCopyWith<$Res> {
  factory _$$BlogModelImplCopyWith(
          _$BlogModelImpl value, $Res Function(_$BlogModelImpl) then) =
      __$$BlogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'header_text') String headerText,
      @JsonKey(name: 'small_text') String smallText,
      @JsonKey(name: 'first_paragraph') String firstParagraph,
      @JsonKey(name: 'second_paragraph') String secondParagraph,
      @JsonKey(name: 'path') String imageUrl,
      @JsonKey(name: 'publicator_name') String publicatorName,
      @JsonKey(name: 'app_date') String createdAt});
}

/// @nodoc
class __$$BlogModelImplCopyWithImpl<$Res>
    extends _$BlogModelCopyWithImpl<$Res, _$BlogModelImpl>
    implements _$$BlogModelImplCopyWith<$Res> {
  __$$BlogModelImplCopyWithImpl(
      _$BlogModelImpl _value, $Res Function(_$BlogModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? headerText = null,
    Object? smallText = null,
    Object? firstParagraph = null,
    Object? secondParagraph = null,
    Object? imageUrl = null,
    Object? publicatorName = null,
    Object? createdAt = null,
  }) {
    return _then(_$BlogModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      headerText: null == headerText
          ? _value.headerText
          : headerText // ignore: cast_nullable_to_non_nullable
              as String,
      smallText: null == smallText
          ? _value.smallText
          : smallText // ignore: cast_nullable_to_non_nullable
              as String,
      firstParagraph: null == firstParagraph
          ? _value.firstParagraph
          : firstParagraph // ignore: cast_nullable_to_non_nullable
              as String,
      secondParagraph: null == secondParagraph
          ? _value.secondParagraph
          : secondParagraph // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publicatorName: null == publicatorName
          ? _value.publicatorName
          : publicatorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlogModelImpl implements _BlogModel {
  _$BlogModelImpl(
      {required this.id,
      @JsonKey(name: 'header_text') required this.headerText,
      @JsonKey(name: 'small_text') required this.smallText,
      @JsonKey(name: 'first_paragraph') required this.firstParagraph,
      @JsonKey(name: 'second_paragraph') required this.secondParagraph,
      @JsonKey(name: 'path') required this.imageUrl,
      @JsonKey(name: 'publicator_name') required this.publicatorName,
      @JsonKey(name: 'app_date') required this.createdAt});

  factory _$BlogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'header_text')
  final String headerText;
  @override
  @JsonKey(name: 'small_text')
  final String smallText;
  @override
  @JsonKey(name: 'first_paragraph')
  final String firstParagraph;
  @override
  @JsonKey(name: 'second_paragraph')
  final String secondParagraph;
  @override
  @JsonKey(name: 'path')
  final String imageUrl;
  @override
  @JsonKey(name: 'publicator_name')
  final String publicatorName;
  @override
  @JsonKey(name: 'app_date')
  final String createdAt;

  @override
  String toString() {
    return 'BlogModel(id: $id, headerText: $headerText, smallText: $smallText, firstParagraph: $firstParagraph, secondParagraph: $secondParagraph, imageUrl: $imageUrl, publicatorName: $publicatorName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.headerText, headerText) ||
                other.headerText == headerText) &&
            (identical(other.smallText, smallText) ||
                other.smallText == smallText) &&
            (identical(other.firstParagraph, firstParagraph) ||
                other.firstParagraph == firstParagraph) &&
            (identical(other.secondParagraph, secondParagraph) ||
                other.secondParagraph == secondParagraph) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.publicatorName, publicatorName) ||
                other.publicatorName == publicatorName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, headerText, smallText,
      firstParagraph, secondParagraph, imageUrl, publicatorName, createdAt);

  /// Create a copy of BlogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogModelImplCopyWith<_$BlogModelImpl> get copyWith =>
      __$$BlogModelImplCopyWithImpl<_$BlogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogModelImplToJson(
      this,
    );
  }
}

abstract class _BlogModel implements BlogModel {
  factory _BlogModel(
      {required final int id,
      @JsonKey(name: 'header_text') required final String headerText,
      @JsonKey(name: 'small_text') required final String smallText,
      @JsonKey(name: 'first_paragraph') required final String firstParagraph,
      @JsonKey(name: 'second_paragraph') required final String secondParagraph,
      @JsonKey(name: 'path') required final String imageUrl,
      @JsonKey(name: 'publicator_name') required final String publicatorName,
      @JsonKey(name: 'app_date')
      required final String createdAt}) = _$BlogModelImpl;

  factory _BlogModel.fromJson(Map<String, dynamic> json) =
      _$BlogModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'header_text')
  String get headerText;
  @override
  @JsonKey(name: 'small_text')
  String get smallText;
  @override
  @JsonKey(name: 'first_paragraph')
  String get firstParagraph;
  @override
  @JsonKey(name: 'second_paragraph')
  String get secondParagraph;
  @override
  @JsonKey(name: 'path')
  String get imageUrl;
  @override
  @JsonKey(name: 'publicator_name')
  String get publicatorName;
  @override
  @JsonKey(name: 'app_date')
  String get createdAt;

  /// Create a copy of BlogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogModelImplCopyWith<_$BlogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
