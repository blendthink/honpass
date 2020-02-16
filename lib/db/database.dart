import 'dart:async';

import 'package:honpass/db/account.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HonPassDatabase {

  Database _instance;

  static const _DATABASE_NAME = 'honpass.db';

  static const _TABLE_NAME_ACCOUNTS = 'accounts';

  Future<void> insertAccount(Account account) async {

    final db = await _db;

    await db.insert(
        _TABLE_NAME_ACCOUNTS,
        account.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Account>> accounts() async {

    final db = await _db;

    final List<Map<String, dynamic>> maps = await db.query(_TABLE_NAME_ACCOUNTS);

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
        """
          CREATE TABLE $_TABLE_NAME_ACCOUNTS(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            password TEXT          
          )
        """
    );
  }
}