// ignore_for_file: camel_case_types, non_constant_identifier_names, use_super_parameters
import 'package:drift/drift.dart';

//==// CREATE THE TABLES //==//
class tableVehicles extends Table {
  IntColumn get vehicle_no => integer().autoIncrement()();
  TextColumn get plate_no => text().withLength(min: 7, max: 7)();
  IntColumn get capacity => integer()();
  TextColumn get vehicle_type => text()();
}

class tableDrivers extends Table {
  IntColumn get driver_no => integer().autoIncrement()();
  TextColumn get first_name => text().withLength(max: 20)();
  TextColumn get last_name => text().withLength(max: 20)();
  IntColumn get age => integer()();
}

class tableConductors extends Table {
  IntColumn get conductor_no => integer().autoIncrement()();
  TextColumn get first_name => text().withLength(max: 20)();
  TextColumn get last_name => text().withLength(max: 20)();
  IntColumn get age => integer()();
}

class tableTerminals extends Table {
  IntColumn get terminal_id => integer().autoIncrement()();
  TextColumn get status => text()();
  IntColumn get vehicle_no => integer()();
  IntColumn get available => integer()();
}

class tableTrips extends Table {
  IntColumn get trip_id => integer().autoIncrement()();
  IntColumn get vehicle_no => integer()();
  IntColumn get start_teminal_id => integer()();
  IntColumn get end_terminal_id => integer()();
  IntColumn get driver_id => integer()();
  IntColumn get conductor_id => integer()();
}

//==// VIEWS? //==//
abstract class viewVehicles extends View {
  tableVehicles get vehicles;

  // like SELECT * FROM <TABLE>
  @override
  Query as() => select([
    vehicles.vehicle_no,
    vehicles.plate_no,
    vehicles.capacity,
    vehicles.vehicle_type,
  ]).from(vehicles);
}

abstract class viewDrivers extends View {
  tableDrivers get drivers;

  @override
  Query as() => select([
    drivers.driver_no,
    drivers.first_name,
    drivers.last_name,
    drivers.age,
  ]).from(drivers);
}

abstract class viewConductors extends View {
  tableConductors get conductors;

  @override
  Query as() => select([
    conductors.conductor_no,
    conductors.first_name,
    conductors.last_name,
    conductors.age,
  ]).from(conductors);
}

abstract class viewTerminals extends View {
  tableTerminals get terminals;

  @override
  Query as() => select([
    terminals.terminal_id,
    terminals.status,
    terminals.vehicle_no,
    terminals.available,
  ]).from(terminals);
}

abstract class viewTrips extends View {
  tableTrips get trips;

  @override
  Query as() => select([
    trips.trip_id,
    trips.vehicle_no,
    trips.start_teminal_id,
    trips.end_terminal_id,
    trips.driver_id,
    trips.conductor_id,
  ]).from(trips);
}
