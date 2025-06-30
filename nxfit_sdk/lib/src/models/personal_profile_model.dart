import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class PersonalProfileModel {
  final int id;
  final int tenantId;
  final String? referenceId;
  final String emailAddress;
  final String givenName;
  final String familyName;
  final String imageUrl;
  final LocalDate dateOfBirth;
  final List<int> heartRateZoneThresholds;

  const PersonalProfileModel({
    required this.id,
    required this.tenantId,
    required this.referenceId,
    required this.emailAddress,
    required this.givenName,
    required this.familyName,
    required this.imageUrl,
    required this.dateOfBirth,
    required this.heartRateZoneThresholds,
  });
}