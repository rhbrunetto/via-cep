import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../account/data/account_repository.dart';
import 'open_connection.dart';

part 'db.g.dart';

@visibleForTesting
const int latestVersion = 1;

const _tables = [
  AccountRows,
];

@lazySingleton
@DriftDatabase(tables: _tables)
class AvaDatabase extends _$AvaDatabase {
  AvaDatabase() : super(openConnection());

  AvaDatabase.connect(DatabaseConnection connection)
      : super(connection.executor);

  @override
  int get schemaVersion => latestVersion;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) => m.createAll(),
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 1) {
            await m.createTable(accountRows);
          }
        },
      );
}
