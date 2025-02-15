import 'package:business_tracker/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:business_tracker/features/purchase/data/repository/purchase_repository_impl.dart';
import 'package:business_tracker/features/purchase/domain/entities/purchase_response.dart';

class PurchaseRepositoryImpl implements PurchaseRepository {
  final PurchaseRemoteDataSource remoteDataSource;

  PurchaseRepositoryImpl(this.remoteDataSource);

  @override
  Future<PurchaseResponse> getPurchases(int page) async {
    final response = await remoteDataSource.getPurchases(page);
    return PurchaseResponse.fromJson(response);
  }

  @override
  Future<Purchase> addPurchase(Map<String, dynamic> purchaseData) async {
    final response = await remoteDataSource.addPurchase(purchaseData);
    return Purchase.fromJson(response);
  }
}
