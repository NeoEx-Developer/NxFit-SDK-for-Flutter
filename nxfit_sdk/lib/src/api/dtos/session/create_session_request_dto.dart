import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../converters/offsetdatetime_json_converter.dart';

part 'create_session_request_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: true)
@OffsetDateTimeJsonConverter()
class CreateSessionRequestDto {
  final String? activityId;
  final int activityType;
  final int sourceId;
  final String sourceAppName;
  final String? sourceDeviceName;
  final String? sourceDeviceManufacturer;
  final String? sourceDeviceModel;
  final String? sourceDeviceHardwareVersion;
  final String? sourceDeviceSoftwareVersion;
  final String syncDevice;
  final String? syncDeviceOS;
  final String? syncDeviceOSVersion;
  final String? syncDeviceAppVersion;
  final OffsetDateTime? startedOnLocal;
  final OffsetDateTime? endedOnLocal;
  final int activeDurationInSeconds;
  final String? syncId;
  final String? syncVersion;

  const CreateSessionRequestDto(
    this.activityId,
    this.activityType,
    this.sourceId,
    this.sourceAppName,
    this.sourceDeviceName,
    this.sourceDeviceManufacturer,
    this.sourceDeviceModel,
    this.sourceDeviceHardwareVersion,
    this.sourceDeviceSoftwareVersion,
    this.syncDevice,
    this.syncDeviceOS,
    this.syncDeviceOSVersion,
    this.syncDeviceAppVersion,
    this.startedOnLocal,
    this.endedOnLocal,
    this.activeDurationInSeconds,
    this.syncId,
    this.syncVersion,
  );

  Map<String, dynamic> toJson() => _$CreateSessionRequestDtoToJson(this);
}
