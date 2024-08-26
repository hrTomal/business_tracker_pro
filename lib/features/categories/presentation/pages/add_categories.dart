import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomRadioButton/custom_radio_button_row.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';

class AddCategories extends StatefulWidget {
  static const String routeName = 'addCategoriesPage';
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  var _categoryType = 'Product';
  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    final controllers = _initControllers();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Categories',
      ),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: () => _onSavePressed(context, controllers),
      ),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
            const Text(
              'Select Category Type ',
              // style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomRadioButtonRow<String>(
              options: const ['Product', 'Service', 'Recipe'],
              groupValue: _categoryType,
              onChanged: (value) {
                setState(() {
                  print(value);
                  _categoryType = value!;
                });
              },
              width: dimensions.screenWidth * 0.60,
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['title']!,
              labelText: 'Title',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['description']!,
              labelText: 'Description',
            ),
            const FixedSizedBox(),
          ],
        ),
      ),
    );
  }

  // Initialize TextEditingControllers
  Map<String, TextEditingController> _initControllers() {
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
