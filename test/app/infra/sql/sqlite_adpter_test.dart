import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse_flow/app/infra/sql/sqlite_adpter.dart';

import '../mocks/database_spy.dart';

void main() {
  late SQLiteAdapter sut;
  late DatabaseSpy database;

  setUp(() {
    database = DatabaseSpy();
    sut = SQLiteAdapter(database);
  });
}
