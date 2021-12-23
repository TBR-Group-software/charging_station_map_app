// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChargePointEventTearOff {
  const _$ChargePointEventTearOff();

  GetPlacesByRadiusEvent getPlacesByRadius(String kinds, String format,
      String apikey, String lat, String lon, String radius) {
    return GetPlacesByRadiusEvent(
      kinds,
      format,
      apikey,
      lat,
      lon,
      radius,
    );
  }

  GetPlaceByIdEvent getPlaceById(String xid, String apikey) {
    return GetPlaceByIdEvent(
      xid,
      apikey,
    );
  }
}

/// @nodoc
const $ChargePointEvent = _$ChargePointEventTearOff();

/// @nodoc
mixin _$ChargePointEvent {
  String get apikey => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String kinds, String format, String apikey,
            String lat, String lon, String radius)
        getPlacesByRadius,
    required TResult Function(String xid, String apikey) getPlaceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String kinds, String format, String apikey, String lat,
            String lon, String radius)?
        getPlacesByRadius,
    TResult Function(String xid, String apikey)? getPlaceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String kinds, String format, String apikey, String lat,
            String lon, String radius)?
        getPlacesByRadius,
    TResult Function(String xid, String apikey)? getPlaceById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlacesByRadiusEvent value) getPlacesByRadius,
    required TResult Function(GetPlaceByIdEvent value) getPlaceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlacesByRadiusEvent value)? getPlacesByRadius,
    TResult Function(GetPlaceByIdEvent value)? getPlaceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlacesByRadiusEvent value)? getPlacesByRadius,
    TResult Function(GetPlaceByIdEvent value)? getPlaceById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChargePointEventCopyWith<ChargePointEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargePointEventCopyWith<$Res> {
  factory $ChargePointEventCopyWith(
          ChargePointEvent value, $Res Function(ChargePointEvent) then) =
      _$ChargePointEventCopyWithImpl<$Res>;
  $Res call({String apikey});
}

/// @nodoc
class _$ChargePointEventCopyWithImpl<$Res>
    implements $ChargePointEventCopyWith<$Res> {
  _$ChargePointEventCopyWithImpl(this._value, this._then);

  final ChargePointEvent _value;
  // ignore: unused_field
  final $Res Function(ChargePointEvent) _then;

  @override
  $Res call({
    Object? apikey = freezed,
  }) {
    return _then(_value.copyWith(
      apikey: apikey == freezed
          ? _value.apikey
          : apikey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $GetPlacesByRadiusEventCopyWith<$Res>
    implements $ChargePointEventCopyWith<$Res> {
  factory $GetPlacesByRadiusEventCopyWith(GetPlacesByRadiusEvent value,
          $Res Function(GetPlacesByRadiusEvent) then) =
      _$GetPlacesByRadiusEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String kinds,
      String format,
      String apikey,
      String lat,
      String lon,
      String radius});
}

/// @nodoc
class _$GetPlacesByRadiusEventCopyWithImpl<$Res>
    extends _$ChargePointEventCopyWithImpl<$Res>
    implements $GetPlacesByRadiusEventCopyWith<$Res> {
  _$GetPlacesByRadiusEventCopyWithImpl(GetPlacesByRadiusEvent _value,
      $Res Function(GetPlacesByRadiusEvent) _then)
      : super(_value, (v) => _then(v as GetPlacesByRadiusEvent));

  @override
  GetPlacesByRadiusEvent get _value => super._value as GetPlacesByRadiusEvent;

  @override
  $Res call({
    Object? kinds = freezed,
    Object? format = freezed,
    Object? apikey = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? radius = freezed,
  }) {
    return _then(GetPlacesByRadiusEvent(
      kinds == freezed
          ? _value.kinds
          : kinds // ignore: cast_nullable_to_non_nullable
              as String,
      format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      apikey == freezed
          ? _value.apikey
          : apikey // ignore: cast_nullable_to_non_nullable
              as String,
      lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String,
      radius == freezed
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetPlacesByRadiusEvent extends GetPlacesByRadiusEvent {
  const _$GetPlacesByRadiusEvent(
      this.kinds, this.format, this.apikey, this.lat, this.lon, this.radius)
      : super._();

  @override
  final String kinds;
  @override
  final String format;
  @override
  final String apikey;
  @override
  final String lat;
  @override
  final String lon;
  @override
  final String radius;

  @override
  String toString() {
    return 'ChargePointEvent.getPlacesByRadius(kinds: $kinds, format: $format, apikey: $apikey, lat: $lat, lon: $lon, radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPlacesByRadiusEvent &&
            (identical(other.kinds, kinds) ||
                const DeepCollectionEquality().equals(other.kinds, kinds)) &&
            (identical(other.format, format) ||
                const DeepCollectionEquality().equals(other.format, format)) &&
            (identical(other.apikey, apikey) ||
                const DeepCollectionEquality().equals(other.apikey, apikey)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)) &&
            (identical(other.radius, radius) ||
                const DeepCollectionEquality().equals(other.radius, radius)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(kinds) ^
      const DeepCollectionEquality().hash(format) ^
      const DeepCollectionEquality().hash(apikey) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon) ^
      const DeepCollectionEquality().hash(radius);

  @JsonKey(ignore: true)
  @override
  $GetPlacesByRadiusEventCopyWith<GetPlacesByRadiusEvent> get copyWith =>
      _$GetPlacesByRadiusEventCopyWithImpl<GetPlacesByRadiusEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String kinds, String format, String apikey,
            String lat, String lon, String radius)
        getPlacesByRadius,
    required TResult Function(String xid, String apikey) getPlaceById,
  }) {
    return getPlacesByRadius(kinds, format, apikey, lat, lon, radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String kinds, String format, String apikey, String lat,
            String lon, String radius)?
        getPlacesByRadius,
    TResult Function(String xid, String apikey)? getPlaceById,
  }) {
    return getPlacesByRadius?.call(kinds, format, apikey, lat, lon, radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String kinds, String format, String apikey, String lat,
            String lon, String radius)?
        getPlacesByRadius,
    TResult Function(String xid, String apikey)? getPlaceById,
    required TResult orElse(),
  }) {
    if (getPlacesByRadius != null) {
      return getPlacesByRadius(kinds, format, apikey, lat, lon, radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlacesByRadiusEvent value) getPlacesByRadius,
    required TResult Function(GetPlaceByIdEvent value) getPlaceById,
  }) {
    return getPlacesByRadius(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlacesByRadiusEvent value)? getPlacesByRadius,
    TResult Function(GetPlaceByIdEvent value)? getPlaceById,
  }) {
    return getPlacesByRadius?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlacesByRadiusEvent value)? getPlacesByRadius,
    TResult Function(GetPlaceByIdEvent value)? getPlaceById,
    required TResult orElse(),
  }) {
    if (getPlacesByRadius != null) {
      return getPlacesByRadius(this);
    }
    return orElse();
  }
}

abstract class GetPlacesByRadiusEvent extends ChargePointEvent {
  const factory GetPlacesByRadiusEvent(
      String kinds,
      String format,
      String apikey,
      String lat,
      String lon,
      String radius) = _$GetPlacesByRadiusEvent;
  const GetPlacesByRadiusEvent._() : super._();

  String get kinds => throw _privateConstructorUsedError;
  String get format => throw _privateConstructorUsedError;
  @override
  String get apikey => throw _privateConstructorUsedError;
  String get lat => throw _privateConstructorUsedError;
  String get lon => throw _privateConstructorUsedError;
  String get radius => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $GetPlacesByRadiusEventCopyWith<GetPlacesByRadiusEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPlaceByIdEventCopyWith<$Res>
    implements $ChargePointEventCopyWith<$Res> {
  factory $GetPlaceByIdEventCopyWith(
          GetPlaceByIdEvent value, $Res Function(GetPlaceByIdEvent) then) =
      _$GetPlaceByIdEventCopyWithImpl<$Res>;
  @override
  $Res call({String xid, String apikey});
}

/// @nodoc
class _$GetPlaceByIdEventCopyWithImpl<$Res>
    extends _$ChargePointEventCopyWithImpl<$Res>
    implements $GetPlaceByIdEventCopyWith<$Res> {
  _$GetPlaceByIdEventCopyWithImpl(
      GetPlaceByIdEvent _value, $Res Function(GetPlaceByIdEvent) _then)
      : super(_value, (v) => _then(v as GetPlaceByIdEvent));

  @override
  GetPlaceByIdEvent get _value => super._value as GetPlaceByIdEvent;

  @override
  $Res call({
    Object? xid = freezed,
    Object? apikey = freezed,
  }) {
    return _then(GetPlaceByIdEvent(
      xid == freezed
          ? _value.xid
          : xid // ignore: cast_nullable_to_non_nullable
              as String,
      apikey == freezed
          ? _value.apikey
          : apikey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetPlaceByIdEvent extends GetPlaceByIdEvent {
  const _$GetPlaceByIdEvent(this.xid, this.apikey) : super._();

  @override
  final String xid;
  @override
  final String apikey;

  @override
  String toString() {
    return 'ChargePointEvent.getPlaceById(xid: $xid, apikey: $apikey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPlaceByIdEvent &&
            (identical(other.xid, xid) ||
                const DeepCollectionEquality().equals(other.xid, xid)) &&
            (identical(other.apikey, apikey) ||
                const DeepCollectionEquality().equals(other.apikey, apikey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(xid) ^
      const DeepCollectionEquality().hash(apikey);

  @JsonKey(ignore: true)
  @override
  $GetPlaceByIdEventCopyWith<GetPlaceByIdEvent> get copyWith =>
      _$GetPlaceByIdEventCopyWithImpl<GetPlaceByIdEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String kinds, String format, String apikey,
            String lat, String lon, String radius)
        getPlacesByRadius,
    required TResult Function(String xid, String apikey) getPlaceById,
  }) {
    return getPlaceById(xid, apikey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String kinds, String format, String apikey, String lat,
            String lon, String radius)?
        getPlacesByRadius,
    TResult Function(String xid, String apikey)? getPlaceById,
  }) {
    return getPlaceById?.call(xid, apikey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String kinds, String format, String apikey, String lat,
            String lon, String radius)?
        getPlacesByRadius,
    TResult Function(String xid, String apikey)? getPlaceById,
    required TResult orElse(),
  }) {
    if (getPlaceById != null) {
      return getPlaceById(xid, apikey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlacesByRadiusEvent value) getPlacesByRadius,
    required TResult Function(GetPlaceByIdEvent value) getPlaceById,
  }) {
    return getPlaceById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlacesByRadiusEvent value)? getPlacesByRadius,
    TResult Function(GetPlaceByIdEvent value)? getPlaceById,
  }) {
    return getPlaceById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlacesByRadiusEvent value)? getPlacesByRadius,
    TResult Function(GetPlaceByIdEvent value)? getPlaceById,
    required TResult orElse(),
  }) {
    if (getPlaceById != null) {
      return getPlaceById(this);
    }
    return orElse();
  }
}

abstract class GetPlaceByIdEvent extends ChargePointEvent {
  const factory GetPlaceByIdEvent(String xid, String apikey) =
      _$GetPlaceByIdEvent;
  const GetPlaceByIdEvent._() : super._();

  String get xid => throw _privateConstructorUsedError;
  @override
  String get apikey => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $GetPlaceByIdEventCopyWith<GetPlaceByIdEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
