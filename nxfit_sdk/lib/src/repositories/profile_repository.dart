import '../models/personal_profile_model.dart';
import '../models/public_profile_model.dart';

abstract class ProfileRepository {
  Stream<PersonalProfileModel> getPersonalProfile();
  Stream<PublicProfileModel> getPublicProfile(int userId);
}
