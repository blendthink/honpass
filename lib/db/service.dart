import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Service {

  final int id;
  final String name;
  final String url;
  final String iconPath;

  Service({this.id, this.url, this.name, this.iconPath});
}