import 'package:nxfit_sdk/models.dart';

abstract class LocalIntegrationClient {
  Stream<LocalIntegrationClientState> get readyState;
  Future<void> connect(String integrationIdentifier);
  Future<void> disconnect(String integrationIdentifier);
  Future<List<LocalIntegration>> getIntegrations();
}

enum LocalIntegrationClientState {
  /// The local integration client is ready to be used.
  ready("ready"),

  /// The local integration client is not ready to be used.
  notReady("notReady");

  final String value;

  const LocalIntegrationClientState(this.value);
}