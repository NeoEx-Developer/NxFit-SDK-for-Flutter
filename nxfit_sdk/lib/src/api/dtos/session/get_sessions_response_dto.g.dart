// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sessions_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSessionsResponseDto _$GetSessionsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetSessionsResponseDto(
      (json['results'] as List<dynamic>)
          .map((e) => GetSessionResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['_links'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );
