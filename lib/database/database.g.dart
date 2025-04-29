// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $tableVehiclesTable extends tableVehicles
    with TableInfo<$tableVehiclesTable, tableVehicle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $tableVehiclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _vehicle_noMeta = const VerificationMeta(
    'vehicle_no',
  );
  @override
  late final GeneratedColumn<int> vehicle_no = GeneratedColumn<int>(
    'vehicle_no',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _plate_noMeta = const VerificationMeta(
    'plate_no',
  );
  @override
  late final GeneratedColumn<String> plate_no = GeneratedColumn<String>(
    'plate_no',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 7,
      maxTextLength: 7,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capacityMeta = const VerificationMeta(
    'capacity',
  );
  @override
  late final GeneratedColumn<int> capacity = GeneratedColumn<int>(
    'capacity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vehicle_typeMeta = const VerificationMeta(
    'vehicle_type',
  );
  @override
  late final GeneratedColumn<String> vehicle_type = GeneratedColumn<String>(
    'vehicle_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    vehicle_no,
    plate_no,
    capacity,
    vehicle_type,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'table_vehicles';
  @override
  VerificationContext validateIntegrity(
    Insertable<tableVehicle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('vehicle_no')) {
      context.handle(
        _vehicle_noMeta,
        vehicle_no.isAcceptableOrUnknown(data['vehicle_no']!, _vehicle_noMeta),
      );
    }
    if (data.containsKey('plate_no')) {
      context.handle(
        _plate_noMeta,
        plate_no.isAcceptableOrUnknown(data['plate_no']!, _plate_noMeta),
      );
    } else if (isInserting) {
      context.missing(_plate_noMeta);
    }
    if (data.containsKey('capacity')) {
      context.handle(
        _capacityMeta,
        capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta),
      );
    } else if (isInserting) {
      context.missing(_capacityMeta);
    }
    if (data.containsKey('vehicle_type')) {
      context.handle(
        _vehicle_typeMeta,
        vehicle_type.isAcceptableOrUnknown(
          data['vehicle_type']!,
          _vehicle_typeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicle_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {vehicle_no};
  @override
  tableVehicle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return tableVehicle(
      vehicle_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}vehicle_no'],
          )!,
      plate_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}plate_no'],
          )!,
      capacity:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}capacity'],
          )!,
      vehicle_type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}vehicle_type'],
          )!,
    );
  }

  @override
  $tableVehiclesTable createAlias(String alias) {
    return $tableVehiclesTable(attachedDatabase, alias);
  }
}

class tableVehicle extends DataClass implements Insertable<tableVehicle> {
  final int vehicle_no;
  final String plate_no;
  final int capacity;
  final String vehicle_type;
  const tableVehicle({
    required this.vehicle_no,
    required this.plate_no,
    required this.capacity,
    required this.vehicle_type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['vehicle_no'] = Variable<int>(vehicle_no);
    map['plate_no'] = Variable<String>(plate_no);
    map['capacity'] = Variable<int>(capacity);
    map['vehicle_type'] = Variable<String>(vehicle_type);
    return map;
  }

  tableVehiclesCompanion toCompanion(bool nullToAbsent) {
    return tableVehiclesCompanion(
      vehicle_no: Value(vehicle_no),
      plate_no: Value(plate_no),
      capacity: Value(capacity),
      vehicle_type: Value(vehicle_type),
    );
  }

  factory tableVehicle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return tableVehicle(
      vehicle_no: serializer.fromJson<int>(json['vehicle_no']),
      plate_no: serializer.fromJson<String>(json['plate_no']),
      capacity: serializer.fromJson<int>(json['capacity']),
      vehicle_type: serializer.fromJson<String>(json['vehicle_type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'vehicle_no': serializer.toJson<int>(vehicle_no),
      'plate_no': serializer.toJson<String>(plate_no),
      'capacity': serializer.toJson<int>(capacity),
      'vehicle_type': serializer.toJson<String>(vehicle_type),
    };
  }

  tableVehicle copyWith({
    int? vehicle_no,
    String? plate_no,
    int? capacity,
    String? vehicle_type,
  }) => tableVehicle(
    vehicle_no: vehicle_no ?? this.vehicle_no,
    plate_no: plate_no ?? this.plate_no,
    capacity: capacity ?? this.capacity,
    vehicle_type: vehicle_type ?? this.vehicle_type,
  );
  tableVehicle copyWithCompanion(tableVehiclesCompanion data) {
    return tableVehicle(
      vehicle_no:
          data.vehicle_no.present ? data.vehicle_no.value : this.vehicle_no,
      plate_no: data.plate_no.present ? data.plate_no.value : this.plate_no,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      vehicle_type:
          data.vehicle_type.present
              ? data.vehicle_type.value
              : this.vehicle_type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('tableVehicle(')
          ..write('vehicle_no: $vehicle_no, ')
          ..write('plate_no: $plate_no, ')
          ..write('capacity: $capacity, ')
          ..write('vehicle_type: $vehicle_type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(vehicle_no, plate_no, capacity, vehicle_type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is tableVehicle &&
          other.vehicle_no == this.vehicle_no &&
          other.plate_no == this.plate_no &&
          other.capacity == this.capacity &&
          other.vehicle_type == this.vehicle_type);
}

class tableVehiclesCompanion extends UpdateCompanion<tableVehicle> {
  final Value<int> vehicle_no;
  final Value<String> plate_no;
  final Value<int> capacity;
  final Value<String> vehicle_type;
  const tableVehiclesCompanion({
    this.vehicle_no = const Value.absent(),
    this.plate_no = const Value.absent(),
    this.capacity = const Value.absent(),
    this.vehicle_type = const Value.absent(),
  });
  tableVehiclesCompanion.insert({
    this.vehicle_no = const Value.absent(),
    required String plate_no,
    required int capacity,
    required String vehicle_type,
  }) : plate_no = Value(plate_no),
       capacity = Value(capacity),
       vehicle_type = Value(vehicle_type);
  static Insertable<tableVehicle> custom({
    Expression<int>? vehicle_no,
    Expression<String>? plate_no,
    Expression<int>? capacity,
    Expression<String>? vehicle_type,
  }) {
    return RawValuesInsertable({
      if (vehicle_no != null) 'vehicle_no': vehicle_no,
      if (plate_no != null) 'plate_no': plate_no,
      if (capacity != null) 'capacity': capacity,
      if (vehicle_type != null) 'vehicle_type': vehicle_type,
    });
  }

  tableVehiclesCompanion copyWith({
    Value<int>? vehicle_no,
    Value<String>? plate_no,
    Value<int>? capacity,
    Value<String>? vehicle_type,
  }) {
    return tableVehiclesCompanion(
      vehicle_no: vehicle_no ?? this.vehicle_no,
      plate_no: plate_no ?? this.plate_no,
      capacity: capacity ?? this.capacity,
      vehicle_type: vehicle_type ?? this.vehicle_type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (vehicle_no.present) {
      map['vehicle_no'] = Variable<int>(vehicle_no.value);
    }
    if (plate_no.present) {
      map['plate_no'] = Variable<String>(plate_no.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<int>(capacity.value);
    }
    if (vehicle_type.present) {
      map['vehicle_type'] = Variable<String>(vehicle_type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('tableVehiclesCompanion(')
          ..write('vehicle_no: $vehicle_no, ')
          ..write('plate_no: $plate_no, ')
          ..write('capacity: $capacity, ')
          ..write('vehicle_type: $vehicle_type')
          ..write(')'))
        .toString();
  }
}

class $tableDriversTable extends tableDrivers
    with TableInfo<$tableDriversTable, tableDriver> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $tableDriversTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _driver_noMeta = const VerificationMeta(
    'driver_no',
  );
  @override
  late final GeneratedColumn<int> driver_no = GeneratedColumn<int>(
    'driver_no',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _first_nameMeta = const VerificationMeta(
    'first_name',
  );
  @override
  late final GeneratedColumn<String> first_name = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _last_nameMeta = const VerificationMeta(
    'last_name',
  );
  @override
  late final GeneratedColumn<String> last_name = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [driver_no, first_name, last_name, age];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'table_drivers';
  @override
  VerificationContext validateIntegrity(
    Insertable<tableDriver> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('driver_no')) {
      context.handle(
        _driver_noMeta,
        driver_no.isAcceptableOrUnknown(data['driver_no']!, _driver_noMeta),
      );
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _first_nameMeta,
        first_name.isAcceptableOrUnknown(data['first_name']!, _first_nameMeta),
      );
    } else if (isInserting) {
      context.missing(_first_nameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _last_nameMeta,
        last_name.isAcceptableOrUnknown(data['last_name']!, _last_nameMeta),
      );
    } else if (isInserting) {
      context.missing(_last_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {driver_no};
  @override
  tableDriver map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return tableDriver(
      driver_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}driver_no'],
          )!,
      first_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}first_name'],
          )!,
      last_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}last_name'],
          )!,
      age:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}age'],
          )!,
    );
  }

  @override
  $tableDriversTable createAlias(String alias) {
    return $tableDriversTable(attachedDatabase, alias);
  }
}

