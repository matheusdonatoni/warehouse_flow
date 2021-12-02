import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_flow/controllers/_impl/filterable_list_mixin.dart';
import 'package:warehouse_flow/views/widgets/column_filter.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/helpers/table_view_model.dart';
import '../../data/models/product.dart';
import '../../controllers/root_controllers/root_controller.dart';

import '../_impl/base_getx_controller_impl.dart';

class ProductsController extends BaseGetxControllerImpl
    with FilterableTableMixin<Product> {
  ProductRepository get _repo => Get.find();
  RootController get _rootController => Get.find();

  RxList<Product> get products => _rootController.products;

  void showColumnFilterBottomSheet(int index) {
    Get.bottomSheet(
      ColumnFilterBottomSheet(
        columnFilter: tableFilters.columnFilters[index],
      ),
      backgroundColor: Get.theme.cardColor,
      isScrollControlled: true,
      ignoreSafeArea: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(4.0),
        ),
      ),
    );
  }

  @override
  void onInit() async {
    super.onInit();

    setupFilters();
  }

  @override
  void setupFilters() {
    filteredList.value = RxList.from(products);

    tableFilters.columnFilters.addAll([
      ColumnFilter(
        'Código',
        options: products.map(
          (product) => BooleanFilter(
            product.code,
            onChanged: (value) {
              if (value != null && value) {
                filteredList.removeWhere(
                  (filter) => filter.code == product.code,
                );
              } else {
                filteredList.addAll(
                  products.where(
                    (_product) => _product.code == product.code,
                  ),
                );
              }
            },
          ),
        ),
      ),
      ColumnFilter(
        'Descrição',
        options: products.map(
          (product) => BooleanFilter(
            product.description,
            onChanged: (value) {
              if (value != null && value) {
                filteredList.removeWhere(
                  (filter) => filter.description == product.description,
                );
              } else {
                filteredList.addAll(
                  products.where(
                    (_product) => _product.description == product.description,
                  ),
                );
              }
            },
          ),
        ),
      ),
      ColumnFilter(
        'Unidade',
        options: products.map(
          (product) => BooleanFilter(
            product.unit,
            onChanged: (value) {
              if (value != null && value) {
                filteredList.removeWhere(
                  (filter) => filter.unit == product.unit,
                );
              } else {
                filteredList.addAll(
                  products.where(
                    (_product) => _product.unit == product.unit,
                  ),
                );
              }
            },
          ),
        ),
      ),
      ColumnFilter(
        'Tipo',
        options: products.map(
          (product) => BooleanFilter(
            product.type,
            onChanged: (value) {
              if (value != null && value) {
                filteredList.removeWhere(
                  (filter) => filter.type == product.type,
                );
              } else {
                filteredList.addAll(
                  products.where(
                    (_product) => _product.type == product.type,
                  ),
                );
              }
            },
          ),
        ),
      ),
    ]);
  }
}
