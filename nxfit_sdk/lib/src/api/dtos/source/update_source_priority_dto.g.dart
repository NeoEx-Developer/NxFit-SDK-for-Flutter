// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_source_priority_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSourcePriorityRequestDto _$UpdateSourcePriorityRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateSourcePriorityRequestDto(
      id: (json['id'] as num).toInt(),
      priority: (json['priority'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateSourcePriorityRequestDtoToJson(
        UpdateSourcePriorityRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'priority': instance.priority,
    };
