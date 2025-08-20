import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../converters/offsetdatetime_json_converter.dart';

part 'put_session_request_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: true)
@OffsetDateTimeJsonConverter()
class PutSessionRequestDto {
  final String activityType;
  final OffsetDateTime startedOnLocal;
  final OffsetDateTime endedOnLocal;
  final OffsetDateTime? completedOn;
  final int activeDurationInSeconds;
  final String? syncId;
  final String? syncVersion;
  final String privacy;

  const PutSessionRequestDto({
    required this.activityType,
    required this.startedOnLocal,
    required this.endedOnLocal,
    this.completedOn,
    required this.activeDurationInSeconds,
    this.syncId,
    this.syncVersion,
    required this.privacy
  });

  Map<String, dynamic> toJson() => _$PutSessionRequestDtoToJson(this);
}
