import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Future<Database> initialize() async {
    final Future<Database> database = openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'aceup_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        // db.execute(
        //   "CREATE TABLE IF NOT EXISTS subscriptions(id INTEGER NOT NULL PRIMARY KEY, pin_id INTEGER NOT NULL,course_id  INTEGER NOT NULL, user_id  INTEGER  NOT NULL, updated_at TEXT NOT NULL,created_at TEXT NOT NULL);",
        // );

        // db.execute("""
        //   CREATE TABLE IF NOT EXISTS courses(
        //     id             INTEGER  NOT NULL PRIMARY KEY
        //     ,title          TEXT NOT NULL
        //     ,description    TEXT NOT NULL
        //     ,featured_image TEXT NOT NULL
        //     ,color_scheme   TEXT NOT NULL
        //     ,created_at     TEXT NOT NULL
        //     ,updated_at     TEXT NOT NULL);
        //   """);

        // db.execute("""
        //   CREATE TABLE IF NOT EXISTS users(
        //     id                INTEGER  NOT NULL PRIMARY KEY
        //     ,email             TEXT NOT NULL
        //     ,first_name        TEXT
        //     ,last_name         TEXT
        //     ,department_id     INTEGER
        //     ,gender            TEXT
        //     ,username          TEXT
        //     ,created_at        TEXT NOT NULL
        //     ,updated_at        TEXT NOT NULL
        //     ,avatar_id         INTEGER
        //     ,role              TEXT NOT NULL
        //   );
        //   """);

        // db.execute("""
        //   CREATE TABLE IF NOT EXISTS course_profiles(
        //     id  INTEGER NOT NULL PRIMARY KEY
        //     ,user_id  INTEGER NOT NULL
        //     ,points INTEGER NOT NULL
        //     ,course_id  INTEGER NOT NULL
        //   );
        //   """);

        // db.execute("""
        // CREATE TABLE IF NOT EXISTS topics(
        //   id    INTEGER NOT NULL PRIMARY KEY
        //   ,course_id  INTEGER NOT NULL
        //   ,"index"  INTEGER NOT NULL
        //   ,title  TEXT NOT NULL
        //   ,introduction TEXT
        //   ,completed INTEGER DEFAULT 0
        // );
        // """);

        // db.execute("""
        //   CREATE TABLE IF NOT EXISTS questions(
        //     id    INTEGER NOT NULL PRIMARY KEY
        //     ,topic_id   INTEGER NOT NULL
        //     ,body   TEXT  NOT NULL
        //     ,options BLOB
        //     ,difficulty   TEXT NOT NULL
        //     ,explanation    TEXT
        //   );
        // """);

        // db.execute("""
        //   CREATE TABLE IF NOT EXISTS slides(
        //     id    INTEGER NOT NULL PRIMARY KEY
        //     ,topic_id   INTEGER NOT NULL
        //     ,"index"    INTEGER NOT NULL
        //     ,body   TEXT NOT NULL
        //     ,options BLOB
        //     ,is_question   INTEGER  DEFAULT 0
        //     ,explanation    TEXT
        //   );
        // """);

        // db.execute("""
        //   CREATE TABLE IF NOT EXISTS quizzes(
        //     id TEXT NOT NULL PRIMARY KEY
        //     ,type TEXT NOT NULL
        //     ,topic_id INTEGER
        //     ,course_id INTEGER
        //     ,questions_map BLOB
        //     ,submitted INTEGER DEFAULT 0
        //   );
        // """);

        // /// opponent_profile looks like {username: ___, avatar: ____}
        // /// questions_map lools like: {question_id, challenger_attempt, opponent_attempt}
        // db.execute("""
        //   CREATE TABLE IF NOT EXISTS challenges(
        //     id INTEGER NOT NULL PRIMARY KEY
        //     ,course_id INTEGER NOT NULL
        //     ,challenger_id INTEGER NOT NULL
        //     ,questions BLOB
        //     ,opponent_id  INTEGER NOT NULL
        //     ,opponent BLOB
        //     ,challenger BLOB
        //     ,userIsChallenger INTEGER DEFAULT 0
        //     ,scores BLOB
        //   );
        // """);
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    return database;
  }
}
