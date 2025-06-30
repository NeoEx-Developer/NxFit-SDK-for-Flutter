import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../api/api_caller.dart';
import '../../api/dtos/profile/get_personal_profile_response_dto.dart';
import '../../api/dtos/profile/get_profile_settings_response_dto.dart';
import '../../api/dtos/profile/get_public_profile_response_dto.dart';
import '../../api/dtos/profile/update_profile_request_dto.dart';
import '../../api/dtos/profile/update_profile_settings_request_dto.dart';
import '../../api/extensions/http_response_extensions.dart';
import '../../api/helpers/quoted_string.dart';
import '../../api/protocols/profile_protocol.dart';
import '../../enums/session_privacy.dart';
import '../../models/personal_profile_model.dart';
import '../../models/profile_settings_model.dart';
import '../../models/public_profile_model.dart';
import '../../persistence/cacheable_resource.dart';
import '../profile_client.dart';

@internal
class ProfileClientImpl extends ProfileClient with ApiCaller {
  final ProfileProtocol _protocol;

  ProfileClientImpl(this._protocol);

  @override
  Future<CacheableResource<PersonalProfileModel>> getPersonalProfile({DateTime? ifModifiedSince, String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.getPersonalProfile(ifModifiedSince: ifModifiedSince, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }

  @override
  Future<CacheableResource<PublicProfileModel>> getPublicProfile(int userId, {DateTime? ifModifiedSince, String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.getPublicProfile(userId: userId, ifModifiedSince: ifModifiedSince, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }

  @override
  Future<void> update(String emailAddress, String givenName, String familyName, String imageUrl, LocalDate dateOfBirth) async {
    await apiCall(() async {
      await _protocol.update(UpdateProfileRequestDto(
        emailAddress: emailAddress,
        givenName: givenName,
        familyName: familyName,
        imageUrl: imageUrl,
        dateOfBirth: dateOfBirth,
      ));
    });
  }

  @override
  Future<void> updateImage(Uint8List imageBytes) async {
    await apiCall(() async {
      final stream = Stream.fromIterable(imageBytes.map((e) => [e]));

      // TODO Find a better way to upload a binary
      //_protocol.updateImage("image/jpeg", stream);

      // //final stream = Stream.fromIterable(imageBytes.map((e) => [e]));
      // //_protocol.updateImage("image/jpeg", stream);
      // _protocol.updateImage("image/jpeg", imageBytes);
    });
  }

  @override
  Future<void> deleteImage() async {
    await apiCall(() async {
      await _protocol.deleteImage();
    });
  }

  @override
  Future<CacheableResource<ProfileSettingsModel>> getSettings({ DateTime? ifModifiedSince, String? eTag }) async {
    final response = await apiCall(() async {
      return await _protocol.getSettings(ifModifiedSince: ifModifiedSince, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }

  @override
  Future<void> updateSettings(SessionPrivacy defaultSessionPrivacy, int? primaryLocationId) async {
    await apiCall(() async {
      await _protocol.updateSettings(UpdateProfileSettingsRequestDto(
        defaultSessionPrivacy: defaultSessionPrivacy.name,
        primaryLocationId: primaryLocationId,
      ));
    });
  }
}

@internal
extension GetPersonalProfileResponseDtoExtensions on GetPersonalProfileResponseDto {
  PersonalProfileModel asModel() {
    return PersonalProfileModel(
      id: id,
      tenantId: tenantId,
      referenceId: referenceId,
      emailAddress: emailAddress,
      givenName: givenName,
      familyName: familyName,
      imageUrl: imageUrl,
      dateOfBirth: dateOfBirth,
      heartRateZoneThresholds: heartRateZoneThresholds,
    );
  }
}

@internal
extension GetPublicProfileResponseDtoExtensions on GetPublicProfileResponseDto {
  PublicProfileModel asModel() {
    return PublicProfileModel(
      id: id,
      givenName: givenName,
      familyName: familyName,
      imageUrl: imageUrl,
    );
  }
}

@internal
extension GetProfileSettingsResponseDtoExtensions on GetProfileSettingsResponseDto {
  ProfileSettingsModel asModel() {
    return ProfileSettingsModel(defaultSessionPrivacy: SessionPrivacy.of(defaultSessionPrivacy), primaryLocationId: primaryLocationId);
  }
}
