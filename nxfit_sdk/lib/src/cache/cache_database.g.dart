// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_database.dart';

// **************************************************************************
// FroomGenerator
// **************************************************************************

abstract class $CacheDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $CacheDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $CacheDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<CacheDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FroomCacheDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $CacheDatabaseBuilderContract databaseBuilder(String name) =>
      _$CacheDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $CacheDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$CacheDatabaseBuilder(null);
}

class _$CacheDatabaseBuilder implements $CacheDatabaseBuilderContract {
  _$CacheDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $CacheDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $CacheDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<CacheDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$CacheDatabase();
    database.database = await database.open(path, _migrations, _callback);
    return database;
  }
}

class _$CacheDatabase extends CacheDatabase {
  _$CacheDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CachedQueryDao? _cachedQueriesInstance;

  IntegrationDao? _integrationsInstance;

  SourceDao? _sourcesInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
          database,
          startVersion,
          endVersion,
          migrations,
        );

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE IF NOT EXISTS `cached_query` (`key` TEXT NOT NULL, `lastModifiedOn` INTEGER, `eTag` TEXT, PRIMARY KEY (`key`))',
        );
        await database.execute(
          'CREATE TABLE IF NOT EXISTS `integration` (`identifier` TEXT NOT NULL, `display_name` TEXT NOT NULL, `logo_url` TEXT NOT NULL, `is_connected` INTEGER NOT NULL, `last_modified_on` INTEGER, `etag` TEXT, PRIMARY KEY (`identifier`))',
        );
        await database.execute(
          'CREATE TABLE IF NOT EXISTS `source` (`id` INTEGER NOT NULL, `integration_identifier` TEXT NOT NULL, `integration_display_name` TEXT, `device_name` TEXT, `device_hardware_version` TEXT, `device_manufacturer` TEXT, `device_os` TEXT, `app_name` TEXT, `app_identifier` TEXT, `priority` INTEGER NOT NULL, `is_included` INTEGER NOT NULL, `created_on` INTEGER NOT NULL, `updated_on` INTEGER, `last_modified_on` INTEGER, `etag` TEXT, PRIMARY KEY (`id`))',
        );

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CachedQueryDao get cachedQueries {
    return _cachedQueriesInstance ??= _$CachedQueryDao(
      database,
      changeListener,
    );
  }

  @override
  IntegrationDao get integrations {
    return _integrationsInstance ??= _$IntegrationDao(database, changeListener);
  }

  @override
  SourceDao get sources {
    return _sourcesInstance ??= _$SourceDao(database, changeListener);
  }
}

class _$CachedQueryDao extends CachedQueryDao {
  _$CachedQueryDao(this.database, this.changeListener)
    : _queryAdapter = QueryAdapter(database),
      _cachedQueryEntityInsertionAdapter = InsertionAdapter(
        database,
        'cached_query',
        (CachedQueryEntity item) => <String, Object?>{
          'key': item.key,
          'lastModifiedOn': _optionalDateTimeConverter.encode(
            item.lastModifiedOn,
          ),
          'eTag': item.eTag,
        },
      );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CachedQueryEntity> _cachedQueryEntityInsertionAdapter;

  @override
  Future<CachedQueryEntity?> get(String key) async {
    return _queryAdapter.query(
      'SELECT * FROM cached_query WHERE [key] = ?1',
      mapper: (Map<String, Object?> row) => CachedQueryEntity(
        key: row['key'] as String,
        lastModifiedOn: _optionalDateTimeConverter.decode(
          row['lastModifiedOn'] as int?,
        ),
        eTag: row['eTag'] as String?,
      ),
      arguments: [key],
    );
  }

  @override
  Future<List<CachedQueryEntity>> getAll() async {
    return _queryAdapter.queryList(
      'SELECT * FROM cached_query',
      mapper: (Map<String, Object?> row) => CachedQueryEntity(
        key: row['key'] as String,
        lastModifiedOn: _optionalDateTimeConverter.decode(
          row['lastModifiedOn'] as int?,
        ),
        eTag: row['eTag'] as String?,
      ),
    );
  }

  @override
  Future<void> remove(String key) async {
    await _queryAdapter.queryNoReturn(
      'DELETE FROM cached_query WHERE [key] = ?1',
      arguments: [key],
    );
  }

  @override
  Future<void> addOrReplace(CachedQueryEntity entity) async {
    await _cachedQueryEntityInsertionAdapter.insert(
      entity,
      OnConflictStrategy.replace,
    );
  }
}

class _$IntegrationDao extends IntegrationDao {
  _$IntegrationDao(this.database, this.changeListener)
    : _queryAdapter = QueryAdapter(database, changeListener),
      _integrationEntityInsertionAdapter = InsertionAdapter(
        database,
        'integration',
        (IntegrationEntity item) => <String, Object?>{
          'identifier': item.identifier,
          'display_name': item.displayName,
          'logo_url': item.logoUrl,
          'is_connected': item.isConnected ? 1 : 0,
          'last_modified_on': _optionalDateTimeConverter.encode(
            item.lastModifiedOn,
          ),
          'etag': item.eTag,
        },
        changeListener,
      );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<IntegrationEntity> _integrationEntityInsertionAdapter;

  @override
  Stream<List<IntegrationEntity>> streamIntegrations() {
    return _queryAdapter.queryListStream(
      'SELECT * FROM Integration',
      mapper: (Map<String, Object?> row) => IntegrationEntity(
        identifier: row['identifier'] as String,
        displayName: row['display_name'] as String,
        logoUrl: row['logo_url'] as String,
        isConnected: (row['is_connected'] as int) != 0,
        lastModifiedOn: _optionalDateTimeConverter.decode(
          row['last_modified_on'] as int?,
        ),
        eTag: row['etag'] as String?,
      ),
      queryableName: 'Integration',
      isView: false,
    );
  }

  @override
  Future<List<IntegrationEntity>> listIntegrations() async {
    return _queryAdapter.queryList(
      'SELECT * FROM Integration',
      mapper: (Map<String, Object?> row) => IntegrationEntity(
        identifier: row['identifier'] as String,
        displayName: row['display_name'] as String,
        logoUrl: row['logo_url'] as String,
        isConnected: (row['is_connected'] as int) != 0,
        lastModifiedOn: _optionalDateTimeConverter.decode(
          row['last_modified_on'] as int?,
        ),
        eTag: row['etag'] as String?,
      ),
    );
  }

  @override
  Future<IntegrationEntity?> getById(String identifier) async {
    return _queryAdapter.query(
      'SELECT * FROM integration where ?1 = identifier',
      mapper: (Map<String, Object?> row) => IntegrationEntity(
        identifier: row['identifier'] as String,
        displayName: row['display_name'] as String,
        logoUrl: row['logo_url'] as String,
        isConnected: (row['is_connected'] as int) != 0,
        lastModifiedOn: _optionalDateTimeConverter.decode(
          row['last_modified_on'] as int?,
        ),
        eTag: row['etag'] as String?,
      ),
      arguments: [identifier],
    );
  }

  @override
  Future<void> clear() async {
    await _queryAdapter.queryNoReturn('DELETE FROM integration');
  }

  @override
  Future<void> addOrReplaceIntegration(IntegrationEntity integration) async {
    await _integrationEntityInsertionAdapter.insert(
      integration,
      OnConflictStrategy.replace,
    );
  }

  @override
  Future<void> addOrReplaceIntegrations(
    List<IntegrationEntity> integration,
  ) async {
    await _integrationEntityInsertionAdapter.insertList(
      integration,
      OnConflictStrategy.replace,
    );
  }
}

