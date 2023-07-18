/// Run `make flutter_generate_test_schemas` to generate test schemas
/// Run `make flutter_test` to run migration test

import 'package:ava/core/db/db.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'generated/schema.dart';

void main() {
  for (int i = 9; i < latestVersion; i++) {
    test('upgrade from v$i to v$latestVersion', () async {
      final SchemaVerifier verifier = SchemaVerifier(GeneratedHelper());
      final connection = await verifier.startAt(i);
      final db = AvaDatabase.connect(connection);
      await verifier.migrateAndValidate(db, latestVersion);
      await db.close();
    });
  }
}
