import 'package:json_annotation/json_annotation.dart';

import '../honpass_entity.dart';

part 'account.g.dart';

@JsonSerializable()
class Account implements HonpassEntity {

  static const String TABLE_NAME = 'accounts';

  static const String COLUMN_ID = 'id';
  static const String COLUMN_SERVICE_ID = 'service_id';
  static const String COLUMN_NAME = 'name';
  static const String COLUMN_PASSWORD = 'password';

  @JsonKey(name: COLUMN_ID)
  final int id;
  @JsonKey(name: COLUMN_SERVICE_ID)
  final int serviceId;
  @JsonKey(name: COLUMN_NAME)
  final String name;
  @JsonKey(name: COLUMN_PASSWORD)
  final String password;

  Account({this.id, this.serviceId, this.name, this.password});

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  @override
  String tableName() {
    return TABLE_NAME;
  }

  @override
  Map<String, dynamic> toMap() => _$AccountToJson(this);
}