import 'package:business_tracker/features/company/data/datasources/CompanyRemoteDataSource.dart';
import 'package:business_tracker/features/company/domain/entities/PaginatedCompaniesResponse.dart';
import 'package:business_tracker/features/company/domain/repositories/CompanyRepository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyRemoteDataSource remoteDataSource;

  CompanyRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> createCompany(
      String companyName, String addressLine1, String addressLine2) async {
    await remoteDataSource.createCompany(
        companyName, addressLine1, addressLine2);
  }

  @override
  Future<PaginatedCompaniesResponse> getCompany(int page) async {
    // Fetch the response from the remote data source
    final response = await remoteDataSource.getCompany(page);

    // Ensure the response is directly passed to fromJson
    return PaginatedCompaniesResponse.fromJson(response);
  }
}
