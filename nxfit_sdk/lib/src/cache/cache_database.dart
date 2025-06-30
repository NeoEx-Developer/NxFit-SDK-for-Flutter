// First three imports are required for the floor code generated code to work
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'converters/date_time_converter.dart';
import 'dao/cached_query_dao.dart';
import 'dao/integration_dao.dart';
import 'dao/source_dao.dart';
import 'entities/cached_query_entity.dart';
import 'entities/integration_entity.dart';
import 'entities/source_entity.dart';

part 'cache_database.g.dart';

const _schemaVersion = 1;
const _entities = [
  CachedQueryEntity,
  IntegrationEntity,
  SourceEntity,
];

@Database(version: _schemaVersion, entities: _entities)
@TypeConverters([DateTimeConverter, OptionalDateTimeConverter])
abstract class CacheDatabase extends FloorDatabase {
  CachedQueryDao get cachedQueries;

  IntegrationDao get integrations;
  SourceDao get sources;

  static Future<CacheDatabase> build() async {
    return await $FloorCacheDatabase.databaseBuilder(_databaseName).build();
  }

  static const String _databaseName = "com.neoex.nxfit.cache.db";
}
