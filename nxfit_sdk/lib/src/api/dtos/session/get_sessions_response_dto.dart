import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'get_session_response_dto.dart';

part 'get_sessions_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
class GetSessionsResponseDto {
  @JsonKey(name: "results")
  final List<GetSessionResponseDto> sessions;

  @JsonKey(name: "_links")
  final Map<String, String>? links;

  const GetSessionsResponseDto(this.sessions, this.links);

  factory GetSessionsResponseDto.fromJson(Map<String, dynamic> json) => _$GetSessionsResponseDtoFromJson(json);
}