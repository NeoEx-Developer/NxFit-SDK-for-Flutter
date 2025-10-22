// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_source_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSourceRequestDto _$UpdateSourceRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateSourceRequestDto(
  priority: (json['priority'] as num).toInt(),
  include: json['include'] as bool,
);

Map<String, dynamic> _$UpdateSourceRequestDtoToJson(
  UpdateSourceRequestDto instance,
) => <String, dynamic>{
  'priority': instance.priority,
  'include': instance.include,
};
