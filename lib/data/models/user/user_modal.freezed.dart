// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_modal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModal {
  String? get token;
  String? get error;

  /// Create a copy of UserModal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModalCopyWith<UserModal> get copyWith =>
      _$UserModalCopyWithImpl<UserModal>(this as UserModal, _$identity);

  /// Serializes this UserModal to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModal &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, error);

  @override
  String toString() {
    return 'UserModal(token: $token, error: $error)';
  }
}

/// @nodoc
abstract mixin class $UserModalCopyWith<$Res> {
  factory $UserModalCopyWith(UserModal value, $Res Function(UserModal) _then) =
      _$UserModalCopyWithImpl;
  @useResult
  $Res call({String? token, String? error});
}

/// @nodoc
class _$UserModalCopyWithImpl<$Res> implements $UserModalCopyWith<$Res> {
  _$UserModalCopyWithImpl(this._self, this._then);

  final UserModal _self;
  final $Res Function(UserModal) _then;

  /// Create a copy of UserModal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserModal implements UserModal {
  const _UserModal({this.token, this.error});
  factory _UserModal.fromJson(Map<String, dynamic> json) =>
      _$UserModalFromJson(json);

  @override
  final String? token;
  @override
  final String? error;

  /// Create a copy of UserModal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModalCopyWith<_UserModal> get copyWith =>
      __$UserModalCopyWithImpl<_UserModal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModalToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModal &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, error);

  @override
  String toString() {
    return 'UserModal(token: $token, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$UserModalCopyWith<$Res>
    implements $UserModalCopyWith<$Res> {
  factory _$UserModalCopyWith(
          _UserModal value, $Res Function(_UserModal) _then) =
      __$UserModalCopyWithImpl;
  @override
  @useResult
  $Res call({String? token, String? error});
}

/// @nodoc
class __$UserModalCopyWithImpl<$Res> implements _$UserModalCopyWith<$Res> {
  __$UserModalCopyWithImpl(this._self, this._then);

  final _UserModal _self;
  final $Res Function(_UserModal) _then;

  /// Create a copy of UserModal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = freezed,
    Object? error = freezed,
  }) {
    return _then(_UserModal(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
