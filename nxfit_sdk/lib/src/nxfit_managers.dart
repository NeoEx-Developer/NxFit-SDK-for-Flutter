import 'cache/cache_database.dart';
import 'managers/implementation/integrations_manager_impl.dart';
import 'managers/integrations_manager.dart';
import 'nxfit.dart';

part "nxfit_managers_impl.dart";

/// The NxFit managers use the associated clients to fetch server data and store it in a local database via a sync process. This is
/// an optional convenience component of the NxFit SDK.
///
/// Managers allow for reading and writing data while offline. A write process first writes to the local database and then a sync process
/// updates the remote server. Likewise, after a sync process completes, the local database contains the latest server data.
///
/// When building an instance of the NxFitManagers, a reference to NxFit is required.
abstract class NxFitManagers {
  NxFit get nxfit;

  IntegrationsManager get integrationsManager;

  /// Builds a concrete instance of the NxFitManagers abstraction.
  ///
  /// Requires an existing instance of NxFit. The [baseRedirectUri] is used for connecting integrations.
  ///
  /// Before returning a fresh instance of the [NxFitManagers], a sync process is performed for all managers and therefore must
  /// be awaited.
  static Future<NxFitManagers> build(
    final NxFit nxfit, {
    required String baseRedirectUri,
  }) async {
    final db = await CacheDatabase.build();

    return _NxFitManagersImpl(
      nxfit,
      integrationsManager: await IntegrationsManagerImpl.build(baseRedirectUri, nxfit.authProvider, nxfit.integrationClient, database: db),
    );
  }
}
