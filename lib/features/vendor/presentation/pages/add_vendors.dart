import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:business_tracker/features/vendor/presentation/blocs/vendors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddVendorPage extends StatefulWidget {
  static const String routeName = 'addVendorsPage';
  const AddVendorPage({super.key});

  @override
  State<AddVendorPage> createState() => _AddVendorPageState();
}

class _AddVendorPageState extends State<AddVendorPage> {
  // var _balanceType = 'Payable';

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
              CustomTextField(
                controller: controllers['fullName']!,
                labelText: 'Full Name',
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: controllers['phone']!,
                labelText: 'Phone',
                // width: dimensions.halfTextFieldWidth,
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: controllers['email']!,
                labelText: 'Email',
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: controllers['website']!,
                labelText: 'Website',
              ),
              const FixedSizedBox(),
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
      'website': TextEditingController(),
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
      ],
    );

    if (errors.isNotEmpty) {
      showErrorSnackbar(context: context, errors: errors);
    } else {
      final name = controllers['fullName']!.text.trim();
      final phone = controllers['phone']!.text.trim();
      final website = controllers['website']!.text.trim();
      final email = controllers['email']!.text.trim();

      final vendorCubit = context.read<VendorCubit>();

      vendorCubit.addVendor(name, email, phone, website).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vendor added successfully!')),
        );
        Navigator.of(context).pop(true);
      }).catchError((error) {
        showErrorSnackbar(
          // ignore: use_build_context_synchronously
          context: context,
          errors: [error.toString()],
        );
      });
    }
  }
}
