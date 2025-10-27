import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../enums/activity_type.dart';

@immutable
class SessionModel {
  final int id;
  final ActivityType activityType;
  final Duration activeDuration;
  final int? energyBurnedInKilocalories;
  final double? maximalOxygenConsumption;
  final OffsetDateTime startedOnLocal;
  final OffsetDateTime endedOnLocal;
  final OffsetDateTime createdOn;
  final OffsetDateTime updatedOn;

  final UserDetails user;
  final HeartRateMetrics? heartRateMetrics;
  final SpeedMetrics? speedMetrics;
  final CadenceMetrics? cadenceMetrics;
  final PowerMetrics? powerMetrics;

  const SessionModel(
    this.id, {
    required this.activityType,
    required this.activeDuration,
    required this.startedOnLocal,
    required this.endedOnLocal,
    required this.createdOn,
    required this.updatedOn,
    required this.user,
    this.energyBurnedInKilocalories,
    this.maximalOxygenConsumption,
    this.heartRateMetrics,
    this.speedMetrics,
    this.cadenceMetrics,
    this.powerMetrics,
  });
}

@immutable
class UserDetails {
  final int id;
  final String name;
  final String profileImageUrl;

  const UserDetails(this.id, this.name, this.profileImageUrl);
}

@immutable
class HeartRateMetrics {
  final double avgBPM;
  final int maxBPM;
  final int minBPM;

  const HeartRateMetrics(this.avgBPM, this.maxBPM, this.minBPM);
}

@immutable
class SpeedMetrics {
  final double avgSpeedInMetersPerSecond;
  final double maxSpeedInMetersPerSecond;
  final double minSpeedInMetersPerSecond;

  const SpeedMetrics(this.avgSpeedInMetersPerSecond, this.maxSpeedInMetersPerSecond, this.minSpeedInMetersPerSecond);
}

@immutable
class CadenceMetrics {
  final double avgCadencePerMinute;
  final int maxCadencePerMinute;
  final int minCadencePerMinute;
  final String? cadenceUnitShort;
  final String? cadenceUnitFull;

  const CadenceMetrics(
    this.avgCadencePerMinute,
    this.maxCadencePerMinute,
    this.minCadencePerMinute,
    this.cadenceUnitShort,
    this.cadenceUnitFull,
  );
}

@immutable
class PowerMetrics {
  final double avgPowerInWatts;
  final int maxPowerInWatts;
  final int minPowerInWatts;

  const PowerMetrics(this.avgPowerInWatts, this.maxPowerInWatts, this.minPowerInWatts);
}
