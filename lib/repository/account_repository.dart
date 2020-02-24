import 'package:honpass/db/database.dart';
import 'package:honpass/db/entity/account.dart';

class AccountRepository {

  final HonpassDatabase _db;

  AccountRepository(this._db);

  Future<List<Account>> accounts() async {

    List<Map<String, dynamic>> maps = await _db.records(Account.TABLE_NAME);

    return List.generate(maps.length, (i) {
      return Account.fromJson(maps[i]);
    });
  }

  Future<int> insertAccount(Account account) async {
    return await _db.upsert(account);
  }
}