import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "TravelData.db";
  static final _databaseVersion = 4; // Incremented version for schema changes

  // Table Name
  static final tableTravelCostDetails = 'travel_cost_2';

  // Column Names for TravelCostDetails Table
  static final userName = 'username';
  static final columnTravelId = 'id';
  static final columnDestinationName = 'destination_name';
  static final columnTotalPrice = 'total_price';
  static final columnDate = 'date';
  static final columnTravelType = 'travel_type';
  static final columnTravelCompanyName = 'travel_company_name';
  static final columnTravelPrice = 'travel_price';
  static final columnLodgeName = 'lodge_name';
  static final columnLodgePrice = 'lodge_price';

  // Singleton pattern
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future<void> deleteDatabaseFile() async {
    String path = join(await getDatabasesPath(), _databaseName);
    await deleteDatabase(path);
  }

  // Create Tables
Future _onCreate(Database db, int version) async {
  await db.execute(''' 
    CREATE TABLE $tableTravelCostDetails (
      $columnTravelId INTEGER PRIMARY KEY,
      $userName TEXT NOT NULL,
      $columnDestinationName TEXT NOT NULL,
      $columnTotalPrice REAL NOT NULL,
      `$columnDate` TEXT NOT NULL, // Add this comma
      $columnTravelType TEXT NOT NULL,
      $columnTravelCompanyName TEXT NOT NULL,
      $columnTravelPrice REAL NOT NULL,
      $columnLodgeName TEXT NOT NULL,
      $columnLodgePrice REAL NOT NULL
    )
  ''');
}

  // Database upgrade logic (if version is increased)
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 4) {
      // Drop old table and recreate it (Be cautious about data loss if you use this approach)
      await db.execute('DROP TABLE IF EXISTS $tableTravelCostDetails');
      await _onCreate(db, newVersion); // Recreate the table
    }
  }

  // Insert TravelCostDetails
  Future<int> insertTravelCostDetails(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableTravelCostDetails, row);
  }

  // Query all TravelCostDetails
  Future<List<Map<String, dynamic>>> queryAllTravelCostDetails() async {
    Database db = await instance.database;
    return await db.query(tableTravelCostDetails);
  }
}
