import 'package:business_tracker/features/vendor/data/datasources/vendor_remote_data_source.dart';
import 'package:business_tracker/features/vendor/data/repository/vendor_repository.dart';
import 'package:business_tracker/features/vendor/domain/entities/vendors_response.dart';

class VendorRepositoryImpl implements VendorRepository {
  final VendorDataSource remoteDataSource;

  VendorRepositoryImpl(this.remoteDataSource);

  @override
  Future<VendorsResponse> getVendors(int page) async {
    final response = await remoteDataSource.getVendors(page);
    return VendorsResponse.fromJson(response);
  }

  @override
  Future<Vendor> addVendor(
    String vendorName,
    String vendorEmail,
    String phone,
    String website,
  ) async {
    final response = await remoteDataSource.addVendor(
        vendorName, vendorEmail, phone, website);
    return Vendor.fromJson(response);
  }
}
