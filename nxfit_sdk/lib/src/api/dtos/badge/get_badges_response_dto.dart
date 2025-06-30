import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../converters/offsetdatetime_json_converter.dart';

part 'get_badges_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
class GetBadgesResponseDto {
  @JsonKey(name: "results")
  final List<Badge> badges;

  const GetBadgesResponseDto(this.badges);

  factory GetBadgesResponseDto.fromJson(Map<String, dynamic> json) => _$GetBadgesResponseDtoFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class Badge {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final double progress;
  final OffsetDateTime? startedOn;
  final OffsetDateTime? endedOn;
  final OffsetDateTime? completedOn;

  const Badge(this.id, this.title, this.description, this.imageUrl, this.progress, this.startedOn, this.endedOn, this.completedOn);

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
}