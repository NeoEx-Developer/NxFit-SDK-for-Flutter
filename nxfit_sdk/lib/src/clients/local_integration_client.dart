import 'package:nxfit_sdk/models.dart';

abstract class LocalIntegrationClient {
  Future<void> connect(String integrationIdentifier);
  Future<void> disconnect(String integrationIdentifier);
  Future<List<LocalIntegration>> getIntegrations();
}