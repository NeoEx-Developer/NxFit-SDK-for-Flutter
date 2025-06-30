import 'package:meta/meta.dart';

import '../../cache/persistent_cached_resource.dart';
import '../../clients/profile_client.dart';
import '../../models/personal_profile_model.dart';
import '../../models/public_profile_model.dart';
import '../profile_repository.dart';

@internal
class ProfileRepositoryImpl extends ProfileRepository {
  final PersistentCachedResource _cachedResource;
  final ProfileClient _client;

  ProfileRepositoryImpl(this._cachedResource, this._client);

  @override
  Stream<PersonalProfileModel> getPersonalProfile() {
    return _client.getPersonalProfile()
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }

  @override
  Stream<PublicProfileModel> getPublicProfile(int userId) {
    return _client.getPublicProfile(userId)
        .asStream()
        .map((cacheableResource) => cacheableResource.value);
  }
}
