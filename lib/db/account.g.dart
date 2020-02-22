// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
      id: json['id'] as int,
      serviceId: json['serviceId'] as String,
      name: json['name'] as String,
      password: json['password'] as String);
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'serviceId': instance.serviceId,
      'name': instance.name,
      'password': instance.password
    };