class _$SourceDao extends SourceDao {
  _$SourceDao(this.database, this.changeListener)
    : _queryAdapter = QueryAdapter(database, changeListener),
      _sourceEntityInsertionAdapter = InsertionAdapter(
        database,
        'source',
        (SourceEntity item) => <String, Object?>{
          'id': item.id,
          'integration_identifier': item.integrationIdentifier,
          'integration_display_name': item.integrationDisplayName,
          'device_name': item.deviceName,
          'device_hardware_version': item.deviceHardwareVersion,
          'device_manufacturer': item.deviceManufacturer,
          'device_os': item.deviceOS,
          'app_name': item.appName,
          'app_identifier': item.appIdentifier,
          'priority': item.priority,
          'is_included': item.isIncluded ? 1 : 0,
          'created_on': _dateTimeConverter.encode(item.createdOn),
          'updated_on': _optionalDateTimeConverter.encode(item.updatedOn),
          'last_modified_on': _optionalDateTimeConverter.encode(
            item.lastModifiedOn,
          ),
          'etag': item.eTag,
        },
        changeListener,
      ),
      _sourceEntityUpdateAdapter = UpdateAdapter(
        database,
        'source',
        ['id'],
        (SourceEntity item) => <String, Object?>{
          'id': item.id,
          'integration_identifier': item.integrationIdentifier,
          'integration_display_name': item.integrationDisplayName,
          'device_name': item.deviceName,
          'device_hardware_version': item.deviceHardwareVersion,
          'device_manufacturer': item.deviceManufacturer,
          'device_os': item.deviceOS,
          'app_name': item.appName,
          'app_identifier': item.appIdentifier,
          'priority': item.priority,
          'is_included': item.isIncluded ? 1 : 0,
          'created_on': _dateTimeConverter.encode(item.createdOn),
          'updated_on': _optionalDateTimeConverter.encode(item.updatedOn),
          'last_modified_on': _optionalDateTimeConverter.encode(
            item.lastModifiedOn,
          ),
          'etag': item.eTag,
        },
        changeListener,
      );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SourceEntity> _sourceEntityInsertionAdapter;

  final UpdateAdapter<SourceEntity> _sourceEntityUpdateAdapter;

  @override
  Future<List<SourceEntity>> listSources() async {
    return _queryAdapter.queryList(
      'SELECT * FROM source',
      mapper: (Map<String, Object?> row) => SourceEntity(
        row['id'] as int,
        integrationIdentifier: row['integration_identifier'] as String,
        integrationDisplayName: row['integration_display_name'] as String?,
        deviceName: row['device_name'] as String?,
        deviceHardwareVersion: row['device_hardware_version'] as String?,
        deviceManufacturer: row['device_manufacturer'] as String?,
        deviceOS: row['device_os'] as String?,
        appName: row['app_name'] as String?,
        appIdentifier: row['app_identifier'] as String?,
        priority: row['priority'] as int,
        isIncluded: (row['is_included'] as int) != 0,
        createdOn: _dateTimeConverter.decode(row['created_on'] as int),
        updatedOn: _optionalDateTimeConverter.decode(row['updated_on'] as int?),
        lastModifiedOn: _optionalDateTimeConverter.decode(
          row['last_modified_on'] as int?,
        ),
        eTag: row['etag'] as String?,
      ),
    );
  }

  @override
  Stream<List<SourceEntity>> listSourcesStream() {
    return _queryAdapter.queryListStream(
      'SELECT * FROM source',
      mapper: (Map<String, Object?> row) => SourceEntity(
        row['id'] as int,
        integrationIdentifier: row['integration_identifier'] as String,
        integrationDisplayName: row['integration_display_name'] as String?,
        deviceName: row['device_name'] as String?,
        deviceHardwareVersion: row['device_hardware_version'] as String?,
        deviceManufacturer: row['device_manufacturer'] as String?,
        deviceOS: row['device_os'] as String?,
        appName: row['app_name'] as String?,
        appIdentifier: row['app_identifier'] as String?,
        priority: row['priority'] as int,
        isIncluded: (row['is_included'] as int) != 0,
        createdOn: _dateTimeConverter.decode(row['created_on'] as int),
        updatedOn: _optionalDateTimeConverter.decode(row['updated_on'] as int?),
        lastModifiedOn: _optionalDateTimeConverter.decode(
          row['last_modified_on'] as int?,
        ),
        eTag: row['etag'] as String?,
      ),
      queryableName: 'source',
      isView: false,
    );
  }

