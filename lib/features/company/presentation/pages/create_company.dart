import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/GenericInputField/GenericInputField.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    _companyNameController.dispose();
    super.dispose();
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
                    onPressed: () {},
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
