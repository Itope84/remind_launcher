import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Future<Database> initialize() async {
    final Future<Database> database = openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'remind_launcher_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        db.execute("""
          CREATE TABLE IF NOT EXISTS tasks(
            id             TEXT  NOT NULL PRIMARY KEY
            ,title         TEXT NOT NULL
            ,body          TEXT NOT NULL
            ,type          TEXT NOT NULL
            ,done          INTEGER NOT NULL
            ,created_at     TEXT NOT NULL
          );
          """);
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    return database;
  }
}