  @override
  Future<SourceEntity?> getSourceById(int id) async {
    return _queryAdapter.query(
      'SELECT * FROM source WHERE id = ?1',
      mapper: (Map<String, Object?> row) => SourceEntity(
        row['id'] as int,
        integrationIdentifier: row['integration_identifier'] as String,
        integrationDisplayName: row['integration_display_name'] as String?,
        deviceName: row['device_name'] as String?,
        deviceHardwareVersion: row['device_hardware_version'] as String?,
        deviceManufacturer: row['device_manufacturer'] as String?,
        deviceOS: row['device_os'] as String?,
        appName: row['app_name'] as String?,
        appIdentifier: row['app_identifier'] as String?,
        priority: row['priority'] as int,
        isIncluded: (row['is_included'] as int) != 0,
        createdOn: _dateTimeConverter.decode(row['created_on'] as int),
        updatedOn: _optionalDateTimeConverter.decode(row['updated_on'] as int?),
        lastModifiedOn: _optionalDateTimeConverter.decode(
          row['last_modified_on'] as int?,
        ),
        eTag: row['etag'] as String?,
      ),
      arguments: [id],
    );
  }

  @override
  Stream<SourceEntity?> getSourceByIdStream(int id) {
    return _queryAdapter.queryStream(
      'SELECT * FROM source WHERE id = ?1',
      mapper: (Map<String, Object?> row) => SourceEntity(
        row['id'] as int,
        integrationIdentifier: row['integration_identifier'] as String,
        integrationDisplayName: row['integration_display_name'] as String?,
        deviceName: row['device_name'] as String?,
        deviceHardwareVersion: row['device_hardware_version'] as String?,
        deviceManufacturer: row['device_manufacturer'] as String?,
        deviceOS: row['device_os'] as String?,
        appName: row['app_name'] as String?,
        appIdentifier: row['app_identifier'] as String?,
        priority: row['priority'] as int,
        isIncluded: (row['is_included'] as int) != 0,
        createdOn: _dateTimeConverter.decode(row['created_on'] as int),
        updatedOn: _optionalDateTimeConverter.decode(row['updated_on'] as int?),
        lastModifiedOn: _optionalDateTimeConverter.decode(
          row['last_modified_on'] as int?,
        ),
        eTag: row['etag'] as String?,
      ),
      arguments: [id],
      queryableName: 'source',
      isView: false,
    );
  }

  @override
  Future<void> deleteSource(int id) async {
    await _queryAdapter.queryNoReturn(
      'DELETE FROM source WHERE id = ?1',
      arguments: [id],
    );
  }

  @override
  Future<void> clear() async {
    await _queryAdapter.queryNoReturn('DELETE FROM source');
  }

  @override
  Future<int> addOrReplaceSource(SourceEntity source) {
    return _sourceEntityInsertionAdapter.insertAndReturnId(
      source,
      OnConflictStrategy.replace,
    );
  }

  @override
  Future<void> addOrReplaceSources(List<SourceEntity> sources) async {
    await _sourceEntityInsertionAdapter.insertList(
      sources,
      OnConflictStrategy.replace,
    );
  }

  @override
  Future<int> updateSource(SourceEntity source) {
    return _sourceEntityUpdateAdapter.updateAndReturnChangedRows(
      source,
      OnConflictStrategy.abort,
    );
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _optionalDateTimeConverter = OptionalDateTimeConverter();
