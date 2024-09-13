// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'path')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_option_count')
  int get totalOptionCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_option_count')
  int get availableOptionCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_option_count')
  int get stockOptionCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_price')
  int get minPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_price')
  int get maxPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_times_sold')
  int get totalTimesSold => throw _privateConstructorUsedError;
  List<CategoryModel>? get categories => throw _privateConstructorUsedError;
  List<OptionModel>? get options => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      @JsonKey(name: 'path') String imageUrl,
      @JsonKey(name: 'total_option_count') int totalOptionCount,
      @JsonKey(name: 'available_option_count') int availableOptionCount,
      @JsonKey(name: 'stock_option_count') int stockOptionCount,
      @JsonKey(name: 'min_price') int minPrice,
      @JsonKey(name: 'max_price') int maxPrice,
      @JsonKey(name: 'total_times_sold') int totalTimesSold,
      List<CategoryModel>? categories,
      List<OptionModel>? options});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? totalOptionCount = null,
    Object? availableOptionCount = null,
    Object? stockOptionCount = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? totalTimesSold = null,
    Object? categories = freezed,
    Object? options = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      totalOptionCount: null == totalOptionCount
          ? _value.totalOptionCount
          : totalOptionCount // ignore: cast_nullable_to_non_nullable
              as int,
      availableOptionCount: null == availableOptionCount
          ? _value.availableOptionCount
          : availableOptionCount // ignore: cast_nullable_to_non_nullable
              as int,
      stockOptionCount: null == stockOptionCount
          ? _value.stockOptionCount
          : stockOptionCount // ignore: cast_nullable_to_non_nullable
              as int,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalTimesSold: null == totalTimesSold
          ? _value.totalTimesSold
          : totalTimesSold // ignore: cast_nullable_to_non_nullable
              as int,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<OptionModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      @JsonKey(name: 'path') String imageUrl,
      @JsonKey(name: 'total_option_count') int totalOptionCount,
      @JsonKey(name: 'available_option_count') int availableOptionCount,
      @JsonKey(name: 'stock_option_count') int stockOptionCount,
      @JsonKey(name: 'min_price') int minPrice,
      @JsonKey(name: 'max_price') int maxPrice,
      @JsonKey(name: 'total_times_sold') int totalTimesSold,
      List<CategoryModel>? categories,
      List<OptionModel>? options});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? totalOptionCount = null,
    Object? availableOptionCount = null,
    Object? stockOptionCount = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? totalTimesSold = null,
    Object? categories = freezed,
    Object? options = freezed,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      totalOptionCount: null == totalOptionCount
          ? _value.totalOptionCount
          : totalOptionCount // ignore: cast_nullable_to_non_nullable
              as int,
      availableOptionCount: null == availableOptionCount
          ? _value.availableOptionCount
          : availableOptionCount // ignore: cast_nullable_to_non_nullable
              as int,
      stockOptionCount: null == stockOptionCount
          ? _value.stockOptionCount
          : stockOptionCount // ignore: cast_nullable_to_non_nullable
              as int,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalTimesSold: null == totalTimesSold
          ? _value.totalTimesSold
          : totalTimesSold // ignore: cast_nullable_to_non_nullable
              as int,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<OptionModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  _$ProductModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      @JsonKey(name: 'path') required this.imageUrl,
      @JsonKey(name: 'total_option_count') required this.totalOptionCount,
      @JsonKey(name: 'available_option_count')
      required this.availableOptionCount,
      @JsonKey(name: 'stock_option_count') required this.stockOptionCount,
      @JsonKey(name: 'min_price') required this.minPrice,
      @JsonKey(name: 'max_price') required this.maxPrice,
      @JsonKey(name: 'total_times_sold') required this.totalTimesSold,
      final List<CategoryModel>? categories,
      final List<OptionModel>? options})
      : _categories = categories,
        _options = options;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: 'path')
  final String imageUrl;
  @override
  @JsonKey(name: 'total_option_count')
  final int totalOptionCount;
  @override
  @JsonKey(name: 'available_option_count')
  final int availableOptionCount;
  @override
  @JsonKey(name: 'stock_option_count')
  final int stockOptionCount;
  @override
  @JsonKey(name: 'min_price')
  final int minPrice;
  @override
  @JsonKey(name: 'max_price')
  final int maxPrice;
  @override
  @JsonKey(name: 'total_times_sold')
  final int totalTimesSold;
  final List<CategoryModel>? _categories;
  @override
  List<CategoryModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OptionModel>? _options;
  @override
  List<OptionModel>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, totalOptionCount: $totalOptionCount, availableOptionCount: $availableOptionCount, stockOptionCount: $stockOptionCount, minPrice: $minPrice, maxPrice: $maxPrice, totalTimesSold: $totalTimesSold, categories: $categories, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.totalOptionCount, totalOptionCount) ||
                other.totalOptionCount == totalOptionCount) &&
            (identical(other.availableOptionCount, availableOptionCount) ||
                other.availableOptionCount == availableOptionCount) &&
            (identical(other.stockOptionCount, stockOptionCount) ||
                other.stockOptionCount == stockOptionCount) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.totalTimesSold, totalTimesSold) ||
                other.totalTimesSold == totalTimesSold) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      imageUrl,
      totalOptionCount,
      availableOptionCount,
      stockOptionCount,
      minPrice,
      maxPrice,
      totalTimesSold,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_options));

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {required final int id,
      required final String name,
      required final String description,
      @JsonKey(name: 'path') required final String imageUrl,
      @JsonKey(name: 'total_option_count') required final int totalOptionCount,
      @JsonKey(name: 'available_option_count')
      required final int availableOptionCount,
      @JsonKey(name: 'stock_option_count') required final int stockOptionCount,
      @JsonKey(name: 'min_price') required final int minPrice,
      @JsonKey(name: 'max_price') required final int maxPrice,
      @JsonKey(name: 'total_times_sold') required final int totalTimesSold,
      final List<CategoryModel>? categories,
      final List<OptionModel>? options}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'path')
  String get imageUrl;
  @override
  @JsonKey(name: 'total_option_count')
  int get totalOptionCount;
  @override
  @JsonKey(name: 'available_option_count')
  int get availableOptionCount;
  @override
  @JsonKey(name: 'stock_option_count')
  int get stockOptionCount;
  @override
  @JsonKey(name: 'min_price')
  int get minPrice;
  @override
  @JsonKey(name: 'max_price')
  int get maxPrice;
  @override
  @JsonKey(name: 'total_times_sold')
  int get totalTimesSold;
  @override
  List<CategoryModel>? get categories;
  @override
  List<OptionModel>? get options;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
