import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api/interceptors/auth_interceptor.dart';
import 'api/interceptors/cache_control_interceptor.dart';
import 'api/protocols/badge_protocol.dart';
import 'api/protocols/integration_protocol.dart';
import 'api/protocols/profile_protocol.dart';
import 'api/protocols/session_protocol.dart';
import 'api/protocols/session_sample_protocol.dart';
import 'api/protocols/session_summary_protocol.dart';
import 'api/protocols/source_protocol.dart';
import 'auth/auth_provider.dart';
import 'auth/auth_state.dart';
import 'clients/badge_client.dart';
import 'clients/implementation/badge_client_impl.dart';
import 'clients/implementation/integration_client_impl.dart';
import 'clients/implementation/profile_client_impl.dart';
import 'clients/implementation/session_client_impl.dart';
import 'clients/implementation/session_sample_client_impl.dart';
import 'clients/implementation/session_summary_client_impl.dart';
import 'clients/implementation/source_client_impl.dart';
import 'clients/integration_client.dart';
import 'clients/profile_client.dart';
import 'clients/session_client.dart';
import 'clients/session_sample_client.dart';
import 'clients/session_summary_client.dart';
import 'clients/source_client.dart';
import 'config/configuration_provider.dart';
import 'config/http_logger_level.dart';

part "nxfit_impl.dart";

/// The NxFit abstraction provides all the clients needed to access NxFit services. An NxFit *client* is a container that provides a set of HTTP
/// calls to the NXFit service. A single call can retrieve single items or a list of items, it can create or update items, or in
/// some cases remove items on the server.
///
/// Use the [NXFit.build] method to build an instance. Each call to [NxFit.build] returns a new instance so it's recommended that a single
/// instance is used throughout the application.
///
/// Clients are used to access data from the NxFit service API via HTTP. Clients are not responsible for caching
/// but can facilitate caching via the [CacheableResource] that is returned by the client calls that fetch data.
/// The [CacheableResource] contains *eTag* and *lastModifiedOn* properties which are extracted from the
/// HTTP response headers with similar names. These can then be passed into client methods that accept either an *eTag* or
/// *ifModifiedSince* parameter on subsequent calls. The *eTag* value will be set to the **If-None-Match** header and the *ifModifiedSince*
/// value will be set to the **If-Modified-Since** header on the request. Some client calls may only support one of the two cache control parameters,
/// and those that support both will favour the *ifModifiedSince* parameter.
abstract class NxFit {
  /// A reference to the AuthProvider used when building the current instance.
  AuthProvider get authProvider;

  BadgeClient get badgeClient;
  IntegrationClient get integrationClient;
  ProfileClient get profileClient;
  SessionClient get sessionClient;
  SessionSummaryClient get sessionSummaryClient;
  SessionSampleClient get sessionSampleClient;
  SourceClient get sourceClient;

  /// Builds a concrete implementation of the [NxFit] abstraction. When the build completes, all the contained clients
  /// are fully initialized and ready to use.
  ///
  /// Each call to [build] returns a new instance so it's recommended that the result of this call be reused throughout the application.
  ///
  /// The [configurationProvider] is used to provide the **baseUrl** to the NxFit API service, along with other configurable features.
  ///
  /// The [authProvider] is used to provide the current authentication state to the NxFit clients. The NxFit SDK expects that the consuming
  /// application is managing the authentication state. As the user logs in or out, the supplied [authProvider] will be updated to reflect the
  /// new authentication state.
  ///
  /// See also [ConfigurationProvider] and [AuthProvider].
  static NxFit build(final ConfigurationProvider configurationProvider, final AuthProvider authProvider) {
    return _NxFitImpl.build(configurationProvider, authProvider);
  }
}
