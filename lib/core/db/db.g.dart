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
  static const VerificationMeta _zipcodeMeta =
      const VerificationMeta('zipcode');
  @override
  late final GeneratedColumn<String> zipcode = GeneratedColumn<String>(
      'zipcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _additionalMeta =
      const VerificationMeta('additional');
  @override
  late final GeneratedColumn<String> additional = GeneratedColumn<String>(
      'additional', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _neighborhoodMeta =
      const VerificationMeta('neighborhood');
  @override
  late final GeneratedColumn<String> neighborhood = GeneratedColumn<String>(
      'neighborhood', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        created,
        zipcode,
        street,
        additional,
        number,
        neighborhood,
        city,
        state
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
    if (data.containsKey('zipcode')) {
      context.handle(_zipcodeMeta,
          zipcode.isAcceptableOrUnknown(data['zipcode']!, _zipcodeMeta));
    } else if (isInserting) {
      context.missing(_zipcodeMeta);
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('additional')) {
      context.handle(
          _additionalMeta,
          additional.isAcceptableOrUnknown(
              data['additional']!, _additionalMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    }
    if (data.containsKey('neighborhood')) {
      context.handle(
          _neighborhoodMeta,
          neighborhood.isAcceptableOrUnknown(
              data['neighborhood']!, _neighborhoodMeta));
    } else if (isInserting) {
      context.missing(_neighborhoodMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
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
      zipcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zipcode'])!,
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street'])!,
      additional: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}additional']),
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number']),
      neighborhood: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}neighborhood'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
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
  final String zipcode;
  final String street;
  final String? additional;
  final String? number;
  final String neighborhood;
  final String city;
  final String state;
  const AddressRow(
      {required this.id,
      required this.created,
      required this.zipcode,
      required this.street,
      this.additional,
      this.number,
      required this.neighborhood,
      required this.city,
      required this.state});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created'] = Variable<DateTime>(created);
    map['zipcode'] = Variable<String>(zipcode);
    map['street'] = Variable<String>(street);
    if (!nullToAbsent || additional != null) {
      map['additional'] = Variable<String>(additional);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    map['neighborhood'] = Variable<String>(neighborhood);
    map['city'] = Variable<String>(city);
    map['state'] = Variable<String>(state);
    return map;
  }

  AddressRowsCompanion toCompanion(bool nullToAbsent) {
    return AddressRowsCompanion(
      id: Value(id),
      created: Value(created),
      zipcode: Value(zipcode),
      street: Value(street),
      additional: additional == null && nullToAbsent
          ? const Value.absent()
          : Value(additional),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      neighborhood: Value(neighborhood),
      city: Value(city),
      state: Value(state),
    );
  }

  factory AddressRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AddressRow(
      id: serializer.fromJson<String>(json['id']),
      created: serializer.fromJson<DateTime>(json['created']),
      zipcode: serializer.fromJson<String>(json['zipcode']),
      street: serializer.fromJson<String>(json['street']),
      additional: serializer.fromJson<String?>(json['additional']),
      number: serializer.fromJson<String?>(json['number']),
      neighborhood: serializer.fromJson<String>(json['neighborhood']),
      city: serializer.fromJson<String>(json['city']),
      state: serializer.fromJson<String>(json['state']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created': serializer.toJson<DateTime>(created),
      'zipcode': serializer.toJson<String>(zipcode),
      'street': serializer.toJson<String>(street),
      'additional': serializer.toJson<String?>(additional),
      'number': serializer.toJson<String?>(number),
      'neighborhood': serializer.toJson<String>(neighborhood),
      'city': serializer.toJson<String>(city),
      'state': serializer.toJson<String>(state),
    };
  }

  AddressRow copyWith(
          {String? id,
          DateTime? created,
          String? zipcode,
          String? street,
          Value<String?> additional = const Value.absent(),
          Value<String?> number = const Value.absent(),
          String? neighborhood,
          String? city,
          String? state}) =>
      AddressRow(
        id: id ?? this.id,
        created: created ?? this.created,
        zipcode: zipcode ?? this.zipcode,
        street: street ?? this.street,
        additional: additional.present ? additional.value : this.additional,
        number: number.present ? number.value : this.number,
        neighborhood: neighborhood ?? this.neighborhood,
        city: city ?? this.city,
        state: state ?? this.state,
      );
  @override
  String toString() {
    return (StringBuffer('AddressRow(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('zipcode: $zipcode, ')
          ..write('street: $street, ')
          ..write('additional: $additional, ')
          ..write('number: $number, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('city: $city, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, created, zipcode, street, additional,
      number, neighborhood, city, state);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddressRow &&
          other.id == this.id &&
          other.created == this.created &&
          other.zipcode == this.zipcode &&
          other.street == this.street &&
          other.additional == this.additional &&
          other.number == this.number &&
          other.neighborhood == this.neighborhood &&
          other.city == this.city &&
          other.state == this.state);
}

class AddressRowsCompanion extends UpdateCompanion<AddressRow> {
  final Value<String> id;
  final Value<DateTime> created;
  final Value<String> zipcode;
  final Value<String> street;
  final Value<String?> additional;
  final Value<String?> number;
  final Value<String> neighborhood;
  final Value<String> city;
  final Value<String> state;
  final Value<int> rowid;
  const AddressRowsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.zipcode = const Value.absent(),
    this.street = const Value.absent(),
    this.additional = const Value.absent(),
    this.number = const Value.absent(),
    this.neighborhood = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AddressRowsCompanion.insert({
    required String id,
    required DateTime created,
    required String zipcode,
    required String street,
    this.additional = const Value.absent(),
    this.number = const Value.absent(),
    required String neighborhood,
    required String city,
    required String state,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        zipcode = Value(zipcode),
        street = Value(street),
        neighborhood = Value(neighborhood),
        city = Value(city),
        state = Value(state);
  static Insertable<AddressRow> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<String>? zipcode,
    Expression<String>? street,
    Expression<String>? additional,
    Expression<String>? number,
    Expression<String>? neighborhood,
    Expression<String>? city,
    Expression<String>? state,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (zipcode != null) 'zipcode': zipcode,
      if (street != null) 'street': street,
      if (additional != null) 'additional': additional,
      if (number != null) 'number': number,
      if (neighborhood != null) 'neighborhood': neighborhood,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AddressRowsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<String>? zipcode,
      Value<String>? street,
      Value<String?>? additional,
      Value<String?>? number,
      Value<String>? neighborhood,
      Value<String>? city,
      Value<String>? state,
      Value<int>? rowid}) {
    return AddressRowsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      zipcode: zipcode ?? this.zipcode,
      street: street ?? this.street,
      additional: additional ?? this.additional,
      number: number ?? this.number,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
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
    if (zipcode.present) {
      map['zipcode'] = Variable<String>(zipcode.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (additional.present) {
      map['additional'] = Variable<String>(additional.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (neighborhood.present) {
      map['neighborhood'] = Variable<String>(neighborhood.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
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
          ..write('zipcode: $zipcode, ')
          ..write('street: $street, ')
          ..write('additional: $additional, ')
          ..write('number: $number, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
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
