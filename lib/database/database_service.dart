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

    print('Database path: $databasePath');

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
        db.execute('PRAGMA foreign_keys = ON');
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
          status TEXT,
          terminal_id INTEGER, 
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

        // trips
        db.execute('''CREATE TABLE $_tripsTableName(
          trip_no INTEGER PRIMARY KEY, 
          vehicle_no INTEGER, 
          start_terminal_id INTEGER, 
          end_terminal_id INTEGER, 
          driver_no INTEGER, 
          conductor_no INTEGER,
          available INTEGER,

          FOREIGN KEY (vehicle_no) REFERENCES $_vehiclesTableName (vehicle_no),
          FOREIGN KEY (start_terminal_id) REFERENCES $_terminalsTableName (terminal_id),
          FOREIGN KEY (end_terminal_id) REFERENCES $_terminalsTableName (terminal_id),
          FOREIGN KEY (driver_no) REFERENCES $_driversTableName (driver_no),
          FOREIGN KEY (conductor_no) REFERENCES $_conductorsTableName (conductor_no)
        )''');

        ///// TODO - these two tables will be updated later
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

  Future<void> generateTrip(
    int vehicle_no,
    int start_terminal,
    int end_terminal,
    int driver_no,
    int conductor_no,
    String status,
    int available,
  ) async {
    final db = await database;

    // verify all foreign keys exist
    final checks = {
      'vehicle_no': await db.query(
        'vehicles',
        where: 'vehicle_no = ?',
        whereArgs: [vehicle_no],
      ),
      'start_terminal': await db.query(
        'terminals',
        where: 'terminal_id = ?',
        whereArgs: [start_terminal],
      ),
      'end_terminal': await db.query(
        'terminals',
        where: 'terminal_id = ?',
        whereArgs: [end_terminal],
      ),
      'driver_no': await db.query(
        'drivers',
        where: 'driver_no = ?',
        whereArgs: [driver_no],
      ),
      'conductor_no': await db.query(
        'conductors',
        where: 'conductor_no = ?',
        whereArgs: [conductor_no],
      ),
    };

    checks.forEach((key, result) {
      if (result.isEmpty) {
        throw Exception(
          'Foreign key violation: $key ${key == 'vehicle_no'
              ? vehicle_no
              : key == 'start_terminal'
              ? start_terminal
              : key == 'end_terminal'
              ? end_terminal
              : key == 'driver_no'
              ? driver_no
              : conductor_no} not found',
        );
      }
    });

    await db.insert(_tripsTableName, {
      'vehicle_no': vehicle_no,
      'start_terminal_id': start_terminal,
      'end_terminal_id': end_terminal,
      'driver_no': driver_no,
      'conductor_no': conductor_no,
      // 'status': status,
      'available': available,
    });
  }

  // add the delete functions as requested
  void deleteVehicle(int id) async {
    final db = await database;

    // delete related trips first
    await db.execute('''
          DELETE FROM $_tripsTableName WHERE vehicle_no = $id
''');

    // only then delete the vehicle
    await db.execute('''
          DELETE FROM $_vehiclesTableName WHERE vehicle_no = $id
    ''');
  }

  void deleteDriver(int id) async {
    final db = await database;
    // delete related trips first
    await db.execute('''
          DELETE FROM $_tripsTableName WHERE driver_no = $id
''');

    // only then delete the driver
    await db.execute('''
          DELETE FROM $_driversTableName WHERE driver_no = $id
    ''');
  }

  void deleteConductor(int id) async {
    final db = await database;
    // delete related trips first
    await db.execute('''
          DELETE FROM $_tripsTableName WHERE conductor_no = $id
''');

    // only then delete the conductor
    await db.execute('''
          DELETE FROM $_conductorsTableName WHERE conductor_no = $id
    ''');
  }

  Future<void> deleteTerminal(int id) async {
    final db = await database;

    // First enable foreign keys
    await db.execute('PRAGMA foreign_keys = ON');

    // Then delete with parameter
    await db.delete(
      _terminalsTableName,
      where: 'terminal_id = ?',
      whereArgs: [id],
    );
  }

  void deleteTrip(int id) async {
    final db = await database;
    await db.execute('''
          DELETE FROM $_tripsTableName WHERE trip_no = $id
    ''');
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

  Future<List<List<String>>> showTrips(int terminalId) async {
    final db = await database;

    final result = await db.rawQuery(
      '''
    SELECT 
      trips.trip_no,
      trips.vehicle_no,
      start_terminal.terminal_name AS start_terminal_name,
      end_terminal.terminal_name AS end_terminal_name,
      drivers.first_name || ' ' || drivers.last_name AS driver_name,
      conductors.first_name || ' ' || conductors.last_name AS conductor_name
    FROM trips
    JOIN terminals AS start_terminal ON trips.start_terminal_id = start_terminal.terminal_id
    JOIN terminals AS end_terminal ON trips.end_terminal_id = end_terminal.terminal_id
    JOIN drivers ON trips.driver_no = drivers.driver_no
    JOIN conductors ON trips.conductor_no = conductors.conductor_no
    WHERE trips.start_terminal_id = ?
  ''',
      [terminalId],
    );

    return result.map((row) {
      return [
        row['trip_no'].toString(),
        row['vehicle_no'].toString(),
        row['start_terminal_name'].toString(),
        row['end_terminal_name'].toString(),
        row['driver_name'].toString(),
        row['conductor_name'].toString(),
      ];
    }).toList();
  }

  //! deprecated functions
  //! for debug only

  Future<void> printDbPath() async {
    final dbPath = await getDatabasesPath();
    print(dbPath);
  }

  Future<List<Map<String, dynamic>>> getRawData() async {
    final db = await database;
    return await db.rawQuery('SELECT vehicle_no, plate_no FROM vehicles');
  }

  //! WHY WON'T IT WORK
  Future<void> testDatabaseOperations() async {
    try {
      final db = await database;

      // Test simple insert
      final testInsert = await db.insert('trips', {
        'vehicle_no': 1,
        'start_terminal_id': 1,
        'end_terminal_id': 2,
        'driver_no': 1,
        'conductor_no': 1,
        'status': 'Test',
        'available': 1,
      });
      print('Test insert ID: $testInsert');

      // Test query
      final trips = await db.query('trips');
      print('Trips in database: ${trips.length}');
      for (var trip in trips) {
        print(trip);
      }
    } catch (e) {
      print('Database test failed: $e');
    }
  }
}