class tableDriver extends DataClass implements Insertable<tableDriver> {
  final int driver_no;
  final String first_name;
  final String last_name;
  final int age;
  const tableDriver({
    required this.driver_no,
    required this.first_name,
    required this.last_name,
    required this.age,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['driver_no'] = Variable<int>(driver_no);
    map['first_name'] = Variable<String>(first_name);
    map['last_name'] = Variable<String>(last_name);
    map['age'] = Variable<int>(age);
    return map;
  }

  tableDriversCompanion toCompanion(bool nullToAbsent) {
    return tableDriversCompanion(
      driver_no: Value(driver_no),
      first_name: Value(first_name),
      last_name: Value(last_name),
      age: Value(age),
    );
  }

  factory tableDriver.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return tableDriver(
      driver_no: serializer.fromJson<int>(json['driver_no']),
      first_name: serializer.fromJson<String>(json['first_name']),
      last_name: serializer.fromJson<String>(json['last_name']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'driver_no': serializer.toJson<int>(driver_no),
      'first_name': serializer.toJson<String>(first_name),
      'last_name': serializer.toJson<String>(last_name),
      'age': serializer.toJson<int>(age),
    };
  }

  tableDriver copyWith({
    int? driver_no,
    String? first_name,
    String? last_name,
    int? age,
  }) => tableDriver(
    driver_no: driver_no ?? this.driver_no,
    first_name: first_name ?? this.first_name,
    last_name: last_name ?? this.last_name,
    age: age ?? this.age,
  );
  tableDriver copyWithCompanion(tableDriversCompanion data) {
    return tableDriver(
      driver_no: data.driver_no.present ? data.driver_no.value : this.driver_no,
      first_name:
          data.first_name.present ? data.first_name.value : this.first_name,
      last_name: data.last_name.present ? data.last_name.value : this.last_name,
      age: data.age.present ? data.age.value : this.age,
    );
  }

  @override
  String toString() {
    return (StringBuffer('tableDriver(')
          ..write('driver_no: $driver_no, ')
          ..write('first_name: $first_name, ')
          ..write('last_name: $last_name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(driver_no, first_name, last_name, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is tableDriver &&
          other.driver_no == this.driver_no &&
          other.first_name == this.first_name &&
          other.last_name == this.last_name &&
          other.age == this.age);
}

class tableDriversCompanion extends UpdateCompanion<tableDriver> {
  final Value<int> driver_no;
  final Value<String> first_name;
  final Value<String> last_name;
  final Value<int> age;
  const tableDriversCompanion({
    this.driver_no = const Value.absent(),
    this.first_name = const Value.absent(),
    this.last_name = const Value.absent(),
    this.age = const Value.absent(),
  });
  tableDriversCompanion.insert({
    this.driver_no = const Value.absent(),
    required String first_name,
    required String last_name,
    required int age,
  }) : first_name = Value(first_name),
       last_name = Value(last_name),
       age = Value(age);
  static Insertable<tableDriver> custom({
    Expression<int>? driver_no,
    Expression<String>? first_name,
    Expression<String>? last_name,
    Expression<int>? age,
  }) {
    return RawValuesInsertable({
      if (driver_no != null) 'driver_no': driver_no,
      if (first_name != null) 'first_name': first_name,
      if (last_name != null) 'last_name': last_name,
      if (age != null) 'age': age,
    });
  }

  tableDriversCompanion copyWith({
    Value<int>? driver_no,
    Value<String>? first_name,
    Value<String>? last_name,
    Value<int>? age,
  }) {
    return tableDriversCompanion(
      driver_no: driver_no ?? this.driver_no,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (driver_no.present) {
      map['driver_no'] = Variable<int>(driver_no.value);
    }
    if (first_name.present) {
      map['first_name'] = Variable<String>(first_name.value);
    }
    if (last_name.present) {
      map['last_name'] = Variable<String>(last_name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('tableDriversCompanion(')
          ..write('driver_no: $driver_no, ')
          ..write('first_name: $first_name, ')
          ..write('last_name: $last_name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

class $tableConductorsTable extends tableConductors
    with TableInfo<$tableConductorsTable, tableConductor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $tableConductorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _conductor_noMeta = const VerificationMeta(
    'conductor_no',
  );
  @override
  late final GeneratedColumn<int> conductor_no = GeneratedColumn<int>(
    'conductor_no',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _first_nameMeta = const VerificationMeta(
    'first_name',
  );
  @override
  late final GeneratedColumn<String> first_name = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _last_nameMeta = const VerificationMeta(
    'last_name',
  );
  @override
  late final GeneratedColumn<String> last_name = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    conductor_no,
    first_name,
    last_name,
    age,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'table_conductors';
  @override
  VerificationContext validateIntegrity(
    Insertable<tableConductor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('conductor_no')) {
      context.handle(
        _conductor_noMeta,
        conductor_no.isAcceptableOrUnknown(
          data['conductor_no']!,
          _conductor_noMeta,
        ),
      );
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _first_nameMeta,
        first_name.isAcceptableOrUnknown(data['first_name']!, _first_nameMeta),
      );
    } else if (isInserting) {
      context.missing(_first_nameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _last_nameMeta,
        last_name.isAcceptableOrUnknown(data['last_name']!, _last_nameMeta),
      );
    } else if (isInserting) {
      context.missing(_last_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {conductor_no};
  @override
  tableConductor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return tableConductor(
      conductor_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}conductor_no'],
          )!,
      first_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}first_name'],
          )!,
      last_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}last_name'],
          )!,
      age:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}age'],
          )!,
    );
  }

  @override
  $tableConductorsTable createAlias(String alias) {
    return $tableConductorsTable(attachedDatabase, alias);
  }
}

class tableConductor extends DataClass implements Insertable<tableConductor> {
  final int conductor_no;
  final String first_name;
  final String last_name;
  final int age;
  const tableConductor({
    required this.conductor_no,
    required this.first_name,
    required this.last_name,
    required this.age,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['conductor_no'] = Variable<int>(conductor_no);
    map['first_name'] = Variable<String>(first_name);
    map['last_name'] = Variable<String>(last_name);
    map['age'] = Variable<int>(age);
    return map;
  }

  tableConductorsCompanion toCompanion(bool nullToAbsent) {
    return tableConductorsCompanion(
      conductor_no: Value(conductor_no),
      first_name: Value(first_name),
      last_name: Value(last_name),
      age: Value(age),
    );
  }

  factory tableConductor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return tableConductor(
      conductor_no: serializer.fromJson<int>(json['conductor_no']),
      first_name: serializer.fromJson<String>(json['first_name']),
      last_name: serializer.fromJson<String>(json['last_name']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'conductor_no': serializer.toJson<int>(conductor_no),
      'first_name': serializer.toJson<String>(first_name),
      'last_name': serializer.toJson<String>(last_name),
      'age': serializer.toJson<int>(age),
    };
  }

  tableConductor copyWith({
    int? conductor_no,
    String? first_name,
    String? last_name,
    int? age,
  }) => tableConductor(
    conductor_no: conductor_no ?? this.conductor_no,
    first_name: first_name ?? this.first_name,
    last_name: last_name ?? this.last_name,
    age: age ?? this.age,
  );
  tableConductor copyWithCompanion(tableConductorsCompanion data) {
    return tableConductor(
      conductor_no:
          data.conductor_no.present
              ? data.conductor_no.value
              : this.conductor_no,
      first_name:
          data.first_name.present ? data.first_name.value : this.first_name,
      last_name: data.last_name.present ? data.last_name.value : this.last_name,
      age: data.age.present ? data.age.value : this.age,
    );
  }

  @override
  String toString() {
    return (StringBuffer('tableConductor(')
          ..write('conductor_no: $conductor_no, ')
          ..write('first_name: $first_name, ')
          ..write('last_name: $last_name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(conductor_no, first_name, last_name, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is tableConductor &&
          other.conductor_no == this.conductor_no &&
          other.first_name == this.first_name &&
          other.last_name == this.last_name &&
          other.age == this.age);
}

class tableConductorsCompanion extends UpdateCompanion<tableConductor> {
  final Value<int> conductor_no;
  final Value<String> first_name;
  final Value<String> last_name;
  final Value<int> age;
  const tableConductorsCompanion({
    this.conductor_no = const Value.absent(),
    this.first_name = const Value.absent(),
    this.last_name = const Value.absent(),
    this.age = const Value.absent(),
  });
  tableConductorsCompanion.insert({
    this.conductor_no = const Value.absent(),
    required String first_name,
    required String last_name,
    required int age,
  }) : first_name = Value(first_name),
       last_name = Value(last_name),
       age = Value(age);
  static Insertable<tableConductor> custom({
    Expression<int>? conductor_no,
    Expression<String>? first_name,
    Expression<String>? last_name,
    Expression<int>? age,
  }) {
    return RawValuesInsertable({
      if (conductor_no != null) 'conductor_no': conductor_no,
      if (first_name != null) 'first_name': first_name,
      if (last_name != null) 'last_name': last_name,
      if (age != null) 'age': age,
    });
  }

  tableConductorsCompanion copyWith({
    Value<int>? conductor_no,
    Value<String>? first_name,
    Value<String>? last_name,
    Value<int>? age,
  }) {
    return tableConductorsCompanion(
      conductor_no: conductor_no ?? this.conductor_no,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (conductor_no.present) {
      map['conductor_no'] = Variable<int>(conductor_no.value);
    }
    if (first_name.present) {
      map['first_name'] = Variable<String>(first_name.value);
    }
    if (last_name.present) {
      map['last_name'] = Variable<String>(last_name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('tableConductorsCompanion(')
          ..write('conductor_no: $conductor_no, ')
          ..write('first_name: $first_name, ')
          ..write('last_name: $last_name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

class $tableTerminalsTable extends tableTerminals
    with TableInfo<$tableTerminalsTable, tableTerminal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $tableTerminalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _terminal_idMeta = const VerificationMeta(
    'terminal_id',
  );
  @override
  late final GeneratedColumn<int> terminal_id = GeneratedColumn<int>(
    'terminal_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vehicle_noMeta = const VerificationMeta(
    'vehicle_no',
  );
  @override
  late final GeneratedColumn<int> vehicle_no = GeneratedColumn<int>(
    'vehicle_no',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _availableMeta = const VerificationMeta(
    'available',
  );
  @override
  late final GeneratedColumn<int> available = GeneratedColumn<int>(
    'available',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    terminal_id,
    status,
    vehicle_no,
    available,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'table_terminals';
  @override
  VerificationContext validateIntegrity(
    Insertable<tableTerminal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('terminal_id')) {
      context.handle(
        _terminal_idMeta,
        terminal_id.isAcceptableOrUnknown(
          data['terminal_id']!,
          _terminal_idMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('vehicle_no')) {
      context.handle(
        _vehicle_noMeta,
        vehicle_no.isAcceptableOrUnknown(data['vehicle_no']!, _vehicle_noMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicle_noMeta);
    }
    if (data.containsKey('available')) {
      context.handle(
        _availableMeta,
        available.isAcceptableOrUnknown(data['available']!, _availableMeta),
      );
    } else if (isInserting) {
      context.missing(_availableMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {terminal_id};
  @override
  tableTerminal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return tableTerminal(
      terminal_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}terminal_id'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      vehicle_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}vehicle_no'],
          )!,
      available:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}available'],
          )!,
    );
  }

  @override
  $tableTerminalsTable createAlias(String alias) {
    return $tableTerminalsTable(attachedDatabase, alias);
  }
}

class tableTerminal extends DataClass implements Insertable<tableTerminal> {
  final int terminal_id;
  final String status;
  final int vehicle_no;
  final int available;
  const tableTerminal({
    required this.terminal_id,
    required this.status,
    required this.vehicle_no,
    required this.available,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['terminal_id'] = Variable<int>(terminal_id);
    map['status'] = Variable<String>(status);
    map['vehicle_no'] = Variable<int>(vehicle_no);
    map['available'] = Variable<int>(available);
    return map;
  }

  tableTerminalsCompanion toCompanion(bool nullToAbsent) {
    return tableTerminalsCompanion(
      terminal_id: Value(terminal_id),
      status: Value(status),
      vehicle_no: Value(vehicle_no),
      available: Value(available),
    );
  }

  factory tableTerminal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return tableTerminal(
      terminal_id: serializer.fromJson<int>(json['terminal_id']),
      status: serializer.fromJson<String>(json['status']),
      vehicle_no: serializer.fromJson<int>(json['vehicle_no']),
      available: serializer.fromJson<int>(json['available']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'terminal_id': serializer.toJson<int>(terminal_id),
      'status': serializer.toJson<String>(status),
      'vehicle_no': serializer.toJson<int>(vehicle_no),
      'available': serializer.toJson<int>(available),
    };
  }

  tableTerminal copyWith({
    int? terminal_id,
    String? status,
    int? vehicle_no,
    int? available,
  }) => tableTerminal(
    terminal_id: terminal_id ?? this.terminal_id,
    status: status ?? this.status,
    vehicle_no: vehicle_no ?? this.vehicle_no,
    available: available ?? this.available,
  );
  tableTerminal copyWithCompanion(tableTerminalsCompanion data) {
    return tableTerminal(
      terminal_id:
          data.terminal_id.present ? data.terminal_id.value : this.terminal_id,
      status: data.status.present ? data.status.value : this.status,
      vehicle_no:
          data.vehicle_no.present ? data.vehicle_no.value : this.vehicle_no,
      available: data.available.present ? data.available.value : this.available,
    );
  }

  @override
  String toString() {
    return (StringBuffer('tableTerminal(')
          ..write('terminal_id: $terminal_id, ')
          ..write('status: $status, ')
          ..write('vehicle_no: $vehicle_no, ')
          ..write('available: $available')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(terminal_id, status, vehicle_no, available);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is tableTerminal &&
          other.terminal_id == this.terminal_id &&
          other.status == this.status &&
          other.vehicle_no == this.vehicle_no &&
          other.available == this.available);
}

class tableTerminalsCompanion extends UpdateCompanion<tableTerminal> {
  final Value<int> terminal_id;
  final Value<String> status;
  final Value<int> vehicle_no;
  final Value<int> available;
  const tableTerminalsCompanion({
    this.terminal_id = const Value.absent(),
    this.status = const Value.absent(),
    this.vehicle_no = const Value.absent(),
    this.available = const Value.absent(),
  });
  tableTerminalsCompanion.insert({
    this.terminal_id = const Value.absent(),
    required String status,
    required int vehicle_no,
    required int available,
  }) : status = Value(status),
       vehicle_no = Value(vehicle_no),
       available = Value(available);
  static Insertable<tableTerminal> custom({
    Expression<int>? terminal_id,
    Expression<String>? status,
    Expression<int>? vehicle_no,
    Expression<int>? available,
  }) {
    return RawValuesInsertable({
      if (terminal_id != null) 'terminal_id': terminal_id,
      if (status != null) 'status': status,
      if (vehicle_no != null) 'vehicle_no': vehicle_no,
      if (available != null) 'available': available,
    });
  }

  tableTerminalsCompanion copyWith({
    Value<int>? terminal_id,
    Value<String>? status,
    Value<int>? vehicle_no,
    Value<int>? available,
  }) {
    return tableTerminalsCompanion(
      terminal_id: terminal_id ?? this.terminal_id,
      status: status ?? this.status,
      vehicle_no: vehicle_no ?? this.vehicle_no,
      available: available ?? this.available,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (terminal_id.present) {
      map['terminal_id'] = Variable<int>(terminal_id.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (vehicle_no.present) {
      map['vehicle_no'] = Variable<int>(vehicle_no.value);
    }
    if (available.present) {
      map['available'] = Variable<int>(available.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('tableTerminalsCompanion(')
          ..write('terminal_id: $terminal_id, ')
          ..write('status: $status, ')
          ..write('vehicle_no: $vehicle_no, ')
          ..write('available: $available')
          ..write(')'))
        .toString();
  }
}

class $tableTripsTable extends tableTrips
    with TableInfo<$tableTripsTable, tableTrip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $tableTripsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _trip_idMeta = const VerificationMeta(
    'trip_id',
  );
  @override
  late final GeneratedColumn<int> trip_id = GeneratedColumn<int>(
    'trip_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _vehicle_noMeta = const VerificationMeta(
    'vehicle_no',
  );
  @override
  late final GeneratedColumn<int> vehicle_no = GeneratedColumn<int>(
    'vehicle_no',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _start_teminal_idMeta = const VerificationMeta(
    'start_teminal_id',
  );
  @override
  late final GeneratedColumn<int> start_teminal_id = GeneratedColumn<int>(
    'start_teminal_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _end_terminal_idMeta = const VerificationMeta(
    'end_terminal_id',
  );
  @override
  late final GeneratedColumn<int> end_terminal_id = GeneratedColumn<int>(
    'end_terminal_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _driver_idMeta = const VerificationMeta(
    'driver_id',
  );
  @override
  late final GeneratedColumn<int> driver_id = GeneratedColumn<int>(
    'driver_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conductor_idMeta = const VerificationMeta(
    'conductor_id',
  );
  @override
  late final GeneratedColumn<int> conductor_id = GeneratedColumn<int>(
    'conductor_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    trip_id,
    vehicle_no,
    start_teminal_id,
    end_terminal_id,
    driver_id,
    conductor_id,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'table_trips';
  @override
  VerificationContext validateIntegrity(
    Insertable<tableTrip> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('trip_id')) {
      context.handle(
        _trip_idMeta,
        trip_id.isAcceptableOrUnknown(data['trip_id']!, _trip_idMeta),
      );
    }
    if (data.containsKey('vehicle_no')) {
      context.handle(
        _vehicle_noMeta,
        vehicle_no.isAcceptableOrUnknown(data['vehicle_no']!, _vehicle_noMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicle_noMeta);
    }
    if (data.containsKey('start_teminal_id')) {
      context.handle(
        _start_teminal_idMeta,
        start_teminal_id.isAcceptableOrUnknown(
          data['start_teminal_id']!,
          _start_teminal_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_start_teminal_idMeta);
    }
    if (data.containsKey('end_terminal_id')) {
      context.handle(
        _end_terminal_idMeta,
        end_terminal_id.isAcceptableOrUnknown(
          data['end_terminal_id']!,
          _end_terminal_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_end_terminal_idMeta);
    }
    if (data.containsKey('driver_id')) {
      context.handle(
        _driver_idMeta,
        driver_id.isAcceptableOrUnknown(data['driver_id']!, _driver_idMeta),
      );
    } else if (isInserting) {
      context.missing(_driver_idMeta);
    }
    if (data.containsKey('conductor_id')) {
      context.handle(
        _conductor_idMeta,
        conductor_id.isAcceptableOrUnknown(
          data['conductor_id']!,
          _conductor_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conductor_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trip_id};
  @override
  tableTrip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return tableTrip(
      trip_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}trip_id'],
          )!,
      vehicle_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}vehicle_no'],
          )!,
      start_teminal_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}start_teminal_id'],
          )!,
      end_terminal_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}end_terminal_id'],
          )!,
      driver_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}driver_id'],
          )!,
      conductor_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}conductor_id'],
          )!,
    );
  }

  @override
  $tableTripsTable createAlias(String alias) {
    return $tableTripsTable(attachedDatabase, alias);
  }
}

class tableTrip extends DataClass implements Insertable<tableTrip> {
  final int trip_id;
  final int vehicle_no;
  final int start_teminal_id;
  final int end_terminal_id;
  final int driver_id;
  final int conductor_id;
  const tableTrip({
    required this.trip_id,
    required this.vehicle_no,
    required this.start_teminal_id,
    required this.end_terminal_id,
    required this.driver_id,
    required this.conductor_id,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['trip_id'] = Variable<int>(trip_id);
    map['vehicle_no'] = Variable<int>(vehicle_no);
    map['start_teminal_id'] = Variable<int>(start_teminal_id);
    map['end_terminal_id'] = Variable<int>(end_terminal_id);
    map['driver_id'] = Variable<int>(driver_id);
    map['conductor_id'] = Variable<int>(conductor_id);
    return map;
  }

  tableTripsCompanion toCompanion(bool nullToAbsent) {
    return tableTripsCompanion(
      trip_id: Value(trip_id),
      vehicle_no: Value(vehicle_no),
      start_teminal_id: Value(start_teminal_id),
      end_terminal_id: Value(end_terminal_id),
      driver_id: Value(driver_id),
      conductor_id: Value(conductor_id),
    );
  }

  factory tableTrip.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return tableTrip(
      trip_id: serializer.fromJson<int>(json['trip_id']),
      vehicle_no: serializer.fromJson<int>(json['vehicle_no']),
      start_teminal_id: serializer.fromJson<int>(json['start_teminal_id']),
      end_terminal_id: serializer.fromJson<int>(json['end_terminal_id']),
      driver_id: serializer.fromJson<int>(json['driver_id']),
      conductor_id: serializer.fromJson<int>(json['conductor_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trip_id': serializer.toJson<int>(trip_id),
      'vehicle_no': serializer.toJson<int>(vehicle_no),
      'start_teminal_id': serializer.toJson<int>(start_teminal_id),
      'end_terminal_id': serializer.toJson<int>(end_terminal_id),
      'driver_id': serializer.toJson<int>(driver_id),
      'conductor_id': serializer.toJson<int>(conductor_id),
    };
  }

  tableTrip copyWith({
    int? trip_id,
    int? vehicle_no,
    int? start_teminal_id,
    int? end_terminal_id,
    int? driver_id,
    int? conductor_id,
  }) => tableTrip(
    trip_id: trip_id ?? this.trip_id,
    vehicle_no: vehicle_no ?? this.vehicle_no,
    start_teminal_id: start_teminal_id ?? this.start_teminal_id,
    end_terminal_id: end_terminal_id ?? this.end_terminal_id,
    driver_id: driver_id ?? this.driver_id,
    conductor_id: conductor_id ?? this.conductor_id,
  );
  tableTrip copyWithCompanion(tableTripsCompanion data) {
    return tableTrip(
      trip_id: data.trip_id.present ? data.trip_id.value : this.trip_id,
      vehicle_no:
          data.vehicle_no.present ? data.vehicle_no.value : this.vehicle_no,
      start_teminal_id:
          data.start_teminal_id.present
              ? data.start_teminal_id.value
              : this.start_teminal_id,
      end_terminal_id:
          data.end_terminal_id.present
              ? data.end_terminal_id.value
              : this.end_terminal_id,
      driver_id: data.driver_id.present ? data.driver_id.value : this.driver_id,
      conductor_id:
          data.conductor_id.present
              ? data.conductor_id.value
              : this.conductor_id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('tableTrip(')
          ..write('trip_id: $trip_id, ')
          ..write('vehicle_no: $vehicle_no, ')
          ..write('start_teminal_id: $start_teminal_id, ')
          ..write('end_terminal_id: $end_terminal_id, ')
          ..write('driver_id: $driver_id, ')
          ..write('conductor_id: $conductor_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    trip_id,
    vehicle_no,
    start_teminal_id,
    end_terminal_id,
    driver_id,
    conductor_id,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is tableTrip &&
          other.trip_id == this.trip_id &&
          other.vehicle_no == this.vehicle_no &&
          other.start_teminal_id == this.start_teminal_id &&
          other.end_terminal_id == this.end_terminal_id &&
          other.driver_id == this.driver_id &&
          other.conductor_id == this.conductor_id);
}

class tableTripsCompanion extends UpdateCompanion<tableTrip> {
  final Value<int> trip_id;
  final Value<int> vehicle_no;
  final Value<int> start_teminal_id;
  final Value<int> end_terminal_id;
  final Value<int> driver_id;
  final Value<int> conductor_id;
  const tableTripsCompanion({
    this.trip_id = const Value.absent(),
    this.vehicle_no = const Value.absent(),
    this.start_teminal_id = const Value.absent(),
    this.end_terminal_id = const Value.absent(),
    this.driver_id = const Value.absent(),
    this.conductor_id = const Value.absent(),
  });
  tableTripsCompanion.insert({
    this.trip_id = const Value.absent(),
    required int vehicle_no,
    required int start_teminal_id,
    required int end_terminal_id,
    required int driver_id,
    required int conductor_id,
  }) : vehicle_no = Value(vehicle_no),
       start_teminal_id = Value(start_teminal_id),
       end_terminal_id = Value(end_terminal_id),
       driver_id = Value(driver_id),
       conductor_id = Value(conductor_id);
  static Insertable<tableTrip> custom({
    Expression<int>? trip_id,
    Expression<int>? vehicle_no,
    Expression<int>? start_teminal_id,
    Expression<int>? end_terminal_id,
    Expression<int>? driver_id,
    Expression<int>? conductor_id,
  }) {
    return RawValuesInsertable({
      if (trip_id != null) 'trip_id': trip_id,
      if (vehicle_no != null) 'vehicle_no': vehicle_no,
      if (start_teminal_id != null) 'start_teminal_id': start_teminal_id,
      if (end_terminal_id != null) 'end_terminal_id': end_terminal_id,
      if (driver_id != null) 'driver_id': driver_id,
      if (conductor_id != null) 'conductor_id': conductor_id,
    });
  }

  tableTripsCompanion copyWith({
    Value<int>? trip_id,
    Value<int>? vehicle_no,
    Value<int>? start_teminal_id,
    Value<int>? end_terminal_id,
    Value<int>? driver_id,
    Value<int>? conductor_id,
  }) {
    return tableTripsCompanion(
      trip_id: trip_id ?? this.trip_id,
      vehicle_no: vehicle_no ?? this.vehicle_no,
      start_teminal_id: start_teminal_id ?? this.start_teminal_id,
      end_terminal_id: end_terminal_id ?? this.end_terminal_id,
      driver_id: driver_id ?? this.driver_id,
      conductor_id: conductor_id ?? this.conductor_id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trip_id.present) {
      map['trip_id'] = Variable<int>(trip_id.value);
    }
    if (vehicle_no.present) {
      map['vehicle_no'] = Variable<int>(vehicle_no.value);
    }
    if (start_teminal_id.present) {
      map['start_teminal_id'] = Variable<int>(start_teminal_id.value);
    }
    if (end_terminal_id.present) {
      map['end_terminal_id'] = Variable<int>(end_terminal_id.value);
    }
    if (driver_id.present) {
      map['driver_id'] = Variable<int>(driver_id.value);
    }
    if (conductor_id.present) {
      map['conductor_id'] = Variable<int>(conductor_id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('tableTripsCompanion(')
          ..write('trip_id: $trip_id, ')
          ..write('vehicle_no: $vehicle_no, ')
          ..write('start_teminal_id: $start_teminal_id, ')
          ..write('end_terminal_id: $end_terminal_id, ')
          ..write('driver_id: $driver_id, ')
          ..write('conductor_id: $conductor_id')
          ..write(')'))
        .toString();
  }
}

class viewVehicle extends DataClass {
  final int vehicle_no;
  final String plate_no;
  final int capacity;
  final String vehicle_type;
  const viewVehicle({
    required this.vehicle_no,
    required this.plate_no,
    required this.capacity,
    required this.vehicle_type,
  });
  factory viewVehicle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return viewVehicle(
      vehicle_no: serializer.fromJson<int>(json['vehicle_no']),
      plate_no: serializer.fromJson<String>(json['plate_no']),
      capacity: serializer.fromJson<int>(json['capacity']),
      vehicle_type: serializer.fromJson<String>(json['vehicle_type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'vehicle_no': serializer.toJson<int>(vehicle_no),
      'plate_no': serializer.toJson<String>(plate_no),
      'capacity': serializer.toJson<int>(capacity),
      'vehicle_type': serializer.toJson<String>(vehicle_type),
    };
  }

  viewVehicle copyWith({
    int? vehicle_no,
    String? plate_no,
    int? capacity,
    String? vehicle_type,
  }) => viewVehicle(
    vehicle_no: vehicle_no ?? this.vehicle_no,
    plate_no: plate_no ?? this.plate_no,
    capacity: capacity ?? this.capacity,
    vehicle_type: vehicle_type ?? this.vehicle_type,
  );
  @override
  String toString() {
    return (StringBuffer('viewVehicle(')
          ..write('vehicle_no: $vehicle_no, ')
          ..write('plate_no: $plate_no, ')
          ..write('capacity: $capacity, ')
          ..write('vehicle_type: $vehicle_type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(vehicle_no, plate_no, capacity, vehicle_type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is viewVehicle &&
          other.vehicle_no == this.vehicle_no &&
          other.plate_no == this.plate_no &&
          other.capacity == this.capacity &&
          other.vehicle_type == this.vehicle_type);
}

class $viewVehiclesView extends ViewInfo<$viewVehiclesView, viewVehicle>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
  $viewVehiclesView(this.attachedDatabase, [this._alias]);
  $tableVehiclesTable get vehicles =>
      attachedDatabase.tableVehicles.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [
    vehicle_no,
    plate_no,
    capacity,
    vehicle_type,
  ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'view_vehicles';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $viewVehiclesView get asDslTable => this;
  @override
  viewVehicle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return viewVehicle(
      vehicle_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}vehicle_no'],
          )!,
      plate_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}plate_no'],
          )!,
      capacity:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}capacity'],
          )!,
      vehicle_type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}vehicle_type'],
          )!,
    );
  }

  late final GeneratedColumn<int> vehicle_no = GeneratedColumn<int>(
    'vehicle_no',
    aliasedName,
    false,
    generatedAs: GeneratedAs(vehicles.vehicle_no, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> plate_no = GeneratedColumn<String>(
    'plate_no',
    aliasedName,
    false,
    generatedAs: GeneratedAs(vehicles.plate_no, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<int> capacity = GeneratedColumn<int>(
    'capacity',
    aliasedName,
    false,
    generatedAs: GeneratedAs(vehicles.capacity, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> vehicle_type = GeneratedColumn<String>(
    'vehicle_type',
    aliasedName,
    false,
    generatedAs: GeneratedAs(vehicles.vehicle_type, false),
    type: DriftSqlType.string,
  );
  @override
  $viewVehiclesView createAlias(String alias) {
    return $viewVehiclesView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(vehicles)..addColumns($columns));
  @override
  Set<String> get readTables => const {'table_vehicles'};
}

class viewDriver extends DataClass {
  final int driver_no;
  final String first_name;
  final String last_name;
  final int age;
  const viewDriver({
    required this.driver_no,
    required this.first_name,
    required this.last_name,
    required this.age,
  });
  factory viewDriver.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return viewDriver(
      driver_no: serializer.fromJson<int>(json['driver_no']),
      first_name: serializer.fromJson<String>(json['first_name']),
      last_name: serializer.fromJson<String>(json['last_name']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'driver_no': serializer.toJson<int>(driver_no),
      'first_name': serializer.toJson<String>(first_name),
      'last_name': serializer.toJson<String>(last_name),
      'age': serializer.toJson<int>(age),
    };
  }

  viewDriver copyWith({
    int? driver_no,
    String? first_name,
    String? last_name,
    int? age,
  }) => viewDriver(
    driver_no: driver_no ?? this.driver_no,
    first_name: first_name ?? this.first_name,
    last_name: last_name ?? this.last_name,
    age: age ?? this.age,
  );
  @override
  String toString() {
    return (StringBuffer('viewDriver(')
          ..write('driver_no: $driver_no, ')
          ..write('first_name: $first_name, ')
          ..write('last_name: $last_name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(driver_no, first_name, last_name, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is viewDriver &&
          other.driver_no == this.driver_no &&
          other.first_name == this.first_name &&
          other.last_name == this.last_name &&
          other.age == this.age);
}

class $viewDriversView extends ViewInfo<$viewDriversView, viewDriver>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
  $viewDriversView(this.attachedDatabase, [this._alias]);
  $tableDriversTable get drivers =>
      attachedDatabase.tableDrivers.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [driver_no, first_name, last_name, age];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'view_drivers';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $viewDriversView get asDslTable => this;
  @override
  viewDriver map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return viewDriver(
      driver_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}driver_no'],
          )!,
      first_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}first_name'],
          )!,
      last_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}last_name'],
          )!,
      age:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}age'],
          )!,
    );
  }

  late final GeneratedColumn<int> driver_no = GeneratedColumn<int>(
    'driver_no',
    aliasedName,
    false,
    generatedAs: GeneratedAs(drivers.driver_no, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> first_name = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    generatedAs: GeneratedAs(drivers.first_name, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> last_name = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    generatedAs: GeneratedAs(drivers.last_name, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    generatedAs: GeneratedAs(drivers.age, false),
    type: DriftSqlType.int,
  );
  @override
  $viewDriversView createAlias(String alias) {
    return $viewDriversView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(drivers)..addColumns($columns));
  @override
  Set<String> get readTables => const {'table_drivers'};
}

class viewConductor extends DataClass {
  final int conductor_no;
  final String first_name;
  final String last_name;
  final int age;
  const viewConductor({
    required this.conductor_no,
    required this.first_name,
    required this.last_name,
    required this.age,
  });
  factory viewConductor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return viewConductor(
      conductor_no: serializer.fromJson<int>(json['conductor_no']),
      first_name: serializer.fromJson<String>(json['first_name']),
      last_name: serializer.fromJson<String>(json['last_name']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'conductor_no': serializer.toJson<int>(conductor_no),
      'first_name': serializer.toJson<String>(first_name),
      'last_name': serializer.toJson<String>(last_name),
      'age': serializer.toJson<int>(age),
    };
  }

  viewConductor copyWith({
    int? conductor_no,
    String? first_name,
    String? last_name,
    int? age,
  }) => viewConductor(
    conductor_no: conductor_no ?? this.conductor_no,
    first_name: first_name ?? this.first_name,
    last_name: last_name ?? this.last_name,
    age: age ?? this.age,
  );
  @override
  String toString() {
    return (StringBuffer('viewConductor(')
          ..write('conductor_no: $conductor_no, ')
          ..write('first_name: $first_name, ')
          ..write('last_name: $last_name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(conductor_no, first_name, last_name, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is viewConductor &&
          other.conductor_no == this.conductor_no &&
          other.first_name == this.first_name &&
          other.last_name == this.last_name &&
          other.age == this.age);
}

class $viewConductorsView extends ViewInfo<$viewConductorsView, viewConductor>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
  $viewConductorsView(this.attachedDatabase, [this._alias]);
  $tableConductorsTable get conductors =>
      attachedDatabase.tableConductors.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [
    conductor_no,
    first_name,
    last_name,
    age,
  ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'view_conductors';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $viewConductorsView get asDslTable => this;
  @override
  viewConductor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return viewConductor(
      conductor_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}conductor_no'],
          )!,
      first_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}first_name'],
          )!,
      last_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}last_name'],
          )!,
      age:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}age'],
          )!,
    );
  }

  late final GeneratedColumn<int> conductor_no = GeneratedColumn<int>(
    'conductor_no',
    aliasedName,
    false,
    generatedAs: GeneratedAs(conductors.conductor_no, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> first_name = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    generatedAs: GeneratedAs(conductors.first_name, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> last_name = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    generatedAs: GeneratedAs(conductors.last_name, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    generatedAs: GeneratedAs(conductors.age, false),
    type: DriftSqlType.int,
  );
  @override
  $viewConductorsView createAlias(String alias) {
    return $viewConductorsView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(conductors)..addColumns($columns));
  @override
  Set<String> get readTables => const {'table_conductors'};
}

class viewTerminal extends DataClass {
  final int terminal_id;
  final String status;
  final int vehicle_no;
  final int available;
  const viewTerminal({
    required this.terminal_id,
    required this.status,
    required this.vehicle_no,
    required this.available,
  });
  factory viewTerminal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return viewTerminal(
      terminal_id: serializer.fromJson<int>(json['terminal_id']),
      status: serializer.fromJson<String>(json['status']),
      vehicle_no: serializer.fromJson<int>(json['vehicle_no']),
      available: serializer.fromJson<int>(json['available']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'terminal_id': serializer.toJson<int>(terminal_id),
      'status': serializer.toJson<String>(status),
      'vehicle_no': serializer.toJson<int>(vehicle_no),
      'available': serializer.toJson<int>(available),
    };
  }

  viewTerminal copyWith({
    int? terminal_id,
    String? status,
    int? vehicle_no,
    int? available,
  }) => viewTerminal(
    terminal_id: terminal_id ?? this.terminal_id,
    status: status ?? this.status,
    vehicle_no: vehicle_no ?? this.vehicle_no,
    available: available ?? this.available,
  );
  @override
  String toString() {
    return (StringBuffer('viewTerminal(')
          ..write('terminal_id: $terminal_id, ')
          ..write('status: $status, ')
          ..write('vehicle_no: $vehicle_no, ')
          ..write('available: $available')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(terminal_id, status, vehicle_no, available);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is viewTerminal &&
          other.terminal_id == this.terminal_id &&
          other.status == this.status &&
          other.vehicle_no == this.vehicle_no &&
          other.available == this.available);
}

class $viewTerminalsView extends ViewInfo<$viewTerminalsView, viewTerminal>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
  $viewTerminalsView(this.attachedDatabase, [this._alias]);
  $tableTerminalsTable get terminals =>
      attachedDatabase.tableTerminals.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [
    terminal_id,
    status,
    vehicle_no,
    available,
  ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'view_terminals';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $viewTerminalsView get asDslTable => this;
  @override
  viewTerminal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return viewTerminal(
      terminal_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}terminal_id'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      vehicle_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}vehicle_no'],
          )!,
      available:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}available'],
          )!,
    );
  }

