import 'package:business_tracker/features/warehouse/domain/entities/warehouse_response.dart';

abstract class WarehouseRepository {
  Future<WarehouseResponse> getWarehouses(int page);
  Future<Warehouse> addWarehouse(Map<String, dynamic> warehouseData);
}
