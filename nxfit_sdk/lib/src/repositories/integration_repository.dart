import '../models/integration_model.dart';

abstract class IntegrationRepository {
  Stream<List<IntegrationModel>> listIntegrations();
}