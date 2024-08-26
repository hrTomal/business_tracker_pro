import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';

class AddExpenseTypesPage extends StatefulWidget {
  static const String routeName = 'addExpenseTypesPage';
  const AddExpenseTypesPage({super.key});

  @override
  State<AddExpenseTypesPage> createState() => _AddExpenseTypesPageState();
}

class _AddExpenseTypesPageState extends State<AddExpenseTypesPage> {
  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    final textFieldControllers = _initTextFieldControllers();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add Expense Types',
      ),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: () => _onSavePressed(context, textFieldControllers),
      ),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: textFieldControllers['title']!,
              labelText: 'Title',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: textFieldControllers['description']!,
              labelText: 'Description',
            ),
            const FixedSizedBox(),
          ],
        ),
      ),
    );
  }

  Map<String, TextEditingController> _initTextFieldControllers() {
    return {
      'title': TextEditingController(),
      'description': TextEditingController(),
    };
  }

  // Handle save button press
  void _onSavePressed(
      BuildContext context, Map<String, TextEditingController> controllers) {
    final errors = ValidationUtils.validateTextFields(
      [
        {
          'controller': controllers['title']!,
          'errorMessage': 'Title is required',
        },
        {
          'controller': controllers['description']!,
          'errorMessage': 'Description is required',
        },
      ],
    );

    if (errors.isNotEmpty) {
      showErrorSnackbar(context: context, errors: errors);
    } else {
      // Handle successful save logic here
    }
  }
}
