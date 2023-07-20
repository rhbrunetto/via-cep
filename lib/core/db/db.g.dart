// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $UserRowsTable extends UserRows with TableInfo<$UserRowsTable, UserRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, email, password];
  @override
  String get aliasedName => _alias ?? 'user_rows';
  @override
  String get actualTableName => 'user_rows';
  @override
  VerificationContext validateIntegrity(Insertable<UserRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
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
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $UserRowsTable createAlias(String alias) {
    return $UserRowsTable(attachedDatabase, alias);
  }
}

class UserRow extends DataClass implements Insertable<UserRow> {
  final String id;
  final String name;
  final String email;
  final String password;
  const UserRow(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  UserRowsCompanion toCompanion(bool nullToAbsent) {
    return UserRowsCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      password: Value(password),
    );
  }

  factory UserRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  UserRow copyWith(
          {String? id, String? name, String? email, String? password}) =>
      UserRow(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('UserRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.password == this.password);
}

class UserRowsCompanion extends UpdateCompanion<UserRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> password;
  final Value<int> rowid;
  const UserRowsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserRowsCompanion.insert({
    required String id,
    required String name,
    required String email,
    required String password,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        email = Value(email),
        password = Value(password);
  static Insertable<UserRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? password,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserRowsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? password,
      Value<int>? rowid}) {
    return UserRowsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserRowsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
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
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user_rows (id)'));
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
        state,
        userId
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
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
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
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
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
  final String userId;
  const AddressRow(
      {required this.id,
      required this.created,
      required this.zipcode,
      required this.street,
      this.additional,
      this.number,
      required this.neighborhood,
      required this.city,
      required this.state,
      required this.userId});
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
    map['user_id'] = Variable<String>(userId);
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
      userId: Value(userId),
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
      userId: serializer.fromJson<String>(json['userId']),
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
      'userId': serializer.toJson<String>(userId),
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
          String? state,
          String? userId}) =>
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
        userId: userId ?? this.userId,
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
          ..write('state: $state, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, created, zipcode, street, additional,
      number, neighborhood, city, state, userId);
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
          other.state == this.state &&
          other.userId == this.userId);
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
  final Value<String> userId;
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
    this.userId = const Value.absent(),
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
    required String userId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        zipcode = Value(zipcode),
        street = Value(street),
        neighborhood = Value(neighborhood),
        city = Value(city),
        state = Value(state),
        userId = Value(userId);
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
    Expression<String>? userId,
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
      if (userId != null) 'user_id': userId,
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
      Value<String>? userId,
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
      userId: userId ?? this.userId,
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
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
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
          ..write('userId: $userId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AvaDatabase extends GeneratedDatabase {
  _$AvaDatabase(QueryExecutor e) : super(e);
  late final $UserRowsTable userRows = $UserRowsTable(this);
  late final $AddressRowsTable addressRows = $AddressRowsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userRows, addressRows];
}
