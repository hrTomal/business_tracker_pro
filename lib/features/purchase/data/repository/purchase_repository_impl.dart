import 'package:business_tracker/features/purchase/domain/entities/purchase_response.dart';

abstract class PurchaseRepository {
  Future<PurchaseResponse> getPurchases(int page);
  Future<Purchase> addPurchase(Map<String, dynamic> purchaseData);
}
