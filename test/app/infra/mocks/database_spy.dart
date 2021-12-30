import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSpy extends Mock implements Database {
  When mockRawQueryCall() => when(() => this.rawQuery(any(), [any()]));
}