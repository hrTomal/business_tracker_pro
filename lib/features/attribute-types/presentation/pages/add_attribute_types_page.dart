import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';

class AddAttributeTypesPage extends StatefulWidget {
  static const String routeName = 'addAttributeTypesPage';

  const AddAttributeTypesPage({super.key});

  @override
  State<AddAttributeTypesPage> createState() => _AddAttributeTypesPageState();
}

class _AddAttributeTypesPageState extends State<AddAttributeTypesPage> {
  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    final controllers = _initControllers();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Attribute Types',
      ),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: () => _onSavePressed(context, controllers),
      ),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              controller: controllers['name']!,
              labelText: 'Name',
              hintText: 'Enter Attribute Type name',
            ),
            const FixedSizedBox(),
          ],
        ),
      ),
    );
  }

  Map<String, TextEditingController> _initControllers() {
    return {
      'name': TextEditingController(),
    };
  }

  void _onSavePressed(
      BuildContext context, Map<String, TextEditingController> controllers) {
    final errors = ValidationUtils.validateTextFields(
      [
        {
          'controller': controllers['name']!,
          'errorMessage': 'Attribute Type name is required',
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
