import 'dart:async';

import 'package:honpass/db/entities/account.dart';
import 'package:honpass/db/entities/service.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HonPassDatabase {

  Database _instance;

  static const _DATABASE_NAME = 'honpass.db';

  Future<int> insertService(Service service) async {

    final db = await _db;

    return await db.insert(
        Service.TABLE_NAME,
        service.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<Service> service(int serviceId) async {

    final db = await _db;

    final List<Map<String, dynamic>> maps = await db.query(
        Service.TABLE_NAME,
        where: '${Service.COLUMN_ID} = ?',
        whereArgs: [serviceId]
    );

    if (maps.isEmpty) {
      return null;
    }

    return Service.fromJson(maps.first);
  }

  Future<List<Service>> services() async {

    final db = await _db;

    final List<Map<String, dynamic>> maps = await db.query(Service.TABLE_NAME,);

    return List.generate(maps.length, (i) {
      return Service.fromJson(maps[i]);
    });
  }

  Future<int> insertAccount(Account account) async {

    final db = await _db;

    return await db.insert(
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