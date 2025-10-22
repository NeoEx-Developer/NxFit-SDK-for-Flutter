// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationSample _$LocationSampleFromJson(Map<String, dynamic> json) =>
    LocationSample(
      timestamp: const OffsetDateTimeJsonConverter().fromJson(
        json['timestamp'] as String,
      ),
      intervalInSeconds: (json['intervalInSeconds'] as num).toInt(),
      activeTimeInSeconds: (json['activeTimeInSeconds'] as num).toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      altitude: (json['altitude'] as num?)?.toInt(),
      speed: (json['speed'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
    );
