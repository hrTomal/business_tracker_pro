import 'package:business_tracker/features/company/data/datasources/CompanyRemoteDataSource.dart';
import 'package:flutter/material.dart';
import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/GenericInputField/GenericInputField.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_buttons.dart';

class CreateCompanyPage extends StatefulWidget {
  static const String routeName = 'create_company_page';
  const CreateCompanyPage({super.key});

  @override
  State<CreateCompanyPage> createState() => _CreateCompanyPageState();
}

class _CreateCompanyPageState extends State<CreateCompanyPage> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final CompanyRemoteDataSource _dataSource = CompanyRemoteDataSource();

  @override
  void dispose() {
    _companyNameController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    super.dispose();
  }

  Future<void> _onBoardCompany(BuildContext context) async {
    final companyName = _companyNameController.text;
    final addressLine1 = _addressLine1Controller.text;
    final addressLine2 = _addressLine2Controller.text;

    if (companyName.isNotEmpty && addressLine1.isNotEmpty) {
      try {
        await _dataSource.createCompany(
            companyName, addressLine1, addressLine2);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Company created successfully!")),
        );
        _companyNameController.clear();
        _addressLine1Controller.clear();
        _addressLine2Controller.clear();
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${error.toString()}")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all required fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    double gap = 10;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Create Company',
        ),
        body: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: Center(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const Text(
                    'Input Details',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: gap),
                  GenericInputField(
                    controller: _companyNameController,
                    labelText: 'Company Name',
                  ),
                  SizedBox(height: gap),
                  GenericInputField(
                    controller: _addressLine1Controller,
                    labelText: 'Address Line 1',
                  ),
                  SizedBox(height: gap),
                  GenericInputField(
                    controller: _addressLine2Controller,
                    labelText: 'Address Line 2',
                  ),
                  SizedBox(height: gap),
                  CustomButtonPrimary(
                    text: 'On Board',
                    onPressed: () => _onBoardCompany(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
