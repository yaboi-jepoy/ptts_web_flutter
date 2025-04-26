// ignore_for_file: non_constant_identifier_names

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  // make sure only single instance exists
  static final DatabaseService instance = DatabaseService._constructor();

  final String _vehiclesTableName = "vehicles";
  final String _driversTableName = "drivers";
  final String _conductorsTableName = "conductors";
  final String _tripsTableName = "trips";
  final String _terminalsTableName = "terminals";

  DatabaseService._constructor();

  // check if database is not null
  //  assign database otherwise
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  // create a function
  // to setup the database
  Future<Database> getDatabase() async {
    // place where database exists
    final databaseDirPath = await getDatabasesPath();
    // append database path and database name
    final databasePath = join(databaseDirPath, "ptts_db.db");
    // use sqflite to open database
    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        // create vehicles table
        db.execute('''
        CREATE TABLE $_vehiclesTableName (
          vehicle_no int primary key,
          plate_no text not null,
          capacity int
        )
        ''');
        // create drivers table
        db.execute('''
        CREATE TABLE $_driversTableName (
          driver_no int primary key,
          first_name text not null,
          last_name text not null,
          age int
        )
        ''');
        // create conductors table
        db.execute('''
        CREATE TABLE $_driversTableName (
          conductor_no int primary key,
          first_name text not null,
          last_name text not null,
          age int
        )
        ''');
        // create terminals table
        db.execute('''
        CREATE TABLE $_terminalsTableName (
          terminal_id int primary key,
          vehicle_no int,
          available int,
          status text,
        )
        ''');
        // create trip table
        db.execute('''
        CREATE TABLE $_tripsTableName (
          trip_no int primary key,
          vehicle_no int,
          start_terminal_id int,
          end_terminal_id int,
          driver_no int,
          conductor_no int,
          FOREIGN KEY (vehicle_no) REFERENCES $_vehiclesTableName(vehicle_no),
          FOREIGN KEY (start_terminal_id) REFERENCES $_terminalsTableName(terminal_id),
          FOREIGN KEY (end_terminal_id) REFERENCES $_terminalsTableName(terminal_id),
          FOREIGN KEY (driver_no) REFERENCES $_driversTableName(driver_no),
          FOREIGN KEY (conductor_no) REFERENCES $_conductorsTableName(conductor_no)
        )
        ''');
      },
    );
    return database;
  }

  //=// CRUD OPERATIONS //=//

  // admin task to add vehicle
  void addVehicle(String plate_no, int capacity) async {
    final db = await database;
    await db.insert("vehicles", {"plate_no": plate_no, "capacity": capacity});
  }

  // add drivers
  void addDriver(String first_name, String last_name, int age) async {
    final db = await database;
    await db.insert("drivers", {
      "first_name": first_name,
      "last_name": last_name,
      "age": age,
    });
  }

  // add conductors
  void addConductor(String first_name, String last_name, int age) async {
    final db = await database;
    await db.insert("conductors", {
      "first_name": first_name,
      "last_name": last_name,
      "age": age,
    });
  }

  // add trips
  void addTerminal(String vehicle_no, int available, String status) async {
    final db = await database;
    await db.insert("terminals", {
      "vehicle_no": vehicle_no,
      "available": available,
      "status": status,
    });
  }

  //! PLEASE ADD addTrips too
}
