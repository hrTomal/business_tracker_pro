import 'package:business_tracker/features/company/data/datasources/CompanyRemoteDataSource.dart';
import 'package:business_tracker/features/company/domain/repositories/CompanyRepository.dart';

class CompanyRepositoryimpl implements CompanyRepository {
  final CompanyRemoteDataSource remoteDataSource;

  CompanyRepositoryimpl(this.remoteDataSource);

  @override
  Future<void> createCompany(
      String companyName, String addressLine1, String addressLine2) async {
    await remoteDataSource.createCompany(
        companyName, addressLine1, addressLine2);
  }
}