  late final GeneratedColumn<int> terminal_id = GeneratedColumn<int>(
    'terminal_id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(terminals.terminal_id, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    generatedAs: GeneratedAs(terminals.status, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<int> vehicle_no = GeneratedColumn<int>(
    'vehicle_no',
    aliasedName,
    false,
    generatedAs: GeneratedAs(terminals.vehicle_no, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> available = GeneratedColumn<int>(
    'available',
    aliasedName,
    false,
    generatedAs: GeneratedAs(terminals.available, false),
    type: DriftSqlType.int,
  );
  @override
  $viewTerminalsView createAlias(String alias) {
    return $viewTerminalsView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(terminals)..addColumns($columns));
  @override
  Set<String> get readTables => const {'table_terminals'};
}

class viewTrip extends DataClass {
  final int trip_id;
  final int vehicle_no;
  final int start_teminal_id;
  final int end_terminal_id;
  final int driver_id;
  final int conductor_id;
  const viewTrip({
    required this.trip_id,
    required this.vehicle_no,
    required this.start_teminal_id,
    required this.end_terminal_id,
    required this.driver_id,
    required this.conductor_id,
  });
  factory viewTrip.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return viewTrip(
      trip_id: serializer.fromJson<int>(json['trip_id']),
      vehicle_no: serializer.fromJson<int>(json['vehicle_no']),
      start_teminal_id: serializer.fromJson<int>(json['start_teminal_id']),
      end_terminal_id: serializer.fromJson<int>(json['end_terminal_id']),
      driver_id: serializer.fromJson<int>(json['driver_id']),
      conductor_id: serializer.fromJson<int>(json['conductor_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trip_id': serializer.toJson<int>(trip_id),
      'vehicle_no': serializer.toJson<int>(vehicle_no),
      'start_teminal_id': serializer.toJson<int>(start_teminal_id),
      'end_terminal_id': serializer.toJson<int>(end_terminal_id),
      'driver_id': serializer.toJson<int>(driver_id),
      'conductor_id': serializer.toJson<int>(conductor_id),
    };
  }

  viewTrip copyWith({
    int? trip_id,
    int? vehicle_no,
    int? start_teminal_id,
    int? end_terminal_id,
    int? driver_id,
    int? conductor_id,
  }) => viewTrip(
    trip_id: trip_id ?? this.trip_id,
    vehicle_no: vehicle_no ?? this.vehicle_no,
    start_teminal_id: start_teminal_id ?? this.start_teminal_id,
    end_terminal_id: end_terminal_id ?? this.end_terminal_id,
    driver_id: driver_id ?? this.driver_id,
    conductor_id: conductor_id ?? this.conductor_id,
  );
  @override
  String toString() {
    return (StringBuffer('viewTrip(')
          ..write('trip_id: $trip_id, ')
          ..write('vehicle_no: $vehicle_no, ')
          ..write('start_teminal_id: $start_teminal_id, ')
          ..write('end_terminal_id: $end_terminal_id, ')
          ..write('driver_id: $driver_id, ')
          ..write('conductor_id: $conductor_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    trip_id,
    vehicle_no,
    start_teminal_id,
    end_terminal_id,
    driver_id,
    conductor_id,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is viewTrip &&
          other.trip_id == this.trip_id &&
          other.vehicle_no == this.vehicle_no &&
          other.start_teminal_id == this.start_teminal_id &&
          other.end_terminal_id == this.end_terminal_id &&
          other.driver_id == this.driver_id &&
          other.conductor_id == this.conductor_id);
}

class $viewTripsView extends ViewInfo<$viewTripsView, viewTrip>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
  $viewTripsView(this.attachedDatabase, [this._alias]);
  $tableTripsTable get trips => attachedDatabase.tableTrips.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [
    trip_id,
    vehicle_no,
    start_teminal_id,
    end_terminal_id,
    driver_id,
    conductor_id,
  ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'view_trips';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $viewTripsView get asDslTable => this;
  @override
  viewTrip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return viewTrip(
      trip_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}trip_id'],
          )!,
      vehicle_no:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}vehicle_no'],
          )!,
      start_teminal_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}start_teminal_id'],
          )!,
      end_terminal_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}end_terminal_id'],
          )!,
      driver_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}driver_id'],
          )!,
      conductor_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}conductor_id'],
          )!,
    );
  }

  late final GeneratedColumn<int> trip_id = GeneratedColumn<int>(
    'trip_id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(trips.trip_id, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> vehicle_no = GeneratedColumn<int>(
    'vehicle_no',
    aliasedName,
    false,
    generatedAs: GeneratedAs(trips.vehicle_no, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> start_teminal_id = GeneratedColumn<int>(
    'start_teminal_id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(trips.start_teminal_id, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> end_terminal_id = GeneratedColumn<int>(
    'end_terminal_id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(trips.end_terminal_id, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> driver_id = GeneratedColumn<int>(
    'driver_id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(trips.driver_id, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> conductor_id = GeneratedColumn<int>(
    'conductor_id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(trips.conductor_id, false),
    type: DriftSqlType.int,
  );
  @override
  $viewTripsView createAlias(String alias) {
    return $viewTripsView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(trips)..addColumns($columns));
  @override
  Set<String> get readTables => const {'table_trips'};
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $tableVehiclesTable tableVehicles = $tableVehiclesTable(this);
  late final $tableDriversTable tableDrivers = $tableDriversTable(this);
  late final $tableConductorsTable tableConductors = $tableConductorsTable(
    this,
  );
  late final $tableTerminalsTable tableTerminals = $tableTerminalsTable(this);
  late final $tableTripsTable tableTrips = $tableTripsTable(this);
  late final $viewVehiclesView viewVehicles = $viewVehiclesView(this);
  late final $viewDriversView viewDrivers = $viewDriversView(this);
  late final $viewConductorsView viewConductors = $viewConductorsView(this);
  late final $viewTerminalsView viewTerminals = $viewTerminalsView(this);
  late final $viewTripsView viewTrips = $viewTripsView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tableVehicles,
    tableDrivers,
    tableConductors,
    tableTerminals,
    tableTrips,
    viewVehicles,
    viewDrivers,
    viewConductors,
    viewTerminals,
    viewTrips,
  ];
}

