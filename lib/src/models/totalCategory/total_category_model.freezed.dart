// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'total_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TotalCategoryModel _$TotalCategoryModelFromJson(Map<String, dynamic> json) {
  return _TotalCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$TotalCategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'path')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_products_count')
  int get availableProductsCount => throw _privateConstructorUsedError;

  /// Serializes this TotalCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TotalCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TotalCategoryModelCopyWith<TotalCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalCategoryModelCopyWith<$Res> {
  factory $TotalCategoryModelCopyWith(
          TotalCategoryModel value, $Res Function(TotalCategoryModel) then) =
      _$TotalCategoryModelCopyWithImpl<$Res, TotalCategoryModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'path') String imageUrl,
      @JsonKey(name: 'available_products_count') int availableProductsCount});
}

/// @nodoc
class _$TotalCategoryModelCopyWithImpl<$Res, $Val extends TotalCategoryModel>
    implements $TotalCategoryModelCopyWith<$Res> {
  _$TotalCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TotalCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? availableProductsCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      availableProductsCount: null == availableProductsCount
          ? _value.availableProductsCount
          : availableProductsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotalCategoryModelImplCopyWith<$Res>
    implements $TotalCategoryModelCopyWith<$Res> {
  factory _$$TotalCategoryModelImplCopyWith(_$TotalCategoryModelImpl value,
          $Res Function(_$TotalCategoryModelImpl) then) =
      __$$TotalCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'path') String imageUrl,
      @JsonKey(name: 'available_products_count') int availableProductsCount});
}

/// @nodoc
class __$$TotalCategoryModelImplCopyWithImpl<$Res>
    extends _$TotalCategoryModelCopyWithImpl<$Res, _$TotalCategoryModelImpl>
    implements _$$TotalCategoryModelImplCopyWith<$Res> {
  __$$TotalCategoryModelImplCopyWithImpl(_$TotalCategoryModelImpl _value,
      $Res Function(_$TotalCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TotalCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? availableProductsCount = null,
  }) {
    return _then(_$TotalCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      availableProductsCount: null == availableProductsCount
          ? _value.availableProductsCount
          : availableProductsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TotalCategoryModelImpl implements _TotalCategoryModel {
  _$TotalCategoryModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'path') required this.imageUrl,
      @JsonKey(name: 'available_products_count')
      required this.availableProductsCount});

  factory _$TotalCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotalCategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'path')
  final String imageUrl;
  @override
  @JsonKey(name: 'available_products_count')
  final int availableProductsCount;

  @override
  String toString() {
    return 'TotalCategoryModel(id: $id, name: $name, imageUrl: $imageUrl, availableProductsCount: $availableProductsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.availableProductsCount, availableProductsCount) ||
                other.availableProductsCount == availableProductsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, imageUrl, availableProductsCount);

  /// Create a copy of TotalCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalCategoryModelImplCopyWith<_$TotalCategoryModelImpl> get copyWith =>
      __$$TotalCategoryModelImplCopyWithImpl<_$TotalCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotalCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _TotalCategoryModel implements TotalCategoryModel {
  factory _TotalCategoryModel(
      {required final int id,
      required final String name,
      @JsonKey(name: 'path') required final String imageUrl,
      @JsonKey(name: 'available_products_count')
      required final int availableProductsCount}) = _$TotalCategoryModelImpl;

  factory _TotalCategoryModel.fromJson(Map<String, dynamic> json) =
      _$TotalCategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'path')
  String get imageUrl;
  @override
  @JsonKey(name: 'available_products_count')
  int get availableProductsCount;

  /// Create a copy of TotalCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TotalCategoryModelImplCopyWith<_$TotalCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
