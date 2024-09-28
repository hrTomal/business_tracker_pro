import 'package:business_tracker/features/auth/data/datasources/AuthenticationRemoteDataSource.dart';
import 'package:business_tracker/features/auth/domain/repositories/AuthenticationRepository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> registerUser(String email, String password, String firstName,
      String lastName, String userName) async {
    await remoteDataSource.registerUser(
        email, password, firstName, lastName, userName);
  }
}
