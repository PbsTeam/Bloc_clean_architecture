// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieModal _$MovieModalFromJson(Map<String, dynamic> json) => _MovieModal(
      total: (json['total'] as num?)?.toInt() ?? null,
      page: (json['page'] as num?)?.toInt() ?? null,
      pages: (json['pages'] as num?)?.toInt() ?? null,
      tvShows: (json['tv_shows'] as List<dynamic>?)
              ?.map((e) => TVShows.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MovieModalToJson(_MovieModal instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'tv_shows': instance.tvShows,
    };

_TVShows _$TVShowsFromJson(Map<String, dynamic> json) => _TVShows(
      id: (json['id'] as num?)?.toInt() ?? null,
      name: json['name'] as String? ?? null,
      permalink: json['permalink'] as String? ?? null,
      startDate: json['start_date'] as String? ?? null,
      endDate: json['end_date'] as String? ?? null,
      country: json['country'] as String? ?? null,
      network: json['network'] as String? ?? null,
      status: json['status'] as String? ?? null,
      imageThumbnail: json['image_thumbnail_path'] as String? ?? null,
    );

Map<String, dynamic> _$TVShowsToJson(_TVShows instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'permalink': instance.permalink,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'country': instance.country,
      'network': instance.network,
      'status': instance.status,
      'image_thumbnail_path': instance.imageThumbnail,
    };
