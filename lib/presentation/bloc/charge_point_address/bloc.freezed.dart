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
class _$ChargePointAddressEventTearOff {
  const _$ChargePointAddressEventTearOff();

  GetPlaceByIdEvent getPlaceById(String xid, String apikey) {
    return GetPlaceByIdEvent(
      xid,
      apikey,
    );
  }
}

/// @nodoc
const $ChargePointAddressEvent = _$ChargePointAddressEventTearOff();

/// @nodoc
mixin _$ChargePointAddressEvent {
  String get xid => throw _privateConstructorUsedError;
  String get apikey => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String xid, String apikey) getPlaceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String xid, String apikey)? getPlaceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String xid, String apikey)? getPlaceById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlaceByIdEvent value) getPlaceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlaceByIdEvent value)? getPlaceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaceByIdEvent value)? getPlaceById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChargePointAddressEventCopyWith<ChargePointAddressEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargePointAddressEventCopyWith<$Res> {
  factory $ChargePointAddressEventCopyWith(ChargePointAddressEvent value,
          $Res Function(ChargePointAddressEvent) then) =
      _$ChargePointAddressEventCopyWithImpl<$Res>;
  $Res call({String xid, String apikey});
}

/// @nodoc
class _$ChargePointAddressEventCopyWithImpl<$Res>
    implements $ChargePointAddressEventCopyWith<$Res> {
  _$ChargePointAddressEventCopyWithImpl(this._value, this._then);

  final ChargePointAddressEvent _value;
  // ignore: unused_field
  final $Res Function(ChargePointAddressEvent) _then;

  @override
  $Res call({
    Object? xid = freezed,
    Object? apikey = freezed,
  }) {
    return _then(_value.copyWith(
      xid: xid == freezed
          ? _value.xid
          : xid // ignore: cast_nullable_to_non_nullable
              as String,
      apikey: apikey == freezed
          ? _value.apikey
          : apikey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $GetPlaceByIdEventCopyWith<$Res>
    implements $ChargePointAddressEventCopyWith<$Res> {
  factory $GetPlaceByIdEventCopyWith(
          GetPlaceByIdEvent value, $Res Function(GetPlaceByIdEvent) then) =
      _$GetPlaceByIdEventCopyWithImpl<$Res>;
  @override
  $Res call({String xid, String apikey});
}

/// @nodoc
class _$GetPlaceByIdEventCopyWithImpl<$Res>
    extends _$ChargePointAddressEventCopyWithImpl<$Res>
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
    return 'ChargePointAddressEvent.getPlaceById(xid: $xid, apikey: $apikey)';
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
    required TResult Function(String xid, String apikey) getPlaceById,
  }) {
    return getPlaceById(xid, apikey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String xid, String apikey)? getPlaceById,
  }) {
    return getPlaceById?.call(xid, apikey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(GetPlaceByIdEvent value) getPlaceById,
  }) {
    return getPlaceById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlaceByIdEvent value)? getPlaceById,
  }) {
    return getPlaceById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaceByIdEvent value)? getPlaceById,
    required TResult orElse(),
  }) {
    if (getPlaceById != null) {
      return getPlaceById(this);
    }
    return orElse();
  }
}

abstract class GetPlaceByIdEvent extends ChargePointAddressEvent {
  const factory GetPlaceByIdEvent(String xid, String apikey) =
      _$GetPlaceByIdEvent;
  const GetPlaceByIdEvent._() : super._();

  @override
  String get xid => throw _privateConstructorUsedError;
  @override
  String get apikey => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $GetPlaceByIdEventCopyWith<GetPlaceByIdEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
