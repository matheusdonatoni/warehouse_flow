import 'package:get/get.dart';
import '../../data/models/product.dart';
import '../../controllers/root_controllers/root_controller.dart';
import '../_impl/base_getx_controller_impl.dart';

class ProductsController extends BaseGetxControllerImpl{
  RootController get _rootController => Get.find();

  RxList<Product> get products => _rootController.products;

  // void showColumnFilterBottomSheet(int index) async {
  //   ColumnFilter? result = await Get.bottomSheet(
  //     ColumnFilterBottomSheet(
  //       filter: tableFilterOptions.columnFilters[index].copyWith(),
  //     ),
  //     backgroundColor: Get.theme.cardColor,
  //     isScrollControlled: true,
  //     ignoreSafeArea: false,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(4.0),
  //       ),
  //     ),
  //   );

  //   if (result != null) tableFilterOptions.columnFilters[index] = result;
  // }

  @override
  void onInit() async {
    super.onInit();

    // setupFilters();
  }

  // @override
  // void setupFilters() {
  //   tableFilterOptions.columnFilters.addAll([
  //     ColumnFilter(
  //       'Código',
  //       options: filteredData.map(
  //         (product) => BooleanFilter(
  //           product.parsedCode,
  //         ),
  //       ),
  //     ),
  //     ColumnFilter(
  //       'Descrição',
  //       options: filteredData.map(
  //         (product) => BooleanFilter(
  //           product.description,
  //         ),
  //       ),
  //     ),
  //     ColumnFilter(
  //       'Unidade',
  //       options: filteredData.map(
  //         (product) => BooleanFilter(
  //           product.unit,
  //         ),
  //       ),
  //     ),
  //     ColumnFilter(
  //       'Tipo',
  //       options: filteredData.map(
  //         (product) => BooleanFilter(
  //           product.type,
  //         ),
  //       ),
  //     ),
  //   ]);
  // }
}
