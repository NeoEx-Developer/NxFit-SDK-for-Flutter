// First three imports are required for the floor code generated code to work
import 'dart:async';

import 'package:froom/froom.dart';
import 'package:nxfit_sdk/src/managers/implementation/integrations_manager_impl.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'converters/date_time_converter.dart';
import 'dao/cached_query_dao.dart';
import 'dao/integration_dao.dart';
import 'dao/source_dao.dart';
import 'entities/cached_query_entity.dart';
import 'entities/integration_entity.dart';
import 'entities/source_entity.dart';

part 'cache_database.g.dart';

const _schemaVersion = 2;
const _entities = [
  CachedQueryEntity,
  IntegrationEntity,
  SourceEntity,
];

@Database(version: _schemaVersion, entities: _entities)
@TypeConverters([DateTimeConverter, OptionalDateTimeConverter])
abstract class CacheDatabase extends FroomDatabase {
  CachedQueryDao get cachedQueries;

  IntegrationDao get integrations;
  SourceDao get sources;

  static Future<CacheDatabase> build() async {
    return await $FroomCacheDatabase
        .databaseBuilder(_databaseName)
        .addMigrations([migration1to2])
        .build();
  }

  static const String _databaseName = "com.neoex.nxfit.cache.db";

  static final migration1to2 = Migration(1, 2, (database) async {
    await database.execute('DROP TABLE IF EXISTS `integration`');

    await database.execute(
        'CREATE TABLE IF NOT EXISTS `integration` (`identifier` TEXT NOT NULL, `display_name` TEXT NOT NULL, `logo_url` TEXT NOT NULL, `is_connected` INTEGER NOT NULL, `last_modified_on` INTEGER, `etag` TEXT, PRIMARY KEY (`identifier`))'
    );

    await database.rawDelete('DELETE FROM `cached_query` WHERE `key` = ?', [IntegrationsManagerImpl.cacheKey]);
  });
}
