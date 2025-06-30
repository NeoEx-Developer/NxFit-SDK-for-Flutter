import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'post_profile_image_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
class PostProfileImageResponseDto {
  final String imageUrl;

  const PostProfileImageResponseDto({
    required this.imageUrl,
  });

  factory PostProfileImageResponseDto.fromJson(Map<String, dynamic> json) => _$PostProfileImageResponseDtoFromJson(json);
}
