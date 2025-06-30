import 'package:meta/meta.dart';

import '../enums/session_privacy.dart';

@immutable
class ProfileSettingsModel {
  final SessionPrivacy defaultSessionPrivacy;
  final int? primaryLocationId;

  const ProfileSettingsModel({
    required this.defaultSessionPrivacy,
    this.primaryLocationId,
  });
}
