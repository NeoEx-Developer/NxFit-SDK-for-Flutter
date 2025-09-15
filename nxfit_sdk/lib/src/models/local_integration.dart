import 'package:meta/meta.dart';
import 'package:nxfit_sdk/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_integration.g.dart';

@immutable
@JsonSerializable()
class LocalIntegration {
  final String identifier;
  final bool isConnected;
  final IntegrationAvailability availability;

  const LocalIntegration(this.identifier, this.isConnected, this.availability);

  factory LocalIntegration.fromJson(Map<String, dynamic> json) =>
      _$LocalIntegrationFromJson(json);
  Map<String, dynamic> toJson() => _$LocalIntegrationToJson(this);
}
