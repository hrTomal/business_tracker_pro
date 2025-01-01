import 'package:business_tracker/features/company/domain/repositories/CompanyRepository.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_event.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GetCompanyBloc extends Bloc<GetCompanyEvent, GetCompanyState> {
  final CompanyRepository repository = GetIt.I<CompanyRepository>();

  GetCompanyBloc() : super(GetCompanyInitial()) {
    // Event to fetch the company list
    on<GetCompanyListRequested>((event, emit) async {
      emit(GetCompanyLoading());

      try {
        final response = await repository.getCompany(event.page);
        emit(GetCompanyListSuccess(
          companies: response.results,
          count: response.count ?? 0,
          next: response.next,
          previous: response.previous,
        ));
      } catch (e) {
        emit(GetCompanyFailure(error: e.toString()));
      }
    });

    // Event to select a company
    on<SelectedCompanyEvent>(
      (event, emit) {
        final currentState = state;

        if (currentState is GetCompanyListSuccess) {
          // Only emit if the selectedCompanyId has actually changed
          // if (currentState.selectedCompanyId != event.companyId) {
          emit(currentState.copyWith(selectedCompanyId: event.companyId));
          // }
        }
      },
    );
  }
}
