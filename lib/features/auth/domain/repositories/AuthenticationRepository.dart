abstract class AuthenticationRepository {
  Future<void> registerUser(String email, String password, String firstName,
      String lastName, String userName);

  Future<String> loginUser(String userIdentifier, String password);

  Future<void> logOutUser();
}
