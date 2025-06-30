import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../converters/offsetdatetime_json_converter.dart';

part 'heart_rate_summary_sample.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class HeartRateSummarySample {
  final int intervalInSeconds;
  final int activeTimeInSeconds;
  final double avgBPM;
  final int minBPM;
  final int maxBPM;

  const HeartRateSummarySample({
    required this.intervalInSeconds,
    required this.activeTimeInSeconds,
    required this.avgBPM,
    required this.minBPM,
    required this.maxBPM,
  });

  factory HeartRateSummarySample.fromJson(Map<String, dynamic> json) => _$HeartRateSummarySampleFromJson(json);
}
