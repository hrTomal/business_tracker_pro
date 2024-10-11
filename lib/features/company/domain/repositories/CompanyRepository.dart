abstract class CompanyRepository {
  Future<void> createCompany(
      String companyName, String addressLine1, String addressLine2);
}
