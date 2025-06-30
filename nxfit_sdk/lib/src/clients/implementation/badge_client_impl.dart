import 'package:meta/meta.dart';

import '../../api/api_caller.dart';
import '../../api/dtos/badge/get_badges_response_dto.dart';
import '../../api/extensions/http_response_extensions.dart';
import '../../api/helpers/quoted_string.dart';
import '../../api/protocols/badge_protocol.dart';
import '../../models/badge_model.dart';
import '../../persistence/cacheable_resource.dart';
import '../badge_client.dart';

@internal
class BadgeClientImpl extends BadgeClient with ApiCaller {
  final BadgeProtocol _protocol;

  BadgeClientImpl(this._protocol);

  @override
  Future<CacheableResource<List<BadgeModel>>> list({DateTime? date, int? limit, String? eTag}) async {
    final response = await apiCall(() async {

      return await _protocol.getPersonalBadges(
        date ?? DateTime.now(),
        limit: limit,
        etag: eTag?.toQuotedString(),
      );
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }
}

@internal
extension GetBadgesResponseDtoExtensions on GetBadgesResponseDto {
  List<BadgeModel> asModel() {
    return badges.map((e) => BadgeModel(e.id, e.title, e.description, e.imageUrl, e.progress, e.startedOn, e.endedOn, e.completedOn)).toList();
  }
}
