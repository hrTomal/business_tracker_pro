import 'package:business_tracker/features/brands/domain/repositories/BrandRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_tracker/features/brands/domain/entities/Brand.dart';

class BrandsCubit extends Cubit<List<Brand>> {
  final Brandrepository brandRepository;
  int currentPage = 1;
  bool isLastPage = false;
  bool isLoading = false;

  BrandsCubit(this.brandRepository) : super([]);

  Future<void> loadBrands() async {
    if (isLastPage || isLoading) return;

    isLoading = true;
    try {
      final response = await brandRepository.getBrands(currentPage);
      if (response.results != null && response.results!.isNotEmpty) {
        emit([...state, ...response.results!]);
        currentPage++;
      } else {
        isLastPage = true;
      }
    } catch (e) {
      // Handle error (e.g., log or show an error message)
    } finally {
      isLoading = false;
    }
  }
}
