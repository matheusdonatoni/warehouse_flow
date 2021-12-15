import 'package:csv/csv.dart';

import '_impl/base_repository_impl.dart';

class CsvRepository extends BaseRepositoryImpl {
  Future<List<List>> find() async {
    var content = await importer.pickCsv();

    return CsvToListConverter().convert(content, fieldDelimiter: ';');
  }
}
