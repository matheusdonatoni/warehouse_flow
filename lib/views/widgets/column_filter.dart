import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:warehouse_flow/data/utils/table_view_model.dart';

class ColumnFilterBottomSheet extends StatelessWidget {
  final ColumnFilter columnFilter;
  const ColumnFilterBottomSheet({
    Key? key,
    required this.columnFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.7,
      initialChildSize: 0.7,
      expand: false,
      builder: (context, controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.sort),
                    title: Text('Ordenação'),
                    subtitle: Text('Nenhum'),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Pesquisar',
                            ),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.clear),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: Container(
                margin: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: CheckboxListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 24.0),
                        title: Text('Selecionar tudo'),
                        tristate: true,
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          var option = columnFilter.options[index];

                          return Obx(
                            () => CheckboxListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              title: Text(option.label),
                              value: option.value,
                              onChanged: option.onChanged,
                            ),
                          );
                        },
                        childCount: columnFilter.options.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
