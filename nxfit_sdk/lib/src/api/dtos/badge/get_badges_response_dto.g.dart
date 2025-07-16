// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_badges_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBadgesResponseDto _$GetBadgesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetBadgesResponseDto(
      (json['results'] as List<dynamic>)
          .map((e) => Badge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Badge _$BadgeFromJson(Map<String, dynamic> json) => Badge(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['description'] as String,
      json['imageUrl'] as String,
      (json['progress'] as num).toDouble(),
      _$JsonConverterFromJson<String, OffsetDateTime>(
          json['startedOn'], const OffsetDateTimeJsonConverter().fromJson),
      _$JsonConverterFromJson<String, OffsetDateTime>(
          json['endedOn'], const OffsetDateTimeJsonConverter().fromJson),
      _$JsonConverterFromJson<String, OffsetDateTime>(
          json['completedOn'], const OffsetDateTimeJsonConverter().fromJson),
    );

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
