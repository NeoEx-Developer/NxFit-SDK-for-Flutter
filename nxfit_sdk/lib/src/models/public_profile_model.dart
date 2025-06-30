import 'package:meta/meta.dart';

@immutable
class PublicProfileModel {
  final int id;
  final String givenName;
  final String familyName;
  final String imageUrl;

  const PublicProfileModel({
    required this.id,
    required this.givenName,
    required this.familyName,
    required this.imageUrl,
  });
}
