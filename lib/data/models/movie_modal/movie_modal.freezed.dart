// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_modal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieModal {
  int? get total;
  int? get page;
  int? get pages;
  @JsonKey(name: 'tv_shows')
  List<TVShows>? get tvShows;

  /// Create a copy of MovieModal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovieModalCopyWith<MovieModal> get copyWith =>
      _$MovieModalCopyWithImpl<MovieModal>(this as MovieModal, _$identity);

  /// Serializes this MovieModal to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovieModal &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            const DeepCollectionEquality().equals(other.tvShows, tvShows));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, pages,
      const DeepCollectionEquality().hash(tvShows));

  @override
  String toString() {
    return 'MovieModal(total: $total, page: $page, pages: $pages, tvShows: $tvShows)';
  }
}

/// @nodoc
abstract mixin class $MovieModalCopyWith<$Res> {
  factory $MovieModalCopyWith(
          MovieModal value, $Res Function(MovieModal) _then) =
      _$MovieModalCopyWithImpl;
  @useResult
  $Res call(
      {int? total,
      int? page,
      int? pages,
      @JsonKey(name: 'tv_shows') List<TVShows>? tvShows});
}

/// @nodoc
class _$MovieModalCopyWithImpl<$Res> implements $MovieModalCopyWith<$Res> {
  _$MovieModalCopyWithImpl(this._self, this._then);

  final MovieModal _self;
  final $Res Function(MovieModal) _then;

  /// Create a copy of MovieModal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? tvShows = freezed,
  }) {
    return _then(_self.copyWith(
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      tvShows: freezed == tvShows
          ? _self.tvShows
          : tvShows // ignore: cast_nullable_to_non_nullable
              as List<TVShows>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MovieModal implements MovieModal {
  const _MovieModal(
      {this.total = null,
      this.page = null,
      this.pages = null,
      @JsonKey(name: 'tv_shows') final List<TVShows>? tvShows = const []})
      : _tvShows = tvShows;
  factory _MovieModal.fromJson(Map<String, dynamic> json) =>
      _$MovieModalFromJson(json);

  @override
  @JsonKey()
  final int? total;
  @override
  @JsonKey()
  final int? page;
  @override
  @JsonKey()
  final int? pages;
  final List<TVShows>? _tvShows;
  @override
  @JsonKey(name: 'tv_shows')
  List<TVShows>? get tvShows {
    final value = _tvShows;
    if (value == null) return null;
    if (_tvShows is EqualUnmodifiableListView) return _tvShows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of MovieModal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MovieModalCopyWith<_MovieModal> get copyWith =>
      __$MovieModalCopyWithImpl<_MovieModal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MovieModalToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieModal &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            const DeepCollectionEquality().equals(other._tvShows, _tvShows));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, pages,
      const DeepCollectionEquality().hash(_tvShows));

  @override
  String toString() {
    return 'MovieModal(total: $total, page: $page, pages: $pages, tvShows: $tvShows)';
  }
}

/// @nodoc
abstract mixin class _$MovieModalCopyWith<$Res>
    implements $MovieModalCopyWith<$Res> {
  factory _$MovieModalCopyWith(
          _MovieModal value, $Res Function(_MovieModal) _then) =
      __$MovieModalCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? total,
      int? page,
      int? pages,
      @JsonKey(name: 'tv_shows') List<TVShows>? tvShows});
}

/// @nodoc
class __$MovieModalCopyWithImpl<$Res> implements _$MovieModalCopyWith<$Res> {
  __$MovieModalCopyWithImpl(this._self, this._then);

  final _MovieModal _self;
  final $Res Function(_MovieModal) _then;

  /// Create a copy of MovieModal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? tvShows = freezed,
  }) {
    return _then(_MovieModal(
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      tvShows: freezed == tvShows
          ? _self._tvShows
          : tvShows // ignore: cast_nullable_to_non_nullable
              as List<TVShows>?,
    ));
  }
}

