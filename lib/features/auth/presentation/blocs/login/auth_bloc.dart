import 'package:business_tracker/features/auth/domain/repositories/AuthenticationRepository.dart';
import 'package:business_tracker/features/auth/presentation/blocs/login/auth_event.dart';
import 'package:business_tracker/features/auth/presentation/blocs/login/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository repository =
      GetIt.I<AuthenticationRepository>();

  AuthBloc() : super(AuthInitial()) {
    on<AuthSubmitted>((event, emit) async {
      emit(AuthLoading());

      try {
        var accessToken =
            await repository.loginUser(event.userIdentifier, event.password);

        emit(AuthSuccess(accessToken: accessToken));
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });

    // Handle logout request
    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading()); // Show loading state during logout

      try {
        await repository.logOutUser();
        emit(AuthLoggedOut());
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
