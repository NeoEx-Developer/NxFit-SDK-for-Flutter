import '../../clients.dart';
import '../../core.dart';
import '../models/integration_model.dart';
import 'implementation/integrations_manager_impl.dart';

/// When the integration connection process completes, a result is provided back. The response can be decoded with the
/// [IntegrationsManager.handleAuthorizeResponse] method, which will return the result in the form of this enum.
enum IntegrationConnectionCode {
  failure(name: "failure"),
  success(name: "success");

  final String name;

  const IntegrationConnectionCode({required this.name});
}

/// This event is triggered whenever a user attempts to connect to a new integration. The event contains the integration
/// identifier and the result of the connection attempt via the [connectionCode] property.
class ConnectionEvent {
  final String integrationIdentifier;
  final IntegrationConnectionCode connectionCode;

  ConnectionEvent(this.integrationIdentifier, this.connectionCode);
}

/// This event is triggered whenever a user successfully disconnects from an integration. It includes the integration identifier.
class DisconnectionEvent {
  final String integrationIdentifier;

  DisconnectionEvent(this.integrationIdentifier);
}

/// Provides methods to manage the user's integrations with fitness data providers. Connecting a user to an integration means that fitness
/// data from that integration will be synced and made available for this user.
///
/// NOTE: The manager maintains state and is designed to be used as a singleton.
abstract class IntegrationsManager {
  /// Builds a concrete instance of the IntegrationsManager abstraction. This should only be used if NxFitManagers is not used.
  static Future<IntegrationsManager> build(String baseRedirectUri, AuthProvider authProvider, IntegrationClient client) async {
    return await IntegrationsManagerImpl.build(baseRedirectUri, authProvider, client);
  }

  /// The complete list of integrations for the current user. A sync process may cause an emission of new integrations.
  Stream<List<IntegrationModel>> get integrations;

  /// Whenever a user completes an integration connection, a [ConnectionEvent] is emitted indicating the connection code. The [ConnectionEvent]
  /// contains the integration identifier and the [IntegrationConnectionCode].
  Stream<ConnectionEvent> get connectionEvents;

  /// Whenever a user completes an integration disconnect, a [DisconnectionEvent] is emitted. The [DisconnectionEvent] contains the
  /// [IntegrationIdentifier].
  Stream<DisconnectionEvent> get disconnectionEvents;

  /// Connects the NXFit user to the specified integration. This method supports two basic flows: those that require user
  /// authorization and those that do not.
  ///
  /// Generates a URL to be used to be launched which puts the user through the integration authorize
  /// process. Part of the URL includes a redirect URL which is used to send the result of the authorize
  /// process back to your app. The redirect url contains the application package ID of the app initiating
  /// the authorize process. This is done to ensure that the application initiating the authorize process
  /// receives the result from the browser. An IntentFilter is required to make this work.
  ///
  /// ### Get the Application Package ID
  ///
  /// The application package ID may be retrieved via **Context.getPackageName()** and can
  /// be viewed in your app module's build.gradle file under: **android.defaultConfig.applicationId**.
  ///
  ///
  ///       android {
  ///           namespace 'com.example.app'
  ///           ....
  ///           defaultConfig {
  ///               applicationId "com.example.app"  // <-- this is the application package ID
  ///               minSdk 24
  ///               targetSdk 33
  ///               versionCode 1
  ///               versionName "1.0"
  ///               ....
  ///           }
  ///           ....
  ///       }
  ///
  /// ### Create the IntentFilter with the Application Package ID
  ///
  /// Define an **intent-filter** in the manifest to accept Intents with the scheme matching your
  /// application package ID. Example intent-filter:
  ///
  ///        <manifest xmlns:android="http://schemas.android.com/apk/res/android">
  ///          <application .... >
  ///            <activity .... >
  ///              <intent-filter>
  ///                <action android:name="android.intent.action.VIEW" />
  ///                <category android:name="android.intent.category.DEFAULT" />
  ///                <category android:name="android.intent.category.BROWSABLE" />
  ///                <data android:scheme="com.example.app" />
  ///              </intent-filter>
  ///            </activity>
  ///          </application>
  ///        </manifest>
  ///
  /// ### Initiate authorize process
  ///
  /// To start the integration authorize process an Intent must be used to browse to the authorize page. The URI for
  /// the Intent is provided by [IntegrationsManager.connect], along with necessary redirect URI that includes the
  /// application package ID. With the integration authorize URI in hand, use the **CustomTabsIntent** to navigate
  /// to the provided URL. Example:
  ///
  ///     await _integrationsManager.connect(integrationIdentifier, (authUri) async {
  ///       launchUrl(authUri);
  ///     });
  ///
  /// ### Handle response
  ///
  /// When a user completes the authorize procedure, an Intent will be sent to the associated activity. This can be handled
  /// either in the Activity's **onCreate** method (via getIntent()), or in the **onNewIntent** method. One
  /// recommendation is to set the launchMode of the receiving activity in your manifest to "singleTop". This will prevent launching
  /// the activity a second time if it's already running. The Intent contains the response and it must be processed by the
  /// IntegrationsManager via the [IntegrationsManager.handleAuthorizeResponse] method. Example:
  ///
  ///     override fun onNewIntent(intent: Intent?) {
  ///       super.onNewIntent(intent)
  ///       val data = intent?.data
  ///
  ///        data?.let {
  ///          integrationsManager.handleAuthorizeResponse(data.toString())
  ///        }
  ///     }
  Future<void> connect(String integrationIdentifier, Future<void> Function(Uri) authorizeAction);

  /// Determines if the given URL can be handled by this manager.
  /// Typically this is used to check whether a deep linked URL can be handled such as the redirected URL from an integration connect action.
  bool canHandleAuthorizeResponseFromUrl(Uri response);

  /// Will decode the URI and will emit a [ConnectionEvent] with the [IntegrationConnectionCode] for the integration.
  /// The emitted [IntegrationConnectionCode] is also returned to the caller.
  Future<IntegrationConnectionCode> handleAuthorizeResponseFromUrl(Uri response);

  /// Will decode the connection result code and will emit a [ConnectionEvent] with the [IntegrationConnectionCode] for the integration.
  /// The emitted [IntegrationConnectionCode] is also returned to the caller.
  Future<IntegrationConnectionCode> handleAuthorizeResponse(String integrationIdentifier, String connectionResultCode);

  /// Disconnects the integration with the given [integrationIdentifier]. The current user will no longer have fitness data sent to the NxFit service from the integration.
  /// May cause an emission on the [disconnectionEvents] Stream.
  Future<void> disconnect(String integrationIdentifier);

  /// Will sync the user's integrations with the NxFit service. Any new or updated integrations will be emitted by the [integrations] stream.
  Future<void> refreshIntegrations();
}
