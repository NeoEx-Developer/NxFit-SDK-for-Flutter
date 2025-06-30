import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'get_public_profile_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
class GetPublicProfileResponseDto {
  final int id;
  final String givenName;
  final String familyName;
  final String imageUrl;

  const GetPublicProfileResponseDto({
    required this.id,
    required this.givenName,
    required this.familyName,
    required this.imageUrl,
  });

  factory GetPublicProfileResponseDto.fromJson(Map<String, dynamic> json) => _$GetPublicProfileResponseDtoFromJson(json);
}
