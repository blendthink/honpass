import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {

  static const String TABLE_NAME = 'accounts';

  static const String COLUMN_ID = 'id';
  static const String COLUMN_SERVICE_ID = 'service_id';
  static const String COLUMN_NAME = 'name';
  static const String COLUMN_PASSWORD = 'password';

  @JsonKey(name: COLUMN_ID)
  final int id;
  @JsonKey(name: COLUMN_SERVICE_ID)
  final String serviceId;
  @JsonKey(name: COLUMN_NAME)
  final String name;
  @JsonKey(name: COLUMN_PASSWORD)
  final String password;

  Account({this.id, this.serviceId, this.name, this.password});

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toMap() => _$AccountToJson(this);
}