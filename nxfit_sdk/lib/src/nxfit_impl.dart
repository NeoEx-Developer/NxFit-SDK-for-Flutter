part of "nxfit.dart";

class _NxFitImpl implements NxFit {
  @override
  final BadgeClient badgeClient;

  @override
  final IntegrationClient integrationClient;

  @override
  final ProfileClient profileClient;

  @override
  final SessionClient sessionClient;

  @override
  final SessionSummaryClient sessionSummaryClient;

  @override
  final SessionSampleClient sessionSampleClient;

  @override
  final SourceClient sourceClient;

  @override
  final AuthProvider authProvider;

  _NxFitImpl._(
    this.authProvider, {
    required this.badgeClient,
    required this.integrationClient,
    required this.profileClient,
    required this.sessionClient,
    required this.sessionSummaryClient,
    required this.sessionSampleClient,
    required this.sourceClient,
  });

  static NxFit build(final ConfigurationProvider configurationProvider, final AuthProvider authProvider) {
    final httpClient = _createHttpClient(authProvider, configurationProvider.httpLoggerLevel, configurationProvider.connectTimeoutSeconds);

    return _NxFitImpl._(authProvider,
        badgeClient: BadgeClientImpl(BadgeProtocol(httpClient, baseUrl: configurationProvider.baseUrl)),
        integrationClient: IntegrationClientImpl(IntegrationProtocol(httpClient, baseUrl: configurationProvider.baseUrl)),
        profileClient: ProfileClientImpl(ProfileProtocol(httpClient, baseUrl: configurationProvider.baseUrl)),
        sessionClient: SessionClientImpl(SessionProtocol(httpClient, baseUrl: configurationProvider.baseUrl), authProvider),
        sessionSummaryClient: SessionSummaryClientImpl(SessionSummaryProtocol(httpClient, baseUrl: configurationProvider.baseUrl), authProvider),
        sessionSampleClient: SessionSampleClientImpl(SessionSampleProtocol(httpClient, baseUrl: configurationProvider.baseUrl), authProvider),
        sourceClient: SourceClientImpl(SourceProtocol(httpClient, baseUrl: configurationProvider.baseUrl), authProvider));
  }

  static Dio _createHttpClient(
    final AuthProvider authProvider,
    HttpLoggerLevel httpLoggerLevel,
    int connectTimeoutSeconds,
  ) {
    Dio dio = Dio(BaseOptions(connectTimeout: Duration(seconds: connectTimeoutSeconds)));

    dio.interceptors.add(AuthInterceptor(() => authProvider.currentAuthState.accessToken));
    dio.interceptors.add(CacheControlInterceptor());

    // For debug builds, we include a logger to help with debugging.
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: httpLoggerLevel == HttpLoggerLevel.body,
        responseBody: httpLoggerLevel == HttpLoggerLevel.body,
        requestHeader: httpLoggerLevel == HttpLoggerLevel.body || httpLoggerLevel == HttpLoggerLevel.headers,
        responseHeader: httpLoggerLevel == HttpLoggerLevel.body || httpLoggerLevel == HttpLoggerLevel.headers,
        error: httpLoggerLevel != HttpLoggerLevel.none,
        compact: false,
        maxWidth: 256,
      ));
    }

    return dio;
  }
}
