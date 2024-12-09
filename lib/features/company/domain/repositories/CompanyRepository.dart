import 'package:business_tracker/features/company/domain/entities/PaginatedCompaniesResponse.dart';

abstract class CompanyRepository {
  Future<void> createCompany(
      String companyName, String addressLine1, String addressLine2);
  Future<PaginatedCompaniesResponse> getCompany(
      int page); // Updated to use PaginatedResponse
}
