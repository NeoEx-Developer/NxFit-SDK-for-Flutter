// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_samples_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSampleRequestDto<T> _$ListSampleRequestDtoFromJson<T>(
  Map<String, dynamic> json,
) => ListSampleRequestDto<T>(
  (json['results'] as List<dynamic>)
      .map((e) => SampleModelConverter<T>().fromJson(e as Object))
      .toList(),
);
