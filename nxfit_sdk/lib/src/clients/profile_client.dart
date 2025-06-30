import 'dart:typed_data';

import 'package:time_machine/time_machine.dart';

import '../enums/session_privacy.dart';
import '../models/personal_profile_model.dart';
import '../models/profile_settings_model.dart';
import '../models/public_profile_model.dart';
import '../persistence/cacheable_resource.dart';

/// Interface to the Profile resource
abstract class ProfileClient {
  /// Get the profile of the currently authenticated user. This call supports change detection, however setting both the
  /// [ifModifiedSince] and [eTag] to null will always fetch the current resource. If both are set, [ifModifiedSince] takes precedence.
  ///
  /// Returns a [PersonalProfileModel] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<PersonalProfileModel>> getPersonalProfile({ DateTime? ifModifiedSince, String? eTag });

  /// Get the public profile of a particular user.
  ///
  /// This call supports change detection, however setting both the [ifModifiedSince] and [eTag] to null will always fetch the
  /// current resource. If both are set, [ifModifiedSince] takes precedence.
  ///
  /// Returns a [PersonalProfileModel] as a [CacheableResource]
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<PublicProfileModel>> getPublicProfile(int userId, { DateTime? ifModifiedSince, String? eTag });

  /// Update the user's profile. Not all properties in the ProfileModel can be updated, so this method accepts only parameters
  /// that can be updated.
  Future<void> update(String emailAddress, String givenName, String familyName, String imageUrl, LocalDate dateOfBirth);

  /// Will upload an image file in [Uint8List] format to the server and make it the current profile image for the current user.
  /// The file must be in one of the following formats: PNG, JPG, WEBP.
  Future<void> updateImage(Uint8List imageBytes);

  /// Will delete the user's current profile image from storage and set the default image as the user's profile image.
  Future<void> deleteImage();

  /// Fetches the current user settings. This call supports change detection, however setting both the [ifModifiedSince]
  /// and [eTag] to null will always fetch the current resource. If both are set, [ifModifiedSince] takes precedence.
  ///
  /// Returns a [ProfileSettingsModel] as a [CacheableResource]
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<ProfileSettingsModel>> getSettings({ DateTime? ifModifiedSince, String? eTag });

  /// Updates the current user settings.
  Future<void> updateSettings(SessionPrivacy defaultSessionPrivacy, int? primaryLocationId);
}
