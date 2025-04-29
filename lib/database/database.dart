// ignore_for_file: camel_case_types, non_constant_identifier_names, use_super_parameters

import 'package:drift/drift.dart';
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    tableVehicles,
    tableDrivers,
    tableConductors,
    tableTerminals,
    tableTrips,
  ],
  views: [viewVehicles, viewDrivers, viewConductors, viewTerminals, viewTrips],
)
// create database class
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
