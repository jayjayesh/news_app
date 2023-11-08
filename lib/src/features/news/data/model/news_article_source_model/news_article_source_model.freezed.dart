// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_article_source_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsArticleSourceModel _$NewsArticleSourceModelFromJson(
    Map<String, dynamic> json) {
  return _NewsArticleSourceModel.fromJson(json);
}

/// @nodoc
mixin _$NewsArticleSourceModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsArticleSourceModelCopyWith<NewsArticleSourceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsArticleSourceModelCopyWith<$Res> {
  factory $NewsArticleSourceModelCopyWith(NewsArticleSourceModel value,
          $Res Function(NewsArticleSourceModel) then) =
      _$NewsArticleSourceModelCopyWithImpl<$Res, NewsArticleSourceModel>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$NewsArticleSourceModelCopyWithImpl<$Res,
        $Val extends NewsArticleSourceModel>
    implements $NewsArticleSourceModelCopyWith<$Res> {
  _$NewsArticleSourceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsArticleSourceModelImplCopyWith<$Res>
    implements $NewsArticleSourceModelCopyWith<$Res> {
  factory _$$NewsArticleSourceModelImplCopyWith(
          _$NewsArticleSourceModelImpl value,
          $Res Function(_$NewsArticleSourceModelImpl) then) =
      __$$NewsArticleSourceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$NewsArticleSourceModelImplCopyWithImpl<$Res>
    extends _$NewsArticleSourceModelCopyWithImpl<$Res,
        _$NewsArticleSourceModelImpl>
    implements _$$NewsArticleSourceModelImplCopyWith<$Res> {
  __$$NewsArticleSourceModelImplCopyWithImpl(
      _$NewsArticleSourceModelImpl _value,
      $Res Function(_$NewsArticleSourceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$NewsArticleSourceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsArticleSourceModelImpl implements _NewsArticleSourceModel {
  const _$NewsArticleSourceModelImpl({this.id, this.name});

  factory _$NewsArticleSourceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsArticleSourceModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'NewsArticleSourceModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsArticleSourceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsArticleSourceModelImplCopyWith<_$NewsArticleSourceModelImpl>
      get copyWith => __$$NewsArticleSourceModelImplCopyWithImpl<
          _$NewsArticleSourceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsArticleSourceModelImplToJson(
      this,
    );
  }
}

abstract class _NewsArticleSourceModel implements NewsArticleSourceModel {
  const factory _NewsArticleSourceModel(
      {final String? id, final String? name}) = _$NewsArticleSourceModelImpl;

  factory _NewsArticleSourceModel.fromJson(Map<String, dynamic> json) =
      _$NewsArticleSourceModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$NewsArticleSourceModelImplCopyWith<_$NewsArticleSourceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