typedef $$tableVehiclesTableCreateCompanionBuilder =
    tableVehiclesCompanion Function({
      Value<int> vehicle_no,
      required String plate_no,
      required int capacity,
      required String vehicle_type,
    });
typedef $$tableVehiclesTableUpdateCompanionBuilder =
    tableVehiclesCompanion Function({
      Value<int> vehicle_no,
      Value<String> plate_no,
      Value<int> capacity,
      Value<String> vehicle_type,
    });

class $$tableVehiclesTableFilterComposer
    extends Composer<_$Database, $tableVehiclesTable> {
  $$tableVehiclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get vehicle_no => $composableBuilder(
    column: $table.vehicle_no,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plate_no => $composableBuilder(
    column: $table.plate_no,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vehicle_type => $composableBuilder(
    column: $table.vehicle_type,
    builder: (column) => ColumnFilters(column),
  );
}

class $$tableVehiclesTableOrderingComposer
    extends Composer<_$Database, $tableVehiclesTable> {
  $$tableVehiclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get vehicle_no => $composableBuilder(
    column: $table.vehicle_no,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plate_no => $composableBuilder(
    column: $table.plate_no,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vehicle_type => $composableBuilder(
    column: $table.vehicle_type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$tableVehiclesTableAnnotationComposer
    extends Composer<_$Database, $tableVehiclesTable> {
  $$tableVehiclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get vehicle_no => $composableBuilder(
    column: $table.vehicle_no,
    builder: (column) => column,
  );

  GeneratedColumn<String> get plate_no =>
      $composableBuilder(column: $table.plate_no, builder: (column) => column);

  GeneratedColumn<int> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<String> get vehicle_type => $composableBuilder(
    column: $table.vehicle_type,
    builder: (column) => column,
  );
}

class $$tableVehiclesTableTableManager
    extends
        RootTableManager<
          _$Database,
          $tableVehiclesTable,
          tableVehicle,
          $$tableVehiclesTableFilterComposer,
          $$tableVehiclesTableOrderingComposer,
          $$tableVehiclesTableAnnotationComposer,
          $$tableVehiclesTableCreateCompanionBuilder,
          $$tableVehiclesTableUpdateCompanionBuilder,
          (
            tableVehicle,
            BaseReferences<_$Database, $tableVehiclesTable, tableVehicle>,
          ),
          tableVehicle,
          PrefetchHooks Function()
        > {
  $$tableVehiclesTableTableManager(_$Database db, $tableVehiclesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$tableVehiclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$tableVehiclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$tableVehiclesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> vehicle_no = const Value.absent(),
                Value<String> plate_no = const Value.absent(),
                Value<int> capacity = const Value.absent(),
                Value<String> vehicle_type = const Value.absent(),
              }) => tableVehiclesCompanion(
                vehicle_no: vehicle_no,
                plate_no: plate_no,
                capacity: capacity,
                vehicle_type: vehicle_type,
              ),
          createCompanionCallback:
              ({
                Value<int> vehicle_no = const Value.absent(),
                required String plate_no,
                required int capacity,
                required String vehicle_type,
              }) => tableVehiclesCompanion.insert(
                vehicle_no: vehicle_no,
                plate_no: plate_no,
                capacity: capacity,
                vehicle_type: vehicle_type,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$tableVehiclesTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $tableVehiclesTable,
      tableVehicle,
      $$tableVehiclesTableFilterComposer,
      $$tableVehiclesTableOrderingComposer,
      $$tableVehiclesTableAnnotationComposer,
      $$tableVehiclesTableCreateCompanionBuilder,
      $$tableVehiclesTableUpdateCompanionBuilder,
      (
        tableVehicle,
        BaseReferences<_$Database, $tableVehiclesTable, tableVehicle>,
      ),
      tableVehicle,
      PrefetchHooks Function()
    >;
typedef $$tableDriversTableCreateCompanionBuilder =
    tableDriversCompanion Function({
      Value<int> driver_no,
      required String first_name,
      required String last_name,
      required int age,
    });
typedef $$tableDriversTableUpdateCompanionBuilder =
    tableDriversCompanion Function({
      Value<int> driver_no,
      Value<String> first_name,
      Value<String> last_name,
      Value<int> age,
    });

class $$tableDriversTableFilterComposer
    extends Composer<_$Database, $tableDriversTable> {
  $$tableDriversTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get driver_no => $composableBuilder(
    column: $table.driver_no,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get first_name => $composableBuilder(
    column: $table.first_name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get last_name => $composableBuilder(
    column: $table.last_name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );
}

class $$tableDriversTableOrderingComposer
    extends Composer<_$Database, $tableDriversTable> {
  $$tableDriversTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get driver_no => $composableBuilder(
    column: $table.driver_no,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get first_name => $composableBuilder(
    column: $table.first_name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get last_name => $composableBuilder(
    column: $table.last_name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$tableDriversTableAnnotationComposer
    extends Composer<_$Database, $tableDriversTable> {
  $$tableDriversTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get driver_no =>
      $composableBuilder(column: $table.driver_no, builder: (column) => column);

  GeneratedColumn<String> get first_name => $composableBuilder(
    column: $table.first_name,
    builder: (column) => column,
  );

  GeneratedColumn<String> get last_name =>
      $composableBuilder(column: $table.last_name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);
}

class $$tableDriversTableTableManager
    extends
        RootTableManager<
          _$Database,
          $tableDriversTable,
          tableDriver,
          $$tableDriversTableFilterComposer,
          $$tableDriversTableOrderingComposer,
          $$tableDriversTableAnnotationComposer,
          $$tableDriversTableCreateCompanionBuilder,
          $$tableDriversTableUpdateCompanionBuilder,
          (
            tableDriver,
            BaseReferences<_$Database, $tableDriversTable, tableDriver>,
          ),
          tableDriver,
          PrefetchHooks Function()
        > {
  $$tableDriversTableTableManager(_$Database db, $tableDriversTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$tableDriversTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$tableDriversTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$tableDriversTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> driver_no = const Value.absent(),
                Value<String> first_name = const Value.absent(),
                Value<String> last_name = const Value.absent(),
                Value<int> age = const Value.absent(),
              }) => tableDriversCompanion(
                driver_no: driver_no,
                first_name: first_name,
                last_name: last_name,
                age: age,
              ),
          createCompanionCallback:
              ({
                Value<int> driver_no = const Value.absent(),
                required String first_name,
                required String last_name,
                required int age,
              }) => tableDriversCompanion.insert(
                driver_no: driver_no,
                first_name: first_name,
                last_name: last_name,
                age: age,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$tableDriversTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $tableDriversTable,
      tableDriver,
      $$tableDriversTableFilterComposer,
      $$tableDriversTableOrderingComposer,
      $$tableDriversTableAnnotationComposer,
      $$tableDriversTableCreateCompanionBuilder,
      $$tableDriversTableUpdateCompanionBuilder,
      (
        tableDriver,
        BaseReferences<_$Database, $tableDriversTable, tableDriver>,
      ),
      tableDriver,
      PrefetchHooks Function()
    >;
typedef $$tableConductorsTableCreateCompanionBuilder =
    tableConductorsCompanion Function({
      Value<int> conductor_no,
      required String first_name,
      required String last_name,
      required int age,
    });
typedef $$tableConductorsTableUpdateCompanionBuilder =
    tableConductorsCompanion Function({
      Value<int> conductor_no,
      Value<String> first_name,
      Value<String> last_name,
      Value<int> age,
    });

class $$tableConductorsTableFilterComposer
    extends Composer<_$Database, $tableConductorsTable> {
  $$tableConductorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get conductor_no => $composableBuilder(
    column: $table.conductor_no,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get first_name => $composableBuilder(
    column: $table.first_name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get last_name => $composableBuilder(
    column: $table.last_name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );
}

class $$tableConductorsTableOrderingComposer
    extends Composer<_$Database, $tableConductorsTable> {
  $$tableConductorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get conductor_no => $composableBuilder(
    column: $table.conductor_no,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get first_name => $composableBuilder(
    column: $table.first_name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get last_name => $composableBuilder(
    column: $table.last_name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$tableConductorsTableAnnotationComposer
    extends Composer<_$Database, $tableConductorsTable> {
  $$tableConductorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get conductor_no => $composableBuilder(
    column: $table.conductor_no,
    builder: (column) => column,
  );

  GeneratedColumn<String> get first_name => $composableBuilder(
    column: $table.first_name,
    builder: (column) => column,
  );

  GeneratedColumn<String> get last_name =>
      $composableBuilder(column: $table.last_name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);
}

class $$tableConductorsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $tableConductorsTable,
          tableConductor,
          $$tableConductorsTableFilterComposer,
          $$tableConductorsTableOrderingComposer,
          $$tableConductorsTableAnnotationComposer,
          $$tableConductorsTableCreateCompanionBuilder,
          $$tableConductorsTableUpdateCompanionBuilder,
          (
            tableConductor,
            BaseReferences<_$Database, $tableConductorsTable, tableConductor>,
          ),
          tableConductor,
          PrefetchHooks Function()
        > {
  $$tableConductorsTableTableManager(_$Database db, $tableConductorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$tableConductorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$tableConductorsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$tableConductorsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> conductor_no = const Value.absent(),
                Value<String> first_name = const Value.absent(),
                Value<String> last_name = const Value.absent(),
                Value<int> age = const Value.absent(),
              }) => tableConductorsCompanion(
                conductor_no: conductor_no,
                first_name: first_name,
                last_name: last_name,
                age: age,
              ),
          createCompanionCallback:
              ({
                Value<int> conductor_no = const Value.absent(),
                required String first_name,
                required String last_name,
                required int age,
              }) => tableConductorsCompanion.insert(
                conductor_no: conductor_no,
                first_name: first_name,
                last_name: last_name,
                age: age,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$tableConductorsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $tableConductorsTable,
      tableConductor,
      $$tableConductorsTableFilterComposer,
      $$tableConductorsTableOrderingComposer,
      $$tableConductorsTableAnnotationComposer,
      $$tableConductorsTableCreateCompanionBuilder,
      $$tableConductorsTableUpdateCompanionBuilder,
      (
        tableConductor,
        BaseReferences<_$Database, $tableConductorsTable, tableConductor>,
      ),
      tableConductor,
      PrefetchHooks Function()
    >;
typedef $$tableTerminalsTableCreateCompanionBuilder =
    tableTerminalsCompanion Function({
      Value<int> terminal_id,
      required String status,
      required int vehicle_no,
      required int available,
    });
typedef $$tableTerminalsTableUpdateCompanionBuilder =
    tableTerminalsCompanion Function({
      Value<int> terminal_id,
      Value<String> status,
      Value<int> vehicle_no,
      Value<int> available,
    });

class $$tableTerminalsTableFilterComposer
    extends Composer<_$Database, $tableTerminalsTable> {
  $$tableTerminalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get terminal_id => $composableBuilder(
    column: $table.terminal_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicle_no => $composableBuilder(
    column: $table.vehicle_no,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get available => $composableBuilder(
    column: $table.available,
    builder: (column) => ColumnFilters(column),
  );
}

class $$tableTerminalsTableOrderingComposer
    extends Composer<_$Database, $tableTerminalsTable> {
  $$tableTerminalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get terminal_id => $composableBuilder(
    column: $table.terminal_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicle_no => $composableBuilder(
    column: $table.vehicle_no,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get available => $composableBuilder(
    column: $table.available,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$tableTerminalsTableAnnotationComposer
    extends Composer<_$Database, $tableTerminalsTable> {
  $$tableTerminalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get terminal_id => $composableBuilder(
    column: $table.terminal_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get vehicle_no => $composableBuilder(
    column: $table.vehicle_no,
    builder: (column) => column,
  );

  GeneratedColumn<int> get available =>
      $composableBuilder(column: $table.available, builder: (column) => column);
}

class $$tableTerminalsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $tableTerminalsTable,
          tableTerminal,
          $$tableTerminalsTableFilterComposer,
          $$tableTerminalsTableOrderingComposer,
          $$tableTerminalsTableAnnotationComposer,
          $$tableTerminalsTableCreateCompanionBuilder,
          $$tableTerminalsTableUpdateCompanionBuilder,
          (
            tableTerminal,
            BaseReferences<_$Database, $tableTerminalsTable, tableTerminal>,
          ),
          tableTerminal,
          PrefetchHooks Function()
        > {
  $$tableTerminalsTableTableManager(_$Database db, $tableTerminalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$tableTerminalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$tableTerminalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$tableTerminalsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> terminal_id = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> vehicle_no = const Value.absent(),
                Value<int> available = const Value.absent(),
              }) => tableTerminalsCompanion(
                terminal_id: terminal_id,
                status: status,
                vehicle_no: vehicle_no,
                available: available,
              ),
          createCompanionCallback:
              ({
                Value<int> terminal_id = const Value.absent(),
                required String status,
                required int vehicle_no,
                required int available,
              }) => tableTerminalsCompanion.insert(
                terminal_id: terminal_id,
                status: status,
                vehicle_no: vehicle_no,
                available: available,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$tableTerminalsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $tableTerminalsTable,
      tableTerminal,
      $$tableTerminalsTableFilterComposer,
      $$tableTerminalsTableOrderingComposer,
      $$tableTerminalsTableAnnotationComposer,
      $$tableTerminalsTableCreateCompanionBuilder,
      $$tableTerminalsTableUpdateCompanionBuilder,
      (
        tableTerminal,
        BaseReferences<_$Database, $tableTerminalsTable, tableTerminal>,
      ),
      tableTerminal,
      PrefetchHooks Function()
    >;
typedef $$tableTripsTableCreateCompanionBuilder =
    tableTripsCompanion Function({
      Value<int> trip_id,
      required int vehicle_no,
      required int start_teminal_id,
      required int end_terminal_id,
      required int driver_id,
      required int conductor_id,
    });
typedef $$tableTripsTableUpdateCompanionBuilder =
    tableTripsCompanion Function({
      Value<int> trip_id,
      Value<int> vehicle_no,
      Value<int> start_teminal_id,
      Value<int> end_terminal_id,
      Value<int> driver_id,
      Value<int> conductor_id,
    });

class $$tableTripsTableFilterComposer
    extends Composer<_$Database, $tableTripsTable> {
  $$tableTripsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get trip_id => $composableBuilder(
    column: $table.trip_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicle_no => $composableBuilder(
    column: $table.vehicle_no,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get start_teminal_id => $composableBuilder(
    column: $table.start_teminal_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get end_terminal_id => $composableBuilder(
    column: $table.end_terminal_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get driver_id => $composableBuilder(
    column: $table.driver_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get conductor_id => $composableBuilder(
    column: $table.conductor_id,
    builder: (column) => ColumnFilters(column),
  );
}

class $$tableTripsTableOrderingComposer
    extends Composer<_$Database, $tableTripsTable> {
  $$tableTripsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get trip_id => $composableBuilder(
    column: $table.trip_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicle_no => $composableBuilder(
    column: $table.vehicle_no,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get start_teminal_id => $composableBuilder(
    column: $table.start_teminal_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get end_terminal_id => $composableBuilder(
    column: $table.end_terminal_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get driver_id => $composableBuilder(
    column: $table.driver_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get conductor_id => $composableBuilder(
    column: $table.conductor_id,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$tableTripsTableAnnotationComposer
    extends Composer<_$Database, $tableTripsTable> {
  $$tableTripsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get trip_id =>
      $composableBuilder(column: $table.trip_id, builder: (column) => column);

  GeneratedColumn<int> get vehicle_no => $composableBuilder(
    column: $table.vehicle_no,
    builder: (column) => column,
  );

  GeneratedColumn<int> get start_teminal_id => $composableBuilder(
    column: $table.start_teminal_id,
    builder: (column) => column,
  );

  GeneratedColumn<int> get end_terminal_id => $composableBuilder(
    column: $table.end_terminal_id,
    builder: (column) => column,
  );

  GeneratedColumn<int> get driver_id =>
      $composableBuilder(column: $table.driver_id, builder: (column) => column);

  GeneratedColumn<int> get conductor_id => $composableBuilder(
    column: $table.conductor_id,
    builder: (column) => column,
  );
}

class $$tableTripsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $tableTripsTable,
          tableTrip,
          $$tableTripsTableFilterComposer,
          $$tableTripsTableOrderingComposer,
          $$tableTripsTableAnnotationComposer,
          $$tableTripsTableCreateCompanionBuilder,
          $$tableTripsTableUpdateCompanionBuilder,
          (tableTrip, BaseReferences<_$Database, $tableTripsTable, tableTrip>),
          tableTrip,
          PrefetchHooks Function()
        > {
  $$tableTripsTableTableManager(_$Database db, $tableTripsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$tableTripsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$tableTripsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$tableTripsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> trip_id = const Value.absent(),
                Value<int> vehicle_no = const Value.absent(),
                Value<int> start_teminal_id = const Value.absent(),
                Value<int> end_terminal_id = const Value.absent(),
                Value<int> driver_id = const Value.absent(),
                Value<int> conductor_id = const Value.absent(),
              }) => tableTripsCompanion(
                trip_id: trip_id,
                vehicle_no: vehicle_no,
                start_teminal_id: start_teminal_id,
                end_terminal_id: end_terminal_id,
                driver_id: driver_id,
                conductor_id: conductor_id,
              ),
          createCompanionCallback:
              ({
                Value<int> trip_id = const Value.absent(),
                required int vehicle_no,
                required int start_teminal_id,
                required int end_terminal_id,
                required int driver_id,
                required int conductor_id,
              }) => tableTripsCompanion.insert(
                trip_id: trip_id,
                vehicle_no: vehicle_no,
                start_teminal_id: start_teminal_id,
                end_terminal_id: end_terminal_id,
                driver_id: driver_id,
                conductor_id: conductor_id,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$tableTripsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $tableTripsTable,
      tableTrip,
      $$tableTripsTableFilterComposer,
      $$tableTripsTableOrderingComposer,
      $$tableTripsTableAnnotationComposer,
      $$tableTripsTableCreateCompanionBuilder,
      $$tableTripsTableUpdateCompanionBuilder,
      (tableTrip, BaseReferences<_$Database, $tableTripsTable, tableTrip>),
      tableTrip,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$tableVehiclesTableTableManager get tableVehicles =>
      $$tableVehiclesTableTableManager(_db, _db.tableVehicles);
  $$tableDriversTableTableManager get tableDrivers =>
      $$tableDriversTableTableManager(_db, _db.tableDrivers);
  $$tableConductorsTableTableManager get tableConductors =>
      $$tableConductorsTableTableManager(_db, _db.tableConductors);
  $$tableTerminalsTableTableManager get tableTerminals =>
      $$tableTerminalsTableTableManager(_db, _db.tableTerminals);
  $$tableTripsTableTableManager get tableTrips =>
      $$tableTripsTableTableManager(_db, _db.tableTrips);
}
