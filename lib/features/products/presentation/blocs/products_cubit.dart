import 'package:business_tracker/features/products/data/repository/ProductRepository.dart';
import 'package:business_tracker/features/products/domain/entities/ProductsResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<List<ProductInfo>> {
  final Productrepository repository;
  int currentPage = 1;
  bool isLastPage = false;
  bool isLoading = false;

  ProductsCubit(this.repository) : super([]);

  Future<void> loadProducts() async {
    if (isLastPage || isLoading) return;

    isLoading = true;
    try {
      final response = await repository.getProducts();
      if (response.results != null && response.results!.isNotEmpty) {
        emit([...response.results!]); // Emit only the fresh data
        currentPage++;
      } else {
        isLastPage = true;
      }
    } catch (e) {
      print('Error loading Products: $e');
    } finally {
      isLoading = false;
    }
  }
}
