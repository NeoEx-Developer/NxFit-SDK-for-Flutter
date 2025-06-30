import 'package:meta/meta.dart';

@immutable
class HeartRateSummarySampleModel {
  final int intervalInSeconds;
  final Duration activeTime;
  final double avgBPM;
  final int minBPM;
  final int maxBPM;

  const HeartRateSummarySampleModel({
    required this.intervalInSeconds,
    required this.activeTime,
    required this.avgBPM,
    required this.minBPM,
    required this.maxBPM,
  });
}
