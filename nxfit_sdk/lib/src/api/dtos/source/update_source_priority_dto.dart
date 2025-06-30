import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'update_source_priority_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: true)
class UpdateSourcePriorityRequestDto {
  final int id;
  final int priority;

  const UpdateSourcePriorityRequestDto({
    required this.id,
    required this.priority,
  });

  Map<String, dynamic> toJson() => _$UpdateSourcePriorityRequestDtoToJson(this);
}
