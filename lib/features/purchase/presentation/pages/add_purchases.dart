import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';

class AddPurchasesPage extends StatefulWidget {
  static const String routeName = 'addPurchasesPage';

  const AddPurchasesPage({super.key});

  @override
  State<AddPurchasesPage> createState() => _AddPurchasesPageState();
}

class _AddPurchasesPageState extends State<AddPurchasesPage> {
  String _selectedStatus = 'ordered';

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    final controllers = _initControllers();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add Purchase',
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
              controller: controllers['delivery_fee']!,
              labelText: 'Delivery Fee',
              hintText: 'Enter delivery fee',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['discount']!,
              labelText: 'Discount',
              hintText: 'Enter discount',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['note']!,
              labelText: 'Note',
              hintText: 'Enter note',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['expected_delivery_at']!,
              labelText: 'Expected Delivery At',
              hintText: 'Enter expected delivery date',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['additional_fee']!,
              labelText: 'Additional Fee',
              hintText: 'Enter additional fee',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['ordered_at']!,
              labelText: 'Ordered At',
              hintText: 'Enter order date',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['vat']!,
              labelText: 'VAT',
              hintText: 'Enter VAT',
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['vendor_ref']!,
              labelText: 'Vendor Reference',
              hintText: 'Enter vendor reference',
            ),
            const FixedSizedBox(),
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              decoration: const InputDecoration(
                labelText: 'Status',
              ),
              items: const [
                DropdownMenuItem(value: 'draft', child: Text('Draft')),
                DropdownMenuItem(value: 'ordered', child: Text('Ordered')),
                DropdownMenuItem(value: 'received', child: Text('Received')),
                DropdownMenuItem(value: 'cancelled', child: Text('Cancelled')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedStatus = value!;
                });
              },
            ),
            const FixedSizedBox(),
          ],
        ),
      ),
    );
  }

  Map<String, TextEditingController> _initControllers() {
    return {
      'delivery_fee': TextEditingController(),
      'discount': TextEditingController(),
      'note': TextEditingController(),
      'expected_delivery_at': TextEditingController(),
      'additional_fee': TextEditingController(),
      'ordered_at': TextEditingController(),
      'vat': TextEditingController(),
      'vendor_ref': TextEditingController(),
    };
  }

  void _onSavePressed(
      BuildContext context, Map<String, TextEditingController> controllers) {
    final errors = ValidationUtils.validateTextFields(
      [
        {
          'controller': controllers['delivery_fee']!,
          'errorMessage': 'Delivery Fee is required'
        },
        {
          'controller': controllers['discount']!,
          'errorMessage': 'Discount is required'
        },
        {
          'controller': controllers['note']!,
          'errorMessage': 'Note is required'
        },
        {
          'controller': controllers['expected_delivery_at']!,
          'errorMessage': 'Expected Delivery Date is required'
        },
        {
          'controller': controllers['additional_fee']!,
          'errorMessage': 'Additional Fee is required'
        },
        {
          'controller': controllers['ordered_at']!,
          'errorMessage': 'Ordered At is required'
        },
        {'controller': controllers['vat']!, 'errorMessage': 'VAT is required'},
        {
          'controller': controllers['vendor_ref']!,
          'errorMessage': 'Vendor Reference is required'
        },
      ],
    );

    if (errors.isNotEmpty) {
      showErrorSnackbar(context: context, errors: errors);
    } else {
      final purchaseData = {
        'delivery_fee': controllers['delivery_fee']!.text.trim(),
        'discount': controllers['discount']!.text.trim(),
        'note': controllers['note']!.text.trim(),
        'expected_delivery_at':
            controllers['expected_delivery_at']!.text.trim(),
        'additional_fee': controllers['additional_fee']!.text.trim(),
        'ordered_at': controllers['ordered_at']!.text.trim(),
        'vat': controllers['vat']!.text.trim(),
        'vendor_ref': controllers['vendor_ref']!.text.trim(),
        'status': _selectedStatus,
      };

      print(purchaseData);

      // final purchaseCubit = context.read<PurchaseCubit>();
      // purchaseCubit.addPurchase(purchaseData).then((_) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('Purchase added successfully!')),
      //   );
      //   Navigator.of(context).pop(true);
      // }).catchError((error) {
      //   showErrorSnackbar(
      //     context: context,
      //     errors: [error.toString()],
      //   );
      // });
    }
  }
}
