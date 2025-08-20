import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../enums/session_privacy.dart';
import 'session_model.dart';

@immutable
class UserSessionModel extends SessionModel {
  final String sourceIntegration;
  final String? sourceDevice;
  final String? sourceApp;
  final String? syncId;
  final String? syncVersion;
  final SourceDetails source;
  final Metadata metadata;

  const UserSessionModel(
    super.id, {
    required super.activityType,
    required super.activeDuration,
    required this.sourceIntegration,
    required super.startedOnLocal,
    required super.endedOnLocal,
    required super.createdOn,
    required super.updatedOn,
    required super.user,
    required this.source,
    super.energyBurnedInCalories,
    super.maximalOxygenConsumption,
    this.sourceDevice,
    this.sourceApp,
    this.syncId,
    this.syncVersion,
    super.heartRateMetrics,
    super.speedMetrics,
    super.cadenceMetrics,
    super.powerMetrics,
    required this.metadata,
  });
}

@immutable
class SourceDetails {
  final String integration;
  final String? device;
  final String? app;

  const SourceDetails(this.integration, this.device, this.app);
}

@immutable
class Metadata {
  final OffsetDateTime? completedOn;
  final SessionPrivacy privacy;

  const Metadata({ this.completedOn, required this.privacy });
}
