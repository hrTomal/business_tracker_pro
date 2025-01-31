import 'package:business_tracker/features/vendor/domain/entities/vendors_response.dart';

abstract class VendorRepository {
  Future<VendorsResponse> getVendors(int page);
  Future<Vendor> addVendor(
      String vendorName, String vendorEmail, String phone, String website);
}
