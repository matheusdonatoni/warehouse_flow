import 'package:get/get.dart';
import 'package:warehouse_flow/data/utils/table_source.dart';
import '../_impl/base_getx_controller_impl.dart';
import 'package:warehouse_flow/data/repositories/csv_repository.dart';

class FileImporterController extends BaseGetxControllerImpl {
  CsvRepository get _csvRepository => Get.find();

  late final Worker _worker;

  final rows = RxList<List>();

  final TableSource source = TableSource([]);

  void importCsv() async {
    rows.assignAll(await _csvRepository.find());
  }

  void clear() => rows.clear();

  @override
  void onInit() {
    super.onInit();

    status = RxStatus.empty();

    _worker = ever<List>(rows, (data) {
      if (data.isEmpty)
        status = RxStatus.empty();
      else {
        status = RxStatus.success();
      }

      source.updateData([]);
    });
  }

  @override
  void onClose() {
    _worker.dispose();

    super.onClose();
  }
}
