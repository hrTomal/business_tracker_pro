import 'package:business_tracker/features/auth/domain/repositories/AuthenticationRepository.dart';
import 'package:business_tracker/features/auth/presentation/blocs/register/register_event.dart';
import 'package:business_tracker/features/auth/presentation/blocs/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationRepository repository =
      GetIt.I<AuthenticationRepository>();

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      emit(RegisterLoading());

      try {
        await repository.registerUser(event.email, event.password,
            event.firstName, event.lastName, event.userName);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterFailure(error: e.toString()));
      }
    });
  }
}
