import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {

  final int id;
  final String serviceId;
  final String name;
  final String password;

  Account({this.id, this.serviceId, this.name, this.password});

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toMap() => _$AccountToJson(this);
}