// ignore_for_file: non_constant_identifier_names

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();
  static Database? _db;

  // naming variables
  final String _vehiclesTableName = 'vehicles';
  final String _driversTableName = 'drivers';
  final String _conductorsTableName = 'conductors';
  final String _terminalsTableName = 'terminals';
  final String _tripsTableName = 'trips';

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  // function to setup database
  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'ptts.db');

    // open the database
    final database = await openDatabase(
      databasePath,
      version: 1,
      onConfigure: (db) async {
        await db.execute(
          'PRAGMA foreign_keys = ON',
        ); // turn on your foreign keys for god's sake
      },
      onCreate: (db, version) {
        // create table like SQL query
        // terminal
        db.execute(
          'CREATE TABLE $_terminalsTableName(terminal_id INTEGER PRIMARY KEY, terminal_name TEXT NOT NULL)',
        );
        // vehicles
        db.execute('''CREATE TABLE $_vehiclesTableName(
          vehicle_no INTEGER PRIMARY KEY, 
          plate_no TEXT NOT NULL, 
          capacity INT, 
          vehicle_type TEXT, 
          terminal_id INTEGER UNIQUE, 
          FOREIGN KEY (terminal_id) REFERENCES $_terminalsTableName (terminal_id)
          )''');
        // drivers
        db.execute('''CREATE TABLE $_driversTableName(
          driver_no INTEGER PRIMARY KEY, 
          first_name TEXT NOT NULL, 
          last_name TEXT NOT NULL, 
          age INTEGER
          )''');
        // conductors
        db.execute('''CREATE TABLE $_conductorsTableName(
          conductor_no INTEGER PRIMARY KEY, 
          first_name TEXT NOT NULL, 
          last_name TEXT NOT NULL, 
          age INTEGER)''');

        ///// TODO - these two tables will be updated later

        // trips
        db.execute('''CREATE TABLE $_tripsTableName(
          trip_no INTEGER PRIMARY KEY, 
          vehicle_no INTEGER, 
          start_terminal_id INTEGER, 
          end_terminal_id INTEGER, 
          driver_no INTEGER, 
          conductor_no INTEGER,
          status TEXT,
          available INTEGER,

          FOREIGN KEY (vehicle_no) REFERENCES $_vehiclesTableName (vehicle_no),
          FOREIGN KEY (start_terminal_id) REFERENCES $_terminalsTableName (terminal_id),
          FOREIGN KEY (end_terminal_id) REFERENCES $_terminalsTableName (terminal_id),
          FOREIGN KEY (driver_no) REFERENCES $_driversTableName (driver_no),
          FOREIGN KEY (conductor_no) REFERENCES $_conductorsTableName (conductor_no),
          )''');
      },
    );
    return database;
  }

  //* DATABASE FUNCTIONS

  void addTerminal(String? terminal_name) async {
    final db = await database;
    await db.insert(_terminalsTableName, {'terminal_name': terminal_name});
  }

  void addVehicle(
    String plate,
    int capacity,
    String type,
    int terminal_id,
  ) async {
    final db = await database;
    await db.insert(_vehiclesTableName, {
      'plate_no': plate,
      'capacity': capacity,
      'vehicle_type': type,
      'terminal_id': terminal_id,
    });
  }

  void addDriver(String? first_name, String? last_name, int? age) async {
    final db = await database;
    await db.insert(_driversTableName, {
      'first_name': first_name,
      'last_name': last_name,
      'age': age,
    });
  }

  void addConductor(String? first_name, String? last_name, int? age) async {
    final db = await database;
    await db.insert(_conductorsTableName, {
      'first_name': first_name,
      'last_name': last_name,
      'age': age,
    });
  }

  void generateTrip(
    int vehicle_no,
    String start_terminal,
    String end_terminal,
    int driver_no,
    int conductor_no,
    String status,
    int available,
  ) async {
    final db = await database;
    await db.insert(_tripsTableName, {
      'vehicle_no': vehicle_no,
      'start_terminal_id': start_terminal,
      'end_terminal_id': end_terminal,
      'driver_no': driver_no,
      'conductor_no': conductor_no,
      'status': status,
      'available': available,
    });
  }

  Future<List<List<String>>> getVehicles() async {
    final db = await database;
    final rawData = await db.query(_vehiclesTableName);

    // convert to DbTables usable format
    // Future<List<List<String>>>

    return rawData.map((row) {
      return [
        row['vehicle_no'].toString(),
        row['plate_no'].toString(),
        row['capacity'].toString(),
        row['vehicle_type'].toString(),
        row['terminal_id'].toString(),
      ];
    }).toList();
  }

  Future<List<List<String>>> getTerminals() async {
    final db = await database;
    final rawData = await db.query(_terminalsTableName);

    return rawData.map((row) {
      return [row['terminal_id'].toString(), row['terminal_name'].toString()];
    }).toList();
  }

  Future<List<List<String>>> getDrivers() async {
    final db = await database;
    final rawData = await db.query(_driversTableName);

    // convert to DbTables usable format
    // Future<List<List<String>>>

    return rawData.map((row) {
      return [
        row['driver_no'].toString(),
        row['first_name'].toString(),
        row['last_name'].toString(),
        row['age'].toString(),
      ];
    }).toList();
  }

  Future<List<List<String>>> getConductors() async {
    final db = await database;
    final rawData = await db.query(_conductorsTableName);

    // convert to DbTables usable format
    // Future<List<List<String>>>

    return rawData.map((row) {
      return [
        row['conductor_no'].toString(),
        row['first_name'].toString(),
        row['last_name'].toString(),
        row['age'].toString(),
      ];
    }).toList();
  }

  //

  Future<void> printDbPath() async {
    final dbPath = await getDatabasesPath();
    print(dbPath);
  }

  Future<List<Map<String, dynamic>>> getRawData() async {
    final db = await database;
    return await db.rawQuery('SELECT vehicle_no, plate_no FROM vehicles');
  }
}
