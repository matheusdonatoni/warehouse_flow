import 'package:flutter/material.dart';
import 'package:warehouse_flow/app/presentation/presenters/getx_new_operation_presenter.dart';
import '../../../../ui/pages/new_operation/new_operation_page.dart';

Widget makeNewOperationPage(BuildContext context) => NewOperationPage(
      GetxNewOperationPresenter(),
    );
