import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_add_floatingaction_button.dart';
import 'package:business_tracker/features/warehouse/presentation/pages/add_warehouse.dart';
import 'package:business_tracker/features/warehouse/presentation/widgets/warehouse_details_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllWarehousesPage extends StatelessWidget {
  static const String routeName = 'allWarehousePage';
  AllWarehousesPage({super.key});
  final _warehouseCount = 10;

  @override
  Widget build(BuildContext context) {
    var customAddFloatingActionButton = CustomAddFloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AddWarehousePage.routeName);
      },
      title: 'Add warehouse',
    );
    return Scaffold(
      appBar: const CustomAppBar(title: 'Warehouses'),
      floatingActionButton:
          _warehouseCount > 0 ? customAddFloatingActionButton : null,
      body: _warehouseCount < 1
          ? Center(
              child: customAddFloatingActionButton,
            )
          : ListView.builder(
              itemCount: _warehouseCount,
              itemBuilder: (context, index) {
                return WarehouseDetailsCardWidget(
                  imageUrl: 'https://via.placeholder.com/150',
                  title: 'Warehouses:  ${index + 1}',
                );
              },
            ),
    );
  }
}
