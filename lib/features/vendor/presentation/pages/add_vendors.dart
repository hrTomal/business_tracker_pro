import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomRadioButton/custom_radio_button_row.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/dropdown/custom_dropdown_search.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';

class AddVendorPage extends StatefulWidget {
  static const String routeName = 'addVendorsPage';
  const AddVendorPage({super.key});

  @override
  State<AddVendorPage> createState() => _AddVendorPageState();
}

class _AddVendorPageState extends State<AddVendorPage> {
  var _balanceType = 'Payable';

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    final controllers = _initTextFieldControllers();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add Vendor',
      ),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: () => _onSavePressed(context, controllers),
      ),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                controller: controllers['fullName']!,
                labelText: 'Full Name',
              ),
              const FixedSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextField(
                    controller: controllers['phone']!,
                    labelText: 'Phone',
                    width: dimensions.halfTextFieldWidth,
                  ),
                  SizedBox(
                    width: dimensions.halfTextFieldWidth,
                    child: CustomDropdownSearch(
                      items: [
                        'Option 1',
                        'Option 2',
                        'Option 3',
                        'Option 4',
                        'Option 5',
                        'Option 6'
                      ],
                      labelText: 'Select Category',
                      createNewText: 'Create new',
                      onChanged: (value) {
                        print('Selected: $value');
                      },
                      itemAsString: (item) => item,
                      onCreateNew: () {
                        // Navigator.of(context).pushNamed(AddCategories.routeName);
                      },
                    ),
                  )
                ],
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: controllers['email']!,
                labelText: 'Email',
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: controllers['address']!,
                labelText: 'Address',
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: controllers['description']!,
                labelText: 'Description',
              ),
              const FixedSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: dimensions.screenWidth * 0.45,
                    child: CustomTextField(
                      controller: controllers['openingBalance']!,
                      labelText: 'Opening Balance',
                      isNumberOnly: true,
                    ),
                  ),
                  SizedBox(
                    width: dimensions.screenWidth * 0.45,
                    child: CustomRadioButtonRow(
                      options: ['Payable', 'Receivable'],
                      groupValue: _balanceType,
                      onChanged: (value) {
                        setState(() {
                          _balanceType = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Initialize TextEditingControllers
  Map<String, TextEditingController> _initTextFieldControllers() {
    return {
      'fullName': TextEditingController(),
      'phone': TextEditingController(),
      'email': TextEditingController(),
      'address': TextEditingController(),
      'description': TextEditingController(),
      'openingBalance': TextEditingController(text: '0.00'),
    };
  }

  // Handle save button press
  void _onSavePressed(
      BuildContext context, Map<String, TextEditingController> controllers) {
    final errors = ValidationUtils.validateTextFields(
      [
        {
          'controller': controllers['fullName']!,
          'errorMessage': 'Full Name is required',
        },
        {
          'controller': controllers['phone']!,
          'errorMessage': 'Phone No is required',
        },
        {
          'controller': controllers['email']!,
          'errorMessage': 'Email is required',
        },
        {
          'controller': controllers['address']!,
          'errorMessage': 'Address is required',
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
