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

class $AddressRowsTable extends AddressRows
    with TableInfo<$AddressRowsTable, AddressRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AddressRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cepMeta = const VerificationMeta('cep');
  @override
  late final GeneratedColumn<String> cep = GeneratedColumn<String>(
      'cep', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _logradouroMeta =
      const VerificationMeta('logradouro');
  @override
  late final GeneratedColumn<String> logradouro = GeneratedColumn<String>(
      'logradouro', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _complementoMeta =
      const VerificationMeta('complemento');
  @override
  late final GeneratedColumn<String> complemento = GeneratedColumn<String>(
      'complemento', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bairroMeta = const VerificationMeta('bairro');
  @override
  late final GeneratedColumn<String> bairro = GeneratedColumn<String>(
      'bairro', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localidadeMeta =
      const VerificationMeta('localidade');
  @override
  late final GeneratedColumn<String> localidade = GeneratedColumn<String>(
      'localidade', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ufMeta = const VerificationMeta('uf');
  @override
  late final GeneratedColumn<String> uf = GeneratedColumn<String>(
      'uf', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _unidadeMeta =
      const VerificationMeta('unidade');
  @override
  late final GeneratedColumn<String> unidade = GeneratedColumn<String>(
      'unidade', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ibgeMeta = const VerificationMeta('ibge');
  @override
  late final GeneratedColumn<String> ibge = GeneratedColumn<String>(
      'ibge', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _giaMeta = const VerificationMeta('gia');
  @override
  late final GeneratedColumn<String> gia = GeneratedColumn<String>(
      'gia', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        created,
        cep,
        logradouro,
        complemento,
        bairro,
        localidade,
        uf,
        unidade,
        ibge,
        gia
      ];
  @override
  String get aliasedName => _alias ?? 'address_rows';
  @override
  String get actualTableName => 'address_rows';
  @override
  VerificationContext validateIntegrity(Insertable<AddressRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('cep')) {
      context.handle(
          _cepMeta, cep.isAcceptableOrUnknown(data['cep']!, _cepMeta));
    }
    if (data.containsKey('logradouro')) {
      context.handle(
          _logradouroMeta,
          logradouro.isAcceptableOrUnknown(
              data['logradouro']!, _logradouroMeta));
    }
    if (data.containsKey('complemento')) {
      context.handle(
          _complementoMeta,
          complemento.isAcceptableOrUnknown(
              data['complemento']!, _complementoMeta));
    }
    if (data.containsKey('bairro')) {
      context.handle(_bairroMeta,
          bairro.isAcceptableOrUnknown(data['bairro']!, _bairroMeta));
    }
    if (data.containsKey('localidade')) {
      context.handle(
          _localidadeMeta,
          localidade.isAcceptableOrUnknown(
              data['localidade']!, _localidadeMeta));
    }
    if (data.containsKey('uf')) {
      context.handle(_ufMeta, uf.isAcceptableOrUnknown(data['uf']!, _ufMeta));
    }
    if (data.containsKey('unidade')) {
      context.handle(_unidadeMeta,
          unidade.isAcceptableOrUnknown(data['unidade']!, _unidadeMeta));
    }
    if (data.containsKey('ibge')) {
      context.handle(
          _ibgeMeta, ibge.isAcceptableOrUnknown(data['ibge']!, _ibgeMeta));
    }
    if (data.containsKey('gia')) {
      context.handle(
          _giaMeta, gia.isAcceptableOrUnknown(data['gia']!, _giaMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AddressRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AddressRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      cep: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cep']),
      logradouro: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logradouro']),
      complemento: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}complemento']),
      bairro: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bairro']),
      localidade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}localidade']),
      uf: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uf']),
      unidade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unidade']),
      ibge: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ibge']),
      gia: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gia']),
    );
  }

  @override
  $AddressRowsTable createAlias(String alias) {
    return $AddressRowsTable(attachedDatabase, alias);
  }
}

class AddressRow extends DataClass implements Insertable<AddressRow> {
  final String id;
  final DateTime created;
  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? unidade;
  final String? ibge;
  final String? gia;
  const AddressRow(
      {required this.id,
      required this.created,
      this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.unidade,
      this.ibge,
      this.gia});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created'] = Variable<DateTime>(created);
    if (!nullToAbsent || cep != null) {
      map['cep'] = Variable<String>(cep);
    }
    if (!nullToAbsent || logradouro != null) {
      map['logradouro'] = Variable<String>(logradouro);
    }
    if (!nullToAbsent || complemento != null) {
      map['complemento'] = Variable<String>(complemento);
    }
    if (!nullToAbsent || bairro != null) {
      map['bairro'] = Variable<String>(bairro);
    }
    if (!nullToAbsent || localidade != null) {
      map['localidade'] = Variable<String>(localidade);
    }
    if (!nullToAbsent || uf != null) {
      map['uf'] = Variable<String>(uf);
    }
    if (!nullToAbsent || unidade != null) {
      map['unidade'] = Variable<String>(unidade);
    }
    if (!nullToAbsent || ibge != null) {
      map['ibge'] = Variable<String>(ibge);
    }
    if (!nullToAbsent || gia != null) {
      map['gia'] = Variable<String>(gia);
    }
    return map;
  }

  AddressRowsCompanion toCompanion(bool nullToAbsent) {
    return AddressRowsCompanion(
      id: Value(id),
      created: Value(created),
      cep: cep == null && nullToAbsent ? const Value.absent() : Value(cep),
      logradouro: logradouro == null && nullToAbsent
          ? const Value.absent()
          : Value(logradouro),
      complemento: complemento == null && nullToAbsent
          ? const Value.absent()
          : Value(complemento),
      bairro:
          bairro == null && nullToAbsent ? const Value.absent() : Value(bairro),
      localidade: localidade == null && nullToAbsent
          ? const Value.absent()
          : Value(localidade),
      uf: uf == null && nullToAbsent ? const Value.absent() : Value(uf),
      unidade: unidade == null && nullToAbsent
          ? const Value.absent()
          : Value(unidade),
      ibge: ibge == null && nullToAbsent ? const Value.absent() : Value(ibge),
      gia: gia == null && nullToAbsent ? const Value.absent() : Value(gia),
    );
  }

  factory AddressRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AddressRow(
      id: serializer.fromJson<String>(json['id']),
      created: serializer.fromJson<DateTime>(json['created']),
      cep: serializer.fromJson<String?>(json['cep']),
      logradouro: serializer.fromJson<String?>(json['logradouro']),
      complemento: serializer.fromJson<String?>(json['complemento']),
      bairro: serializer.fromJson<String?>(json['bairro']),
      localidade: serializer.fromJson<String?>(json['localidade']),
      uf: serializer.fromJson<String?>(json['uf']),
      unidade: serializer.fromJson<String?>(json['unidade']),
      ibge: serializer.fromJson<String?>(json['ibge']),
      gia: serializer.fromJson<String?>(json['gia']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created': serializer.toJson<DateTime>(created),
      'cep': serializer.toJson<String?>(cep),
      'logradouro': serializer.toJson<String?>(logradouro),
      'complemento': serializer.toJson<String?>(complemento),
      'bairro': serializer.toJson<String?>(bairro),
      'localidade': serializer.toJson<String?>(localidade),
      'uf': serializer.toJson<String?>(uf),
      'unidade': serializer.toJson<String?>(unidade),
      'ibge': serializer.toJson<String?>(ibge),
      'gia': serializer.toJson<String?>(gia),
    };
  }

  AddressRow copyWith(
          {String? id,
          DateTime? created,
          Value<String?> cep = const Value.absent(),
          Value<String?> logradouro = const Value.absent(),
          Value<String?> complemento = const Value.absent(),
          Value<String?> bairro = const Value.absent(),
          Value<String?> localidade = const Value.absent(),
          Value<String?> uf = const Value.absent(),
          Value<String?> unidade = const Value.absent(),
          Value<String?> ibge = const Value.absent(),
          Value<String?> gia = const Value.absent()}) =>
      AddressRow(
        id: id ?? this.id,
        created: created ?? this.created,
        cep: cep.present ? cep.value : this.cep,
        logradouro: logradouro.present ? logradouro.value : this.logradouro,
        complemento: complemento.present ? complemento.value : this.complemento,
        bairro: bairro.present ? bairro.value : this.bairro,
        localidade: localidade.present ? localidade.value : this.localidade,
        uf: uf.present ? uf.value : this.uf,
        unidade: unidade.present ? unidade.value : this.unidade,
        ibge: ibge.present ? ibge.value : this.ibge,
        gia: gia.present ? gia.value : this.gia,
      );
  @override
  String toString() {
    return (StringBuffer('AddressRow(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('cep: $cep, ')
          ..write('logradouro: $logradouro, ')
          ..write('complemento: $complemento, ')
          ..write('bairro: $bairro, ')
          ..write('localidade: $localidade, ')
          ..write('uf: $uf, ')
          ..write('unidade: $unidade, ')
          ..write('ibge: $ibge, ')
          ..write('gia: $gia')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, created, cep, logradouro, complemento,
      bairro, localidade, uf, unidade, ibge, gia);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddressRow &&
          other.id == this.id &&
          other.created == this.created &&
          other.cep == this.cep &&
          other.logradouro == this.logradouro &&
          other.complemento == this.complemento &&
          other.bairro == this.bairro &&
          other.localidade == this.localidade &&
          other.uf == this.uf &&
          other.unidade == this.unidade &&
          other.ibge == this.ibge &&
          other.gia == this.gia);
}

class AddressRowsCompanion extends UpdateCompanion<AddressRow> {
  final Value<String> id;
  final Value<DateTime> created;
  final Value<String?> cep;
  final Value<String?> logradouro;
  final Value<String?> complemento;
  final Value<String?> bairro;
  final Value<String?> localidade;
  final Value<String?> uf;
  final Value<String?> unidade;
  final Value<String?> ibge;
  final Value<String?> gia;
  final Value<int> rowid;
  const AddressRowsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.cep = const Value.absent(),
    this.logradouro = const Value.absent(),
    this.complemento = const Value.absent(),
    this.bairro = const Value.absent(),
    this.localidade = const Value.absent(),
    this.uf = const Value.absent(),
    this.unidade = const Value.absent(),
    this.ibge = const Value.absent(),
    this.gia = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AddressRowsCompanion.insert({
    required String id,
    required DateTime created,
    this.cep = const Value.absent(),
    this.logradouro = const Value.absent(),
    this.complemento = const Value.absent(),
    this.bairro = const Value.absent(),
    this.localidade = const Value.absent(),
    this.uf = const Value.absent(),
    this.unidade = const Value.absent(),
    this.ibge = const Value.absent(),
    this.gia = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created);
  static Insertable<AddressRow> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<String>? cep,
    Expression<String>? logradouro,
    Expression<String>? complemento,
    Expression<String>? bairro,
    Expression<String>? localidade,
    Expression<String>? uf,
    Expression<String>? unidade,
    Expression<String>? ibge,
    Expression<String>? gia,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (cep != null) 'cep': cep,
      if (logradouro != null) 'logradouro': logradouro,
      if (complemento != null) 'complemento': complemento,
      if (bairro != null) 'bairro': bairro,
      if (localidade != null) 'localidade': localidade,
      if (uf != null) 'uf': uf,
      if (unidade != null) 'unidade': unidade,
      if (ibge != null) 'ibge': ibge,
      if (gia != null) 'gia': gia,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AddressRowsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<String?>? cep,
      Value<String?>? logradouro,
      Value<String?>? complemento,
      Value<String?>? bairro,
      Value<String?>? localidade,
      Value<String?>? uf,
      Value<String?>? unidade,
      Value<String?>? ibge,
      Value<String?>? gia,
      Value<int>? rowid}) {
    return AddressRowsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      unidade: unidade ?? this.unidade,
      ibge: ibge ?? this.ibge,
      gia: gia ?? this.gia,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (cep.present) {
      map['cep'] = Variable<String>(cep.value);
    }
    if (logradouro.present) {
      map['logradouro'] = Variable<String>(logradouro.value);
    }
    if (complemento.present) {
      map['complemento'] = Variable<String>(complemento.value);
    }
    if (bairro.present) {
      map['bairro'] = Variable<String>(bairro.value);
    }
    if (localidade.present) {
      map['localidade'] = Variable<String>(localidade.value);
    }
    if (uf.present) {
      map['uf'] = Variable<String>(uf.value);
    }
    if (unidade.present) {
      map['unidade'] = Variable<String>(unidade.value);
    }
    if (ibge.present) {
      map['ibge'] = Variable<String>(ibge.value);
    }
    if (gia.present) {
      map['gia'] = Variable<String>(gia.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AddressRowsCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('cep: $cep, ')
          ..write('logradouro: $logradouro, ')
          ..write('complemento: $complemento, ')
          ..write('bairro: $bairro, ')
          ..write('localidade: $localidade, ')
          ..write('uf: $uf, ')
          ..write('unidade: $unidade, ')
          ..write('ibge: $ibge, ')
          ..write('gia: $gia, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AvaDatabase extends GeneratedDatabase {
  _$AvaDatabase(QueryExecutor e) : super(e);
  late final $AccountRowsTable accountRows = $AccountRowsTable(this);
  late final $AddressRowsTable addressRows = $AddressRowsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [accountRows, addressRows];
}
