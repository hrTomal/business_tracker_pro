import 'package:business_tracker/features/company/domain/repositories/CompanyRepository.dart';
import 'package:business_tracker/features/company/presentation/blocs/create/create_company_event.dart';
import 'package:business_tracker/features/company/presentation/blocs/create/create_company_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CreateCompanyBloc extends Bloc<CreateCompanyEvent, CreateCompanyState> {
  final CompanyRepository repository = GetIt.I<CompanyRepository>();

  CreateCompanyBloc() : super(CreateCompanyInitial()) {
    on<CreateCompanySubmitted>((event, emit) async {
      emit(CreateCompanyLoading());

      try {
        await repository.createCompany(
            event.companyName, event.addressLine1, event.addressLine2);
        emit(CreateCompanySuccess());
      } catch (e) {
        emit(CreateCompanyFailure(error: e.toString()));
      }
    });
  }
}
