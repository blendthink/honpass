import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service {

  static const String TABLE_NAME = 'services';

  static const String COLUMN_ID = 'id';
  static const String COLUMN_NAME = 'name';
  static const String COLUMN_URL = 'url';
  static const String COLUMN_ICON_PATH = 'icon_path';

  @JsonKey(name: COLUMN_ID)
  final int id;
  @JsonKey(name: COLUMN_NAME)
  final String name;
  @JsonKey(name: COLUMN_URL)
  final String url;
  @JsonKey(name: COLUMN_ICON_PATH)
  final String iconPath;

  Service({this.id, this.url, this.name, this.iconPath});

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

  Map<String, dynamic> toMap() => _$ServiceToJson(this);
}