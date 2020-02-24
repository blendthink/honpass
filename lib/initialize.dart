import 'package:honpass/db/database.dart';

class Initialize {

  init() {
    _initDatabase();
  }

  _initDatabase() async {

    HonpassDatabase db = HonpassDatabase();

    if (await db.exists()) {
      return;
    }

    db.setup();
  }
}