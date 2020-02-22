import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Service {

  final int id;
  final String name;
  final String iconPath;

  Service({this.id, this.name, this.iconPath});
}