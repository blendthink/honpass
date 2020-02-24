abstract class HonpassEntity<T> {
  String tableName();
  Map<String, dynamic> toMap();
}