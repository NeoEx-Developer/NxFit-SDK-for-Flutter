import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../converters/offsetdatetime_json_converter.dart';

part 'get_user_integrations_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
class GetUserIntegrationsResponseDto {
  @JsonKey(name: 'results')
  final List<GetUserIntegrationsResponseDto_Integration> integrations;

  const GetUserIntegrationsResponseDto({required this.integrations});

  factory GetUserIntegrationsResponseDto.fromJson(Map<String, dynamic> json) => _$GetUserIntegrationsResponseDtoFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class GetUserIntegrationsResponseDto_Integration {
  final String identifier;
  final String displayName;
  final String logoUrl;
  final bool isConnected;
  final OffsetDateTime updatedOn;

  const GetUserIntegrationsResponseDto_Integration({
    required this.identifier,
    required this.displayName,
    required this.logoUrl,
    required this.isConnected,
    required this.updatedOn,
  });

  factory GetUserIntegrationsResponseDto_Integration.fromJson(Map<String, dynamic> json) => _$GetUserIntegrationsResponseDto_IntegrationFromJson(json);
}
