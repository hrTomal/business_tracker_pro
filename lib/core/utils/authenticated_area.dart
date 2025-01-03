import 'package:business_tracker/features/auth/presentation/pages/auth_page.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_bloc.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_state.dart';
import 'package:business_tracker/features/company/presentation/pages/all_companies.dart';
import 'package:business_tracker/features/company/presentation/pages/create_company.dart';
import 'package:business_tracker/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticatedArea extends StatelessWidget {
  static const String routeName = 'AuthenticatedArea_page';

  const AuthenticatedArea({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetCompanyBloc, GetCompanyState>(
      listener: (context, state) {
        if (state is GetCompanyListSuccess) {
          if (state.companies!.isEmpty) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const CreateCompanyPage()),
            );
          } else if (state.companies!.length == 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const Dashboard()),
            );
          } else if (state.companies!.length > 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const AllCompaniesPage()),
            );
          }
        } else if (state is GetCompanyFailure) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AuthenticationPage()),
          );
        }
      },
      child: Scaffold(
        body: BlocBuilder<GetCompanyBloc, GetCompanyState>(
          builder: (context, state) {
            if (state is GetCompanyLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: Text('Loading Company Data...'));
          },
        ),
      ),
    );
  }
}
