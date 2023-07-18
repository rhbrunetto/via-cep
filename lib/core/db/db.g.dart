// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $AccountRowsTable extends AccountRows
    with TableInfo<$AccountRowsTable, AccountRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, email];
  @override
  String get aliasedName => _alias ?? 'account_rows';
  @override
  String get actualTableName => 'account_rows';
  @override
  VerificationContext validateIntegrity(Insertable<AccountRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AccountRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountRow(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $AccountRowsTable createAlias(String alias) {
    return $AccountRowsTable(attachedDatabase, alias);
  }
}

class AccountRow extends DataClass implements Insertable<AccountRow> {
  final String name;
  final String email;
  const AccountRow({required this.name, required this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    return map;
  }

  AccountRowsCompanion toCompanion(bool nullToAbsent) {
    return AccountRowsCompanion(
      name: Value(name),
      email: Value(email),
    );
  }

  factory AccountRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountRow(
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
    };
  }

  AccountRow copyWith({String? name, String? email}) => AccountRow(
        name: name ?? this.name,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('AccountRow(')
          ..write('name: $name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountRow &&
          other.name == this.name &&
          other.email == this.email);
}

class AccountRowsCompanion extends UpdateCompanion<AccountRow> {
  final Value<String> name;
  final Value<String> email;
  final Value<int> rowid;
  const AccountRowsCompanion({
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountRowsCompanion.insert({
    required String name,
    required String email,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        email = Value(email);
  static Insertable<AccountRow> custom({
    Expression<String>? name,
    Expression<String>? email,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountRowsCompanion copyWith(
      {Value<String>? name, Value<String>? email, Value<int>? rowid}) {
    return AccountRowsCompanion(
      name: name ?? this.name,
      email: email ?? this.email,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountRowsCompanion(')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AvaDatabase extends GeneratedDatabase {
  _$AvaDatabase(QueryExecutor e) : super(e);
  late final $AccountRowsTable accountRows = $AccountRowsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [accountRows];
}
