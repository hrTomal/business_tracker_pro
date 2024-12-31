import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_bloc.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_event.dart';
import 'package:business_tracker/features/company/presentation/blocs/get/get_company_state.dart';
import 'package:business_tracker/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCompaniesPage extends StatefulWidget {
  static const String routeName = 'all_companies_page';

  const AllCompaniesPage({super.key});

  @override
  State<AllCompaniesPage> createState() => _AllCompaniesPageState();
}

class _AllCompaniesPageState extends State<AllCompaniesPage> {
  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Your Companies',
        ),
        body: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: BlocBuilder<GetCompanyBloc, GetCompanyState>(
            builder: (context, state) {
              if (state is GetCompanyLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetCompanyListSuccess) {
                return ListView.builder(
                  itemCount: state.companies?.length,
                  itemBuilder: (context, index) {
                    final company = state.companies![index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          company.name ?? 'N/A',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          context
                              .read<GetCompanyBloc>()
                              .add(SelectedCompanyEvent(company.id!));
                          // Navigate to a company details page
                          Navigator.pushNamed(context, Dashboard.routeName);
                        },
                      ),
                    );
                  },
                );
              } else if (state is GetCompanyFailure) {
                return Center(
                  child: Text(
                    'Error: ${state.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return const Center(
                  child: Text('Please wait while we fetch your data.'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