/// @nodoc
mixin _$TVShows {
  int? get id;
  String? get name;
  String? get permalink;
  @JsonKey(name: 'start_date')
  String? get startDate;
  @JsonKey(name: 'end_date')
  String? get endDate;
  String? get country;
  String? get network;
  String? get status;
  @JsonKey(name: 'image_thumbnail_path')
  String? get imageThumbnail;

  /// Create a copy of TVShows
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TVShowsCopyWith<TVShows> get copyWith =>
      _$TVShowsCopyWithImpl<TVShows>(this as TVShows, _$identity);

  /// Serializes this TVShows to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TVShows &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.permalink, permalink) ||
                other.permalink == permalink) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.imageThumbnail, imageThumbnail) ||
                other.imageThumbnail == imageThumbnail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, permalink, startDate,
      endDate, country, network, status, imageThumbnail);

  @override
  String toString() {
    return 'TVShows(id: $id, name: $name, permalink: $permalink, startDate: $startDate, endDate: $endDate, country: $country, network: $network, status: $status, imageThumbnail: $imageThumbnail)';
  }
}

/// @nodoc
abstract mixin class $TVShowsCopyWith<$Res> {
  factory $TVShowsCopyWith(TVShows value, $Res Function(TVShows) _then) =
      _$TVShowsCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? permalink,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      String? country,
      String? network,
      String? status,
      @JsonKey(name: 'image_thumbnail_path') String? imageThumbnail});
}

/// @nodoc
class _$TVShowsCopyWithImpl<$Res> implements $TVShowsCopyWith<$Res> {
  _$TVShowsCopyWithImpl(this._self, this._then);

  final TVShows _self;
  final $Res Function(TVShows) _then;

  /// Create a copy of TVShows
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? permalink = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? country = freezed,
    Object? network = freezed,
    Object? status = freezed,
    Object? imageThumbnail = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      permalink: freezed == permalink
          ? _self.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      imageThumbnail: freezed == imageThumbnail
          ? _self.imageThumbnail
          : imageThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TVShows implements TVShows {
  const _TVShows(
      {this.id = null,
      this.name = null,
      this.permalink = null,
      @JsonKey(name: 'start_date') this.startDate = null,
      @JsonKey(name: 'end_date') this.endDate = null,
      this.country = null,
      this.network = null,
      this.status = null,
      @JsonKey(name: 'image_thumbnail_path') this.imageThumbnail = null});
  factory _TVShows.fromJson(Map<String, dynamic> json) =>
      _$TVShowsFromJson(json);

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? permalink;
  @override
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  @JsonKey()
  final String? country;
  @override
  @JsonKey()
  final String? network;
  @override
  @JsonKey()
  final String? status;
  @override
  @JsonKey(name: 'image_thumbnail_path')
  final String? imageThumbnail;

  /// Create a copy of TVShows
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TVShowsCopyWith<_TVShows> get copyWith =>
      __$TVShowsCopyWithImpl<_TVShows>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TVShowsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TVShows &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.permalink, permalink) ||
                other.permalink == permalink) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.imageThumbnail, imageThumbnail) ||
                other.imageThumbnail == imageThumbnail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, permalink, startDate,
      endDate, country, network, status, imageThumbnail);

  @override
  String toString() {
    return 'TVShows(id: $id, name: $name, permalink: $permalink, startDate: $startDate, endDate: $endDate, country: $country, network: $network, status: $status, imageThumbnail: $imageThumbnail)';
  }
}

/// @nodoc
abstract mixin class _$TVShowsCopyWith<$Res> implements $TVShowsCopyWith<$Res> {
  factory _$TVShowsCopyWith(_TVShows value, $Res Function(_TVShows) _then) =
      __$TVShowsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? permalink,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      String? country,
      String? network,
      String? status,
      @JsonKey(name: 'image_thumbnail_path') String? imageThumbnail});
}

/// @nodoc
class __$TVShowsCopyWithImpl<$Res> implements _$TVShowsCopyWith<$Res> {
  __$TVShowsCopyWithImpl(this._self, this._then);

  final _TVShows _self;
  final $Res Function(_TVShows) _then;

  /// Create a copy of TVShows
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? permalink = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? country = freezed,
    Object? network = freezed,
    Object? status = freezed,
    Object? imageThumbnail = freezed,
  }) {
    return _then(_TVShows(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      permalink: freezed == permalink
          ? _self.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      imageThumbnail: freezed == imageThumbnail
          ? _self.imageThumbnail
          : imageThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
