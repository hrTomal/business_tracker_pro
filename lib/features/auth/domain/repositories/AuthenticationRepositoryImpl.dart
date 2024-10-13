import 'package:business_tracker/core/storage/token_storage.dart';
import 'package:business_tracker/features/auth/data/datasources/AuthenticationRemoteDataSource.dart';
import 'package:business_tracker/features/auth/domain/repositories/AuthenticationRepository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  final TokenStorage _tokenStorage = TokenStorage();

  AuthenticationRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> registerUser(String email, String password, String firstName,
      String lastName, String userName) async {
    await remoteDataSource.registerUser(
        email, password, firstName, lastName, userName);
  }

  @override
  Future<void> loginUser(String userIdentifier, String password) async {
    await remoteDataSource.loginUser(userIdentifier, password);
  }

  @override
  Future<void> logOutUser() async {
    await _tokenStorage.clearTokens();
  }
}
