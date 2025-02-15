import 'package:business_tracker/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:business_tracker/features/warehouse/domain/entities/warehouse_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WarehouseCubit extends Cubit<List<Warehouse>> {
  final WarehouseRepository repository;
  int currentPage = 1;
  bool isLastPage = false;
  bool isLoading = false;

  WarehouseCubit(this.repository) : super([]);

  Future<void> loadWarehouses() async {
    if (isLastPage || isLoading) return;

    isLoading = true;
    try {
      final response = await repository.getWarehouses(currentPage);
      if (response.results != null && response.results!.isNotEmpty) {
        emit([...response.results!]); // Emit fresh data
        currentPage++;
      } else {
        isLastPage = true;
      }
    } catch (e) {
      print('Error loading warehouses: $e');
    } finally {
      isLoading = false;
    }
  }

  Future<void> addWarehouse(Map<String, dynamic> warehouseData) async {
    try {
      final savedWarehouse = await repository.addWarehouse(warehouseData);
      emit([savedWarehouse, ...state]);
    } catch (e) {
      print('Error adding warehouse: $e');
    }
  }
}
