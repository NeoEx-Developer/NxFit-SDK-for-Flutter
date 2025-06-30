import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class IntegrationModel {
  final String identifier;
  final String displayName;
  final String logoUrl;
  final bool isLocal;
  final bool isConnected;
  final bool isEnabled;
  final OffsetDateTime? lastModifiedOn;

  const IntegrationModel({
    required this.identifier,
    required this.displayName,
    required this.logoUrl,
    required this.isLocal,
    required this.isConnected,
    required this.isEnabled,
    required this.lastModifiedOn
  });
}
