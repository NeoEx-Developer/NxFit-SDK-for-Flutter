import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'create_session_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
class CreateSessionResponseDto {
  final int id;

  const CreateSessionResponseDto(this.id);

  factory CreateSessionResponseDto.fromJson(Map<String, dynamic> json) => _$CreateSessionResponseDtoFromJson(json);
}