import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'get_user_session_response_dto.dart';

part 'get_user_sessions_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
class GetUserSessionsResponseDto {
  @JsonKey(name: "results")
  final List<GetUserSessionResponseDto> sessions;

  @JsonKey(name: "_links")
  final Map<String, String>? links;

  const GetUserSessionsResponseDto(this.sessions, this.links);

  factory GetUserSessionsResponseDto.fromJson(Map<String, dynamic> json) => _$GetUserSessionsResponseDtoFromJson(json);
}
//
// @internal
// @immutable
// @JsonSerializable(createToJson: false)
// @OffsetDateTimeJsonConverter()
// class Session {
//   final int id;
//   final String? activityId;
//   final String activityType;
//   final int sourceId;
//   final String? syncDevice;
//   final int activeDurationInSeconds;
//   final OffsetDateTime startedOnLocal;
//   final OffsetDateTime endedOnLocal;
//   final OffsetDateTime? completedOn;
//   final OffsetDateTime? processedOn;
//   final OffsetDateTime createdOn;
//   final OffsetDateTime updatedOn;
//
//   const Session(
//     this.id,
//     this.activityId,
//     this.activityType,
//     this.sourceId,
//     this.syncDevice,
//     this.activeDurationInSeconds,
//     this.startedOnLocal,
//     this.endedOnLocal,
//     this.completedOn,
//     this.processedOn,
//     this.createdOn,
//     this.updatedOn,
//   );
//
//   factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
// }
