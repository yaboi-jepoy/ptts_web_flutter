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
      onCreate: (db, version) {
        // create table like SQL query
        // vehicles
        db.execute(
          'CREATE TABLE $_vehiclesTableName(vehicle_no INTEGER PRIMARY KEY, plate_no TEXT NOT NULL, capacity INT, vehicle_type TEXT)',
        );
        // drivers
        db.execute(
          'CREATE TABLE $_driversTableName(driver_no INTEGER PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULL, age TEXT)',
        );
        // conductors
        db.execute(
          'CREATE TABLE $_conductorsTableName(conductor_no INTEGER PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULL, age TEXT)',
        );

        // TODO - these two tables will be updated later
        // terminal
        db.execute(
          'CREATE TABLE $_terminalsTableName(terminal_id INT PRIMARY KEY, status TEXT NOT NULL, vehicle_no INTEGER, available INTEGER)',
        );
        // terminals
        db.execute(
          'CREATE TABLE $_tripsTableName(trip_no INTEGER PRIMARY KEY, vehicle_no INTEGER, start_terminal_id INTEGER, end_terminal_id INTEGER, driver_no INTEGER, conductor_no INTEGER)',
        );
      },
    );
    return database;
  }

  void addVehicle(String plate, int capacity, String type) async {
    final db = await database;
    await db.insert(_vehiclesTableName, {
      'plate_no': plate,
      'capacity': capacity,
      'vehicle_type': type,
    });
  }

  Future<List?> getVehicles() async {
    final db = await database;
    final data = await db.query(_vehiclesTableName);
    print(data);
  }
}
