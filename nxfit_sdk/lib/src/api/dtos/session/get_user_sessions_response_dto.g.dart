// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_sessions_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserSessionsResponseDto _$GetUserSessionsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetUserSessionsResponseDto(
      (json['results'] as List<dynamic>)
          .map((e) =>
              GetUserSessionResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['_links'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );
