import 'package:business_tracker/features/purchase/data/repository/purchase_repository_impl.dart';
import 'package:business_tracker/features/purchase/domain/entities/purchase_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseCubit extends Cubit<List<Purchase>> {
  final PurchaseRepository repository;
  int currentPage = 1;
  bool isLastPage = false;
  bool isLoading = false;

  PurchaseCubit(this.repository) : super([]);

  Future<void> loadPurchases() async {
    if (isLastPage || isLoading) return;

    isLoading = true;
    try {
      final response = await repository.getPurchases(currentPage);
      if (response.results != null && response.results!.isNotEmpty) {
        emit([...response.results!]); // Emit fresh data
        currentPage++;
      } else {
        isLastPage = true;
      }
    } catch (e) {
      print('Error loading purchases: $e');
    } finally {
      isLoading = false;
    }
  }

  Future<void> addPurchase(Map<String, dynamic> purchaseData) async {
    try {
      final savedPurchase = await repository.addPurchase(purchaseData);
      emit([savedPurchase, ...state]);
    } catch (e) {
      print('Error adding purchase: $e');
    }
  }
}
