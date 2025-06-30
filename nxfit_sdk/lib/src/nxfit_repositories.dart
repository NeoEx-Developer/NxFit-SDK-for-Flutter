import '../repositories.dart';
import 'cache/cache_database.dart';
import 'cache/persistent_cached_resource.dart';
import 'nxfit.dart';
import 'repositories/implementation/badge_repository_impl.dart';
import 'repositories/implementation/integration_repository_impl.dart';
import 'repositories/implementation/profile_repository_impl.dart';
import 'repositories/implementation/session_repository_impl.dart';
import 'repositories/implementation/session_sample_repository_impl.dart';
import 'repositories/implementation/session_summary_repository_impl.dart';
import 'repositories/implementation/source_repository_impl.dart';

part "nxfit_repositories_impl.dart";

/// The [NXFitRepositories] interface provides repositories that work on top of the NXFit clients. This is an optional component of the NxFit SDK and
/// is intended to provide cached data.
///
/// Each repository corresponds to an NxFit client and it provides access to data even when offline. Each call to
/// the NxFit API is cached and subsequent calls will return cached data unless updates are detected. The calls for data return flows which will emit
/// at least once, whether it be cached data or fresh data from the API service. If the cached data was stale and the server provides updated
/// data, a second emission will be made.
abstract class NxFitRepositories {
  NxFit get nxfit;
  BadgeRepository get badgeRepo;
  IntegrationRepository get integrationRepo;
  ProfileRepository get profileRepo;
  SessionRepository get sessionRepo;
  SessionSampleRepository get sessionSampleRepo;
  SessionSummaryRepository get sessionSummaryRepo;
  SourceRepository get sourceRepo;

  ///  Builds a concrete implementation of the [NXFitRepositories] interface. This is an *async* function because it may
  ///  make network calls or load data from the local database. When the build completes, all the contained repositories
  ///  are fully initialized and ready to use.
  static Future<NxFitRepositories> build(NxFit nxfit) async {
    final db = await CacheDatabase.build();
    final persistentCachedResource = PersistentCachedResource(db);

    return _NxFitRepositoriesImpl(
      nxfit,
      badgeRepo: BadgeRepositoryImpl(persistentCachedResource, nxfit.badgeClient),
      integrationRepo: IntegrationRepositoryImpl(persistentCachedResource, nxfit.integrationClient),
      profileRepo: ProfileRepositoryImpl(persistentCachedResource, nxfit.profileClient),
      sessionRepo: SessionRepositoryImpl(persistentCachedResource, nxfit.sessionClient),
      sessionSampleRepo: SessionSampleRepositoryImpl(persistentCachedResource, nxfit.sessionSampleClient),
      sessionSummaryRepo: SessionSummaryRepositoryImpl(persistentCachedResource, nxfit.sessionSummaryClient),
      sourceRepo: SourceRepositoryImpl(persistentCachedResource, nxfit.sourceClient)
    );
  }
}
