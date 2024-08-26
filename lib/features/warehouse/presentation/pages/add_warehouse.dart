import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';

class AddWarehousePage extends StatefulWidget {
  static const String routeName = 'addWarehousePage';
  const AddWarehousePage({super.key});

  @override
  State<AddWarehousePage> createState() => _AddWarehousePageState();
}

class _AddWarehousePageState extends State<AddWarehousePage> {
  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    final textFieldController = _initTextFieldControllers();

    return Scaffold(
      appBar: CustomAppBar(title: 'Add Warehouse'),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: () => _onSavePressed(context, textFieldController),
      ),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: textFieldController['warehouseName']!,
              labelText: 'Warehouse Name',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: textFieldController['address']!,
              labelText: 'Address',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: textFieldController['description']!,
              labelText: 'Description',
            ),
          ],
        ),
      ),
    );
  }

  // Initialize TextEditingControllers
  Map<String, TextEditingController> _initTextFieldControllers() {
    return {
      'warehouseName': TextEditingController(),
      'address': TextEditingController(),
      'description': TextEditingController(),
    };
  }

  // Handle save button press
  void _onSavePressed(
      BuildContext context, Map<String, TextEditingController> controllers) {
    final errors = ValidationUtils.validateTextFields(
      [
        {
          'controller': controllers['warehouseName']!,
          'errorMessage': 'Warehouse Name is required',
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
