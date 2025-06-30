
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../converters/localdate_json_converter.dart';

part 'update_profile_request_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: true)
@LocalDateJsonConverter()
class UpdateProfileRequestDto {
  final String emailAddress;
  final String givenName;
  final String familyName;
  final String imageUrl;
  final LocalDate dateOfBirth;

  const UpdateProfileRequestDto({
    required this.emailAddress,
    required this.givenName,
    required this.familyName,
    required this.imageUrl,
    required this.dateOfBirth
  });

  Map<String, dynamic> toJson() => _$UpdateProfileRequestDtoToJson(this);
}
