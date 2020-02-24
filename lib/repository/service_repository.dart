import 'package:honpass/db/database.dart';
import 'package:honpass/db/entity/service.dart';

class ServiceRepository {

  final HonpassDatabase _db;

  ServiceRepository(this._db);

  Future<int> insertService(Service service) async {
    return await _db.upsert(service);
  }

  Future<List<Service>> services() async {

    List<Map<String, dynamic>> maps = await _db.records(Service.TABLE_NAME);

    return List.generate(maps.length, (i) {
      return Service.fromJson(maps[i]);
    });
  }

  Future<Service> service(int serviceId) async {

    Map<String, dynamic> map = await _db.record(
        Service.TABLE_NAME,
        '${Service.COLUMN_ID} = ?',
        [serviceId]
    );

    return Service.fromJson(map);
  }
}