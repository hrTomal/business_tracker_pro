import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/service_locator.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomCards/generic_name_delete_card.dart';
import 'package:business_tracker/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:business_tracker/features/warehouse/domain/entities/warehouse_response.dart';
import 'package:business_tracker/features/warehouse/presentation/blocs/warehouse_cubit.dart';
import 'package:business_tracker/features/warehouse/presentation/pages/add_warehouse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllWarehousesPage extends StatelessWidget {
  static const String routeName = 'allWarehousesPage';
  const AllWarehousesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);

    var floatingActionButton = FloatingActionButton.extended(
      onPressed: () async {
        var result =
            await Navigator.of(context).pushNamed(AddWarehousePage.routeName);
        if (result == true) {
          context.read<WarehouseCubit>().loadWarehouses();
        }
      },
      label: const Text('Add Vendor'),
      icon: const Icon(Icons.add_circle_outlined),
    );

    return BlocProvider(
      create: (_) =>
          WarehouseCubit(getIt<WarehouseRepository>())..loadWarehouses(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Warehouses',
        ),
        floatingActionButton: floatingActionButton,
        body: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: BlocBuilder<WarehouseCubit, List<Warehouse>>(
            builder: (context, warehouses) {
              if (warehouses.isEmpty) {
                return const Center(
                  child: Text(
                    'No Warehouses Available',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }

              // Display list of warehouses
              return NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    context.read<WarehouseCubit>().loadWarehouses();
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount: warehouses.length,
                  itemBuilder: (context, index) {
                    final warehouse = warehouses[index];
                    return GenericNameDeleteCard(
                      name: warehouse.name ?? 'Unknown',
                      onDelete: () async {
                        try {
                          // await context.read<WarehouseCubit>().deleteWarehouse(warehouse.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Deleted ${warehouse.name ?? 'Unknown'}'),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Failed to delete ${warehouse.name ?? 'Unknown'}'),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
