import 'package:meta/meta.dart';

@immutable
class SourceModel {
  final int id;
  final String integrationIdentifier;
  final String? integrationDisplayName;
  final String? deviceName;
  final String? deviceHardwareVersion;
  final String? deviceManufacturer;
  final String? deviceOS;
  final String? appName;
  final String? appIdentifier;
  final int priority;
  final bool isIncluded;
  final DateTime createdOn;
  final DateTime? updatedOn;

  const SourceModel(
    this.id, {
    required this.integrationIdentifier,
    required this.integrationDisplayName,
    this.deviceName,
    this.deviceHardwareVersion,
    this.deviceManufacturer,
    this.deviceOS,
    this.appName,
    this.appIdentifier,
    required this.priority,
    required this.isIncluded,
    required this.createdOn,
    this.updatedOn,
  });

  @override
  String toString() {
    return "{ $id: $integrationIdentifier, $deviceName, $deviceManufacturer, $priority, $isIncluded, $createdOn, $updatedOn }";
  }
}
