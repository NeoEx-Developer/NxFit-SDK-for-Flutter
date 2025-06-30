import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'update_source_request_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: true)
class UpdateSourceRequestDto {
  final int priority;
  final bool include;

  const UpdateSourceRequestDto({
    required this.priority,
    required this.include,
  });

  Map<String, dynamic> toJson() => _$UpdateSourceRequestDtoToJson(this);
}
