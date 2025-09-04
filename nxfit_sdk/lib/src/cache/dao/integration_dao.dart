import 'package:froom/froom.dart';

import '../entities/integration_entity.dart';

@dao
abstract class IntegrationDao {
  @Query("SELECT * FROM Integration")
  Stream<List<IntegrationEntity>> streamIntegrations();

  @Query("SELECT * FROM Integration")
  Future<List<IntegrationEntity>> listIntegrations();

  @Query("SELECT * FROM integration where :identifier = identifier")
  Future<IntegrationEntity?> getById(String identifier);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addOrReplaceIntegration(IntegrationEntity integration);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addOrReplaceIntegrations(List<IntegrationEntity> integration);

  @Query("DELETE FROM integration")
  Future<void> clear();
}
