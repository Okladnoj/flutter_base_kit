// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ExampleTableTable extends ExampleTable
    with TableInfo<$ExampleTableTable, ExampleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExampleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'example_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExampleTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExampleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExampleTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
    );
  }

  @override
  $ExampleTableTable createAlias(String alias) {
    return $ExampleTableTable(attachedDatabase, alias);
  }
}

class ExampleTableData extends DataClass
    implements Insertable<ExampleTableData> {
  final String id;
  final String? name;
  const ExampleTableData({required this.id, this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  ExampleTableCompanion toCompanion(bool nullToAbsent) {
    return ExampleTableCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory ExampleTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExampleTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String?>(name),
    };
  }

  ExampleTableData copyWith({
    String? id,
    Value<String?> name = const Value.absent(),
  }) => ExampleTableData(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
  );
  ExampleTableData copyWithCompanion(ExampleTableCompanion data) {
    return ExampleTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExampleTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class ExampleTableCompanion extends UpdateCompanion<ExampleTableData> {
  final Value<String> id;
  final Value<String?> name;
  final Value<int> rowid;
  const ExampleTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExampleTableCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<ExampleTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExampleTableCompanion copyWith({
    Value<String>? id,
    Value<String?>? name,
    Value<int>? rowid,
  }) {
    return ExampleTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExampleTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExampleTableTable exampleTable = $ExampleTableTable(this);
  late final ExampleDao exampleDao = ExampleDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [exampleTable];
}

typedef $$ExampleTableTableCreateCompanionBuilder =
    ExampleTableCompanion Function({
      required String id,
      Value<String?> name,
      Value<int> rowid,
    });
typedef $$ExampleTableTableUpdateCompanionBuilder =
    ExampleTableCompanion Function({
      Value<String> id,
      Value<String?> name,
      Value<int> rowid,
    });

class $$ExampleTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExampleTableTable> {
  $$ExampleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExampleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExampleTableTable> {
  $$ExampleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExampleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExampleTableTable> {
  $$ExampleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$ExampleTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExampleTableTable,
          ExampleTableData,
          $$ExampleTableTableFilterComposer,
          $$ExampleTableTableOrderingComposer,
          $$ExampleTableTableAnnotationComposer,
          $$ExampleTableTableCreateCompanionBuilder,
          $$ExampleTableTableUpdateCompanionBuilder,
          (
            ExampleTableData,
            BaseReferences<_$AppDatabase, $ExampleTableTable, ExampleTableData>,
          ),
          ExampleTableData,
          PrefetchHooks Function()
        > {
  $$ExampleTableTableTableManager(_$AppDatabase db, $ExampleTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExampleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExampleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExampleTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => ExampleTableCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback: ({
            required String id,
            Value<String?> name = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => ExampleTableCompanion.insert(id: id, name: name, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExampleTableTable, ExampleTableData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ExampleTableTable,
                    ExampleTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExampleTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExampleTableTable,
      ExampleTableData,
      $$ExampleTableTableFilterComposer,
      $$ExampleTableTableOrderingComposer,
      $$ExampleTableTableAnnotationComposer,
      $$ExampleTableTableCreateCompanionBuilder,
      $$ExampleTableTableUpdateCompanionBuilder,
      (
        ExampleTableData,
        BaseReferences<_$AppDatabase, $ExampleTableTable, ExampleTableData>,
      ),
      ExampleTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExampleTableTableTableManager get exampleTable =>
      $$ExampleTableTableTableManager(_db, _db.exampleTable);
}
