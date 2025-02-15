import 'package:business_tracker/features/warehouse/data/datasources/warehouse_remote_data_source.dart';
import 'package:business_tracker/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:business_tracker/features/warehouse/domain/entities/warehouse_response.dart';

class WarehouseRepositoryImpl implements WarehouseRepository {
  final WarehouseRemoteDataSource remoteDataSource;

  WarehouseRepositoryImpl(this.remoteDataSource);

  @override
  Future<WarehouseResponse> getWarehouses(int page) async {
    final response = await remoteDataSource.getWarehouses(page);
    return WarehouseResponse.fromJson(response);
  }

  @override
  Future<Warehouse> addWarehouse(Map<String, dynamic> warehouseData) async {
    final response = await remoteDataSource.addWarehouse(warehouseData);
    return Warehouse.fromJson(response);
  }
}
