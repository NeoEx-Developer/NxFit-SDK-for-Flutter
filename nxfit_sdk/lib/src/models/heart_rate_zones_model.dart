import 'package:meta/meta.dart';

@immutable
class HeartRateZonesModel {
  final List<HeartRateZoneModel> heartRateZones;

  const HeartRateZonesModel(this.heartRateZones);
}

@immutable
class HeartRateZoneModel {
  final int zone;
  final int minBPM;
  final int maxBPM;

  const HeartRateZoneModel(this.zone, this.minBPM, this.maxBPM);
}
