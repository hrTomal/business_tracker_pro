import 'package:business_tracker/features/vendor/data/repository/vendor_repository.dart';
import 'package:business_tracker/features/vendor/domain/entities/vendors_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorCubit extends Cubit<List<Vendor>> {
  final VendorRepository repository;
  int currentPage = 1;
  bool isLastPage = false;
  bool isLoading = false;

  VendorCubit(this.repository) : super([]);

  Future<void> loadVendors() async {
    if (isLastPage || isLoading) return;

    isLoading = true;
    try {
      final response = await repository.getVendors(currentPage);
      if (response.results != null && response.results!.isNotEmpty) {
        emit([...response.results!]); // Emit fresh data
        currentPage++;
      } else {
        isLastPage = true;
      }
    } catch (e) {
      print('Error loading vendors: $e');
    } finally {
      isLoading = false;
    }
  }

  Future<void> addVendor(String vendorName, String vendorEmail, String phone,
      String website) async {
    try {
      final savedVendor = await repository.addVendor(
        vendorName,
        vendorEmail,
        phone,
        website,
      );
      emit([savedVendor, ...state]);
    } catch (e) {
      print('Error adding vendor: $e');
    }
  }
}
