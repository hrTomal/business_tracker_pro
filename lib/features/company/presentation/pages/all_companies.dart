import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:flutter/material.dart';

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
        ),
      ),
    );
  }
}
