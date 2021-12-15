import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveTableSearch extends GetResponsiveView<ResponsiveTableSearch> {
  ResponsiveTableSearch({Key? key})
      : super(
          key: key,
          settings: ResponsiveScreenSettings(
            tabletChangePoint: 300,
          ),
        ) {
    Get.lazyPut(() => ResponsiveTableSearch());
  }

  @override
  Widget? desktop() {
    return IconButton(
      onPressed: () {},
      tooltip: 'Procurar nesta planilha',
      icon: Icon(Icons.search),
    );
  }

  @override
  Widget? tablet() {
    return SizedBox(
      width: 250,
      child: TextField(),
    );
  }

  @override
  Widget? phone() {
    return IconButton(
      onPressed: () {},
      tooltip: 'Procurar nesta planilha',
      icon: Icon(Icons.search),
    );
  }
}
