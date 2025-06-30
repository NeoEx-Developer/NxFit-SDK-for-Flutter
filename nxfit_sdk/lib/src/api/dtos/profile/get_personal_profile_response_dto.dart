
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../converters/localdate_json_converter.dart';

part 'get_personal_profile_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@LocalDateJsonConverter() ////@LocalDateTimeJsonConverter()
class GetPersonalProfileResponseDto {
  final int id;
  final int tenantId;
  final String? referenceId;
  final String emailAddress;
  final String givenName;
  final String familyName;
  final String imageUrl;
  final LocalDate dateOfBirth;
  final List<int> heartRateZoneThresholds;

  const GetPersonalProfileResponseDto({
    required this.id,
    required this.tenantId,
    required this.referenceId,
    required this.emailAddress,
    required this.givenName,
    required this.familyName,
    required this.imageUrl,
    required this.dateOfBirth,
    required this.heartRateZoneThresholds,
  });

  factory GetPersonalProfileResponseDto.fromJson(Map<String, dynamic> json) => _$GetPersonalProfileResponseDtoFromJson(json);
}