import 'dart:async';

import 'package:honpass/db/entity/account.dart';
import 'package:honpass/db/entity/service.dart';
import 'package:honpass/db/honpass_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HonpassDatabase {

  Database _instance;

  static const _DATABASE_NAME = 'honpass.db';

  Future<int> upsert<T extends HonpassEntity>(T entity) async {

    final db = await _db;

    return await db.insert(
      entity.tableName(),
      entity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Map<String, dynamic>>> records(String tableName) async {

    final db = await _db;

    return await db.query(tableName);
  }

  Future<Map<String, dynamic>> record(
      String tableName,
      String where,
      List<dynamic> whereArgs) async {

    final db = await _db;

    final List<Map<String, dynamic>> maps =  await db.query(
        tableName,
        where: where,
        whereArgs: whereArgs
    );

    if (maps.isEmpty) return null;

    return maps.first;
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

  Future<bool> exists() async {

    String path = await getDatabasesPath();

    return databaseExists(path);
  }

  Future<void> setup() async {

    final db = await _db;

    final batch = db.batch();

    final services = [
      {
        Service.COLUMN_NAME: 'Apple',
        Service.COLUMN_URL: 'apple.com'
      },
      {
        Service.COLUMN_NAME: 'Google',
        Service.COLUMN_URL: 'google.com'
      },
      {
        Service.COLUMN_NAME: 'Twitter',
        Service.COLUMN_URL: 'twitter.com'
      },
      {
        Service.COLUMN_NAME: 'Facebook',
        Service.COLUMN_URL: 'facebook.com'
      },
      {
        Service.COLUMN_NAME: 'Amazon',
        Service.COLUMN_URL: 'amazon.com'
      },
    ];

    services.forEach((Map<String, String> service) {
      batch.insert('${Service.TABLE_NAME}', service);
    });

    final account = {
      Account.COLUMN_SERVICE_ID: 1,
      Account.COLUMN_NAME: 'honwaka.developer@gmail.com',
      Account.COLUMN_PASSWORD: 'password'
    };

    batch.insert(Account.TABLE_NAME, account);

    batch.commit(noResult: true);
  }

  _createDatabase(Database db, int version) async {
    await db.execute(
        '''
          CREATE TABLE ${Service.TABLE_NAME}(
            ${Service.COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${Service.COLUMN_NAME} TEXT NOT NULL,
            ${Service.COLUMN_URL} TEXT NOT NULL,
            ${Service.COLUMN_ICON_PATH} TEXT
          )
        '''
    );

    return await db.execute(
        '''
          CREATE TABLE ${Account.TABLE_NAME}(
            ${Account.COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${Account.COLUMN_SERVICE_ID} INTEGER,
            ${Account.COLUMN_NAME} TEXT NOT NULL,
            ${Account.COLUMN_PASSWORD} TEXT NOT NULL,
            FOREIGN KEY (${Account.COLUMN_SERVICE_ID}) REFERENCES ${Service.TABLE_NAME} (${Service.COLUMN_ID})     
          )
        '''
    );
  }
}