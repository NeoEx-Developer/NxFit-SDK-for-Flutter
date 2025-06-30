import 'package:meta/meta.dart';

@immutable
class HeartRateZoneSummariesModel {
  final List<HeartRateZoneSummaryModel> heartRateZoneSummaries;

  const HeartRateZoneSummariesModel(this.heartRateZoneSummaries);

  @override
  String toString() {
    String st = "";
    heartRateZoneSummaries.forEach((element) {
      st += "{${element.toString()}}";
    });

    return st;
  }
}

@immutable
class HeartRateZoneSummaryModel {
  final int zone;
  final int minBPM;
  final int maxBPM;
  final Duration duration;

  const HeartRateZoneSummaryModel(this.zone, this.minBPM, this.maxBPM, this.duration);

  @override
  String toString() => "zone: $zone minBPM: $minBPM maxBPM: $maxBPM duration: $duration";
}
