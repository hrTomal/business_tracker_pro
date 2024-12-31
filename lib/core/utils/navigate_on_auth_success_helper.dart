import 'package:business_tracker/features/auth/presentation/pages/auth_page.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_bloc.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_event.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_state.dart';
import 'package:business_tracker/features/company/presentation/pages/all_companies.dart';
import 'package:business_tracker/features/company/presentation/pages/create_company.dart';
import 'package:business_tracker/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void navigateOnAuthSuccess(BuildContext context, String? accessToken) {
  if (accessToken != null) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) =>
              GetCompanyBloc()..add(const GetCompanyListRequested(page: 1)),
          child: BlocBuilder<GetCompanyBloc, GetCompanyState>(
            builder: (context, state) {
              if (state is GetCompanyLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetCompanyListSuccess) {
                if (state.companies!.isEmpty) {
                  return const CreateCompanyPage(); // No companies
                } else if (state.companies!.length == 1) {
                  return const Dashboard(); // Single company
                } else if (state.companies!.length > 1) {
                  return const AllCompaniesPage(); // Multiple company
                } else {
                  return const SnackBar(
                    content: Text('Something went wrong.'),
                  ); //Fallback
                }
              } else if (state is GetCompanyFailure) {
                return const AuthenticationPage();
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  } else {
    Navigator.of(context).pushReplacementNamed(AuthenticationPage.routeName);
  }
}
