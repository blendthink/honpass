import 'dart:async';

import 'package:honpass/db/account.dart';
import 'package:honpass/db/service.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HonPassDatabase {

  Database _instance;

  static const _DATABASE_NAME = 'honpass.db';

  Future<void> insertAccount(Account account) async {

    final db = await _db;

    await db.insert(
        Account.TABLE_NAME,
        account.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Account>> accounts() async {

    final db = await _db;

    final List<Map<String, dynamic>> maps = await db.query(Account.TABLE_NAME);

    return List.generate(maps.length, (i) {
      return Account.fromJson(maps[i]);
    });
  }

  Future<Database> get _db async {

    if (_instance == null) {
      _instance = await openDatabase(
        join(
          await getDatabasesPath(),
          _DATABASE_NAME,
        ),
        onCreate: (db, version) {
          return _createDatabase(db, version);
        },
        version: 1
      );
    }

    return _instance;
  }

  _createDatabase(Database db, int version) {
    return db.execute(
        '''
          CREATE TABLE ${Service.TABLE_NAME}(
            ${Service.COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${Service.COLUMN_NAME} TEXT NOT NULL,
            ${Service.COLUMN_URL} TEXT NOT NULL,
            ${Service.COLUMN_ICON_PATH} TEXT
          );
          
          CREATE TABLE ${Account.TABLE_NAME}(
            ${Account.COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${Account.COLUMN_SERVICE_ID} INTEGER,
            ${Account.COLUMN_NAME} TEXT NOT NULL,
            ${Account.COLUMN_PASSWORD} TEXT NOT NULL,
            FOREIGN KEY (${Account.COLUMN_SERVICE_ID}) REFERENCES ${Service.TABLE_NAME} (${Service.COLUMN_ID})     
          );
        '''
    );
  }
}