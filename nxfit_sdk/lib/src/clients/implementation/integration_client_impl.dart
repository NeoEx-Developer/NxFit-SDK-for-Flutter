import 'package:meta/meta.dart';

import '../../api/api_caller.dart';
import '../../api/dtos/integration/get_user_integration_response_dto.dart';
import '../../api/dtos/integration/get_user_integrations_response_dto.dart';
import '../../api/dtos/integration/put_user_integration_response_dto.dart';
import '../../api/extensions/http_response_extensions.dart';
import '../../api/helpers/quoted_string.dart';
import '../../api/protocols/integration_protocol.dart';
import '../../models/integration_connection_model.dart';
import '../../models/integration_model.dart';
import '../../persistence/cacheable_resource.dart';
import '../integration_client.dart';

@internal
class IntegrationClientImpl extends IntegrationClient with ApiCaller {
  final IntegrationProtocol _protocol;

  IntegrationClientImpl(this._protocol);

  @override
  Future<CacheableResource<IntegrationModel>> getIntegration(String identifier, {String? eTag, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.getUserIntegration(identifier, eTag: eTag?.toQuotedString(), ifModifiedSince: ifModifiedSince );
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }

  @override
  Future<CacheableResource<List<IntegrationModel>>> listIntegrations({String? eTag, DateTime? ifModifiedSince}) async {
    final response = await apiCall(() async {
      return await _protocol.getUserIntegrations( eTag: eTag?.toQuotedString(), ifModifiedSince: ifModifiedSince);
    });

    return response.asCacheableResource((dto) => dto.asModel());
  }


  @override
  Future<IntegrationConnectedModel> connect(String identifier, String redirectUri) async {
    final response = await apiCall(() async {
      return await _protocol.connectUserIntegration(identifier, redirectUri);
    });

    return response.data.asModel();
  }

  @override
  Future<void> disconnect(String identifier) async {
    await apiCall(() async {
      return _protocol.disconnectUserIntegration(identifier);
    });
  }


}

@internal
extension GetUserIntegrationsResponseDtoExtensions on GetUserIntegrationsResponseDto {
  List<IntegrationModel> asModel() {
    return integrations
        .map((integration) => IntegrationModel(
              identifier: integration.identifier,
              displayName: integration.displayName,
              logoUrl: integration.logoUrl,
              isLocal: integration.isLocal,
              isConnected: integration.isConnected,
              isEnabled: integration.isEnabled,
              lastModifiedOn: integration.updatedOn,
            ))
        .toList();
  }
}

@internal
extension on GetUserIntegrationResponseDto {
  IntegrationModel asModel() {
    return IntegrationModel(
      identifier: identifier,
      displayName: displayName,
      logoUrl: logoUrl,
      isLocal: isLocal,
      isConnected: isConnected,
      isEnabled: isEnabled,
      lastModifiedOn: updatedOn,
    );
  }
}

@internal
extension on PutUserIntegrationResponseDto {
  IntegrationConnectedModel asModel() {
    return IntegrationConnectedModel(
        authorizeUrl: authorizeUrl
    );
  }
}
