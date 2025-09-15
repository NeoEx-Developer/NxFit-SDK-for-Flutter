import 'package:meta/meta.dart';
import 'package:nxfit_sdk/src/enums/integration_availability.dart';
import 'package:time_machine/time_machine.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'integration_model.g.dart';

@immutable
@CopyWith()
class IntegrationModel {
  final String identifier;
  final String displayName;
  final String logoUrl;
  final bool isConnected;
  final IntegrationAvailability availability;
  final OffsetDateTime? lastModifiedOn;

  const IntegrationModel({
    required this.identifier,
    required this.displayName,
    required this.logoUrl,
    required this.isConnected,
    required this.availability,
    required this.lastModifiedOn
  });
}
