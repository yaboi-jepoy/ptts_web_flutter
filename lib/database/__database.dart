// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//* object classes

// vehicles
class Vehicle {
  int? vehicle_no;
  final String plate_no;
  final int capacity;
  final String vehicle_type;

  Vehicle({
    required this.plate_no,
    required this.capacity,
    required this.vehicle_type,
  });

  // convert to a map
  // keys = column
  Map<String, Object?> toMap() {
    return {
      'vehicle_no': vehicle_no,
      'plate_no': plate_no,
      'capacity': capacity,
      'vehicle_type': vehicle_type,
    };
  }

  // use toString to print easier
  @override
  String toString() {
    return 'Vehicle{vehicle_no: $vehicle_no, plate_no: $plate_no, capacity: $capacity, vehicle_type: $vehicle_type}';
  }
}

late final Database database;

// * database operations
Future<void> initDatabase() async {
  database = await openDatabase(
    // set path to database
    join(await getDatabasesPath(), 'ptts_database.db'),

    // create table when database is first created
    onCreate: (db, version) => {
      // create table like SQL query
      // vehicles
      db.execute(
        'CREATE TABLE vehicles(vehicle_no INTEGER PRIMARY KEY, plate_no TEXT NOT NULL, capacity INT, vehicle_type TEXT)',
      ),
      // drivers
      db.execute(
        'CREATE TABLE drivers(driver_no INTEGER PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULL, age TEXT)',
      ),
      // conductors
      db.execute(
        'CREATE TABLE conductors(conductor_no INTEGER PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULL, age TEXT)',
      ),

      // TODO - these two tables will be updated later
      // terminal
      db.execute(
        'CREATE TABLE terminals(terminal_id INT PRIMARY KEY, status TEXT NOT NULL, vehicle_no INTEGER, available INTEGER)',
      ),
      // terminals
      db.execute(
        'CREATE TABLE trips(trip_no INTEGER PRIMARY KEY, vehicle_no INTEGER, start_terminal_id INTEGER, end_terminal_id INTEGER, driver_no INTEGER, conductor_no INTEGER)',
      ),
    },
    version: 1,
  );

  // * database functions
}

Future<void> addDummy(Vehicle vehicle) async {
  // reference the database
  final db = await database;

  // insert dummy data to vehicles table
  await db.insert(
    'vehicles',
    vehicle.toMap(),
    conflictAlgorithm: ConflictAlgorithm.fail,
  );
}
