import '../models/integration_model.dart';
import '../persistence/cacheable_resource.dart';

/// Interface for the Integration resource
abstract class IntegrationClient {
  /// Fetches the integration for the given [identifier].
  ///
  /// This call supports change detection, however setting both the [ifModifiedSince] and [eTag] to null will always fetch the
  /// current resource. If both are set, [ifModifiedSince] takes precedence.
  ///
  /// Returns a [IntegrationModel] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<IntegrationModel>> getIntegration(String identifier, {String? eTag, DateTime? ifModifiedSince});

  /// Fetches all integrations.
  ///
  /// This call supports change detection, however setting both the [ifModifiedSince] and [eTag] to null will always fetch the
  /// current resource. If both are set, [ifModifiedSince] takes precedence.
  ///
  /// Returns a [List&lt;IntegrationModel&gt;] as a [CacheableResource].
  ///
  /// Throws [NotModifiedException] if no change was detected.
  Future<CacheableResource<List<IntegrationModel>>> listIntegrations({String? eTag, DateTime? ifModifiedSince});

  /// Gets the authorize URL for the given [identifier].
  ///
  /// Generates a URL to be used to launch the user through the integration authorize process. Part of the URL includes a redirect
  /// URL which is used to send the result of the authorize process back to your app. The redirect url contains the application
  /// package ID of the app initiating the authorize process. This is done to ensure that the application initiating the authorize
  /// process receives the result from the browser. An IntentFilter is required to make this work.
  Future<String?> getAuthorizeUri(String identifier, String redirectUri);

  /// Disconnects the integration with the given [identifier]. The current user will no longer have fitness data sent to the NxFit service.
  Future<void> disconnect(String identifier);
}
