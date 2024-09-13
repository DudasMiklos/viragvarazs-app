// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OptionModel _$OptionModelFromJson(Map<String, dynamic> json) {
  return _OptionModel.fromJson(json);
}

/// @nodoc
mixin _$OptionModel {
  int get id => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get available => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  ColorModel get color => throw _privateConstructorUsedError;
  SizeModel get size => throw _privateConstructorUsedError;

  /// Serializes this OptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionModelCopyWith<OptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionModelCopyWith<$Res> {
  factory $OptionModelCopyWith(
          OptionModel value, $Res Function(OptionModel) then) =
      _$OptionModelCopyWithImpl<$Res, OptionModel>;
  @useResult
  $Res call(
      {int id,
      String sku,
      int price,
      int available,
      int stock,
      ColorModel color,
      SizeModel size});

  $ColorModelCopyWith<$Res> get color;
  $SizeModelCopyWith<$Res> get size;
}

/// @nodoc
class _$OptionModelCopyWithImpl<$Res, $Val extends OptionModel>
    implements $OptionModelCopyWith<$Res> {
  _$OptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sku = null,
    Object? price = null,
    Object? available = null,
    Object? stock = null,
    Object? color = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorModel,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as SizeModel,
    ) as $Val);
  }

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ColorModelCopyWith<$Res> get color {
    return $ColorModelCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SizeModelCopyWith<$Res> get size {
    return $SizeModelCopyWith<$Res>(_value.size, (value) {
      return _then(_value.copyWith(size: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OptionModelImplCopyWith<$Res>
    implements $OptionModelCopyWith<$Res> {
  factory _$$OptionModelImplCopyWith(
          _$OptionModelImpl value, $Res Function(_$OptionModelImpl) then) =
      __$$OptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String sku,
      int price,
      int available,
      int stock,
      ColorModel color,
      SizeModel size});

  @override
  $ColorModelCopyWith<$Res> get color;
  @override
  $SizeModelCopyWith<$Res> get size;
}

/// @nodoc
class __$$OptionModelImplCopyWithImpl<$Res>
    extends _$OptionModelCopyWithImpl<$Res, _$OptionModelImpl>
    implements _$$OptionModelImplCopyWith<$Res> {
  __$$OptionModelImplCopyWithImpl(
      _$OptionModelImpl _value, $Res Function(_$OptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sku = null,
    Object? price = null,
    Object? available = null,
    Object? stock = null,
    Object? color = null,
    Object? size = null,
  }) {
    return _then(_$OptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorModel,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as SizeModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionModelImpl implements _OptionModel {
  _$OptionModelImpl(
      {required this.id,
      required this.sku,
      required this.price,
      required this.available,
      required this.stock,
      required this.color,
      required this.size});

  factory _$OptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String sku;
  @override
  final int price;
  @override
  final int available;
  @override
  final int stock;
  @override
  final ColorModel color;
  @override
  final SizeModel size;

  @override
  String toString() {
    return 'OptionModel(id: $id, sku: $sku, price: $price, available: $available, stock: $stock, color: $color, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sku, price, available, stock, color, size);

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionModelImplCopyWith<_$OptionModelImpl> get copyWith =>
      __$$OptionModelImplCopyWithImpl<_$OptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionModelImplToJson(
      this,
    );
  }
}

abstract class _OptionModel implements OptionModel {
  factory _OptionModel(
      {required final int id,
      required final String sku,
      required final int price,
      required final int available,
      required final int stock,
      required final ColorModel color,
      required final SizeModel size}) = _$OptionModelImpl;

  factory _OptionModel.fromJson(Map<String, dynamic> json) =
      _$OptionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get sku;
  @override
  int get price;
  @override
  int get available;
  @override
  int get stock;
  @override
  ColorModel get color;
  @override
  SizeModel get size;

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionModelImplCopyWith<_$OptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
