import 'package:meta/meta.dart';
import 'package:nxfit_sdk/src/api/helpers/quoted_string.dart';
import 'package:nxfit_sdk/src/models/source_patch_model.dart';

import '../../api/api_caller.dart';
import '../../api/dtos/source/get_source_response_dto.dart';
import '../../api/dtos/source/list_sources_response_dto.dart';
import '../../api/extensions/http_response_extensions.dart';
import '../../api/patch_doc.dart';
import '../../api/protocols/source_protocol.dart';
import '../../auth/auth_provider.dart';
import '../../models/source_model.dart';
import '../../persistence/cacheable_resource.dart';
import '../source_client.dart';

enum _SourcePropertyPath implements Comparable<_SourcePropertyPath> {
  priority(path: "/priority"),
  include(path: "/include");

  const _SourcePropertyPath({required this.path});

  final String path;

  @override
  int compareTo(_SourcePropertyPath other) => path.compareTo(other.path);
}

@internal
class SourceClientImpl extends SourceClient with ApiCaller {
  final SourceProtocol _protocol;
  final AuthProvider _authProvider;

  SourceClientImpl(this._protocol, this._authProvider);

  @override
  Future<CacheableResource<List<SourceModel>>> list({String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.listSources(eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }

  @override
  Future<CacheableResource<SourceModel>> get(int id, {DateTime? ifModifiedSince, String? eTag}) async {
    final response = await apiCall(() async {
      return await _protocol.getSource(id, ifModifiedSince: ifModifiedSince, eTag: eTag?.toQuotedString());
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }

  @override
  Future<void> patch(
    int id, {
    int? priority,
    bool? isIncluded,
  }) async {
    if (priority == null && isIncluded == null) throw Exception("At least one of priority or isIncluded must be provided");
    if (id <= 0) throw Exception("Invalid source id: $id");

    final patchDocBuilder = PatchDocBuilder();

    if (priority != null) patchDocBuilder.replaceInt(_SourcePropertyPath.priority.path, priority);
    if (isIncluded != null) patchDocBuilder.replaceBool(_SourcePropertyPath.include.path, isIncluded);

    final patchDoc = patchDocBuilder.build();

    await _protocol.patchSource(id, patchDoc.operations);
  }

  @override
  Future<void> patchAll(List<SourcePatchModel> patches) async {
    for (final patch in patches) {
      final patchDocBuilder = PatchDocBuilder();

      if (patch.priority != null) patchDocBuilder.replaceInt(_SourcePropertyPath.priority.path, patch.priority!);
      if (patch.isIncluded != null) patchDocBuilder.replaceBool(_SourcePropertyPath.include.path, patch.isIncluded!);

      final patchDoc = patchDocBuilder.build();

      await _protocol.patchSource(patch.sourceId, patchDoc.operations);
    }
  }
}

@internal
extension GetSourceResponseDtoExtensions on GetSourceResponseDto {
  SourceModel asModel() => SourceModel(
        id,
        integrationIdentifier: integrationIdentifier,
        integrationDisplayName: integrationDisplayName,
        deviceName: deviceName,
        deviceHardwareVersion: deviceHardwareVersion,
        deviceManufacturer: deviceManufacturer,
        deviceOS: deviceOS,
        appName: appName,
        appIdentifier: appIdentifier,
        priority: priority,
        isIncluded: isIncluded,
        createdOn: createdOn.localDateTime.toDateTimeLocal(),
        updatedOn: updatedOn.localDateTime.toDateTimeLocal(),
      );
}

@internal
extension ListSourcesResponseDtoExtensions on ListSourcesResponseDto {
  List<SourceModel> asModel() {
    return sources
        .map((source) => SourceModel(
              source.id,
              integrationIdentifier: source.integrationIdentifier,
              integrationDisplayName: source.integrationDisplayName,
              deviceName: source.deviceName,
              deviceHardwareVersion: source.deviceHardwareVersion,
              deviceManufacturer: source.deviceManufacturer,
              deviceOS: source.deviceOS,
              appName: source.appName,
              appIdentifier: source.appIdentifier,
              priority: source.priority,
              isIncluded: source.isIncluded,
              createdOn: source.createdOn.localDateTime.toDateTimeLocal(),
              updatedOn: source.updatedOn.localDateTime.toDateTimeLocal(),
            ))
        .toList();
  }
}
