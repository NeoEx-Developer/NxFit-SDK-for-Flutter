import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../enums/session_privacy.dart';
import 'session_model.dart';

@immutable
class UserSessionModel extends SessionModel {
  final SourceDetails source;
  final SyncDetails? syncDetails;

  @override
  final ExtendedMetadata metadata;

  const UserSessionModel(
    super.id, {
    required super.activityType,
    required super.activeDuration,
    required super.startedOnLocal,
    required super.endedOnLocal,
    required super.user,
    required this.source,
    required this.metadata,
    super.energyBurnedInKilocalories,
    super.maximalOxygenConsumption,
    this.syncDetails,
    super.heartRateMetrics,
    super.speedMetrics,
    super.cadenceMetrics,
    super.powerMetrics,
    super.floorsClimbedMetrics,
    super.respiratoryRateMetrics
  }) : super(metadata: metadata);
}

@immutable
class SyncDetails {
  final String externalId;
  final OffsetDateTime? completedOn;

  const SyncDetails(this.externalId, this.completedOn);
}

@immutable
class SourceDetails {
  final String integration;
  final String? device;
  final String? app;

  const SourceDetails(this.integration, this.device, this.app);
}

@immutable
class ExtendedMetadata extends Metadata {
  final OffsetDateTime? processedOn;

  const ExtendedMetadata(
      super.createdOn,
      super.updatedOn,
      super.privacy, {
        this.processedOn
    });
}
