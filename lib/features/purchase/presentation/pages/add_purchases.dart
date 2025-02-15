import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/attribute-types/domain/entities/AttributeTypeResponse.dart';
import 'package:business_tracker/features/attribute-types/presentation/blocs/AttributeTypeCubit.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomDropdownFromCubit/custom_dropdown_from_cubit.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/custom_date_picker.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:business_tracker/features/purchase/presentation/blocs/purchase_cubit.dart';
import 'package:business_tracker/features/purchase/presentation/widgets/LineItemWidget.dart';
import 'package:business_tracker/features/vendor/domain/entities/vendors_response.dart';
import 'package:business_tracker/features/vendor/presentation/blocs/vendors_cubit.dart';
import 'package:business_tracker/features/warehouse/domain/entities/warehouse_response.dart';
import 'package:business_tracker/features/warehouse/presentation/blocs/warehouse_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddPurchasesPage extends StatefulWidget {
  static const String routeName = 'addPurchasesPage';

  const AddPurchasesPage({super.key});

  @override
  State<AddPurchasesPage> createState() => _AddPurchasesPageState();
}

class _AddPurchasesPageState extends State<AddPurchasesPage> {
  String _selectedStatus = 'ordered';
  DateTime? _orderedAt;
  DateTime? _expectedDeliveryAt;
  final List<Map<String, TextEditingController>> _lineItems = [];
  @override
  void initState() {
    super.initState();
    _orderedAt = DateTime.now(); // Set default value to today
    _expectedDeliveryAt = DateTime.now();
  }

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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDatePicker(
                controller: controllers['ordered_at']!,
                labelText: 'Ordered At',
                hintText: 'Select order date',
                initialDate: _orderedAt,
                onDateSelected: (pickedDate) {
                  setState(() {
                    _orderedAt = pickedDate;
                  });
                },
              ),
              const FixedSizedBox(),
              CustomDatePicker(
                controller: controllers['expected_delivery_at']!,
                labelText: 'Expected Delivery At',
                hintText: 'Select expected delivery date',
                initialDate: _expectedDeliveryAt,
                onDateSelected: (pickedDate) {
                  setState(() {
                    _expectedDeliveryAt = pickedDate;
                  });
                },
              ),

              const FixedSizedBox(),
              BlocBuilder<VendorCubit, List<Vendor>>(
                builder: (context, vendors) {
                  return CustomDropdownFromCubit<Vendor>(
                    label: 'Vendor',
                    loadItems: () => context.read<VendorCubit>().loadVendors(),
                    items: vendors,
                    getLabel: (vendor) => vendor.name ?? 'Unknown',
                    getKey: (vendor) => vendor.id.toString(),
                    selectedValue: null,
                    onChanged: (selectedId) {
                      print('Selected vendor ID: \$selectedId');
                    },
                  );
                },
              ),
              const FixedSizedBox(),

              BlocBuilder<WarehouseCubit, List<Warehouse>>(
                builder: (context, state) {
                  return CustomDropdownFromCubit<Warehouse>(
                    label: 'Warehouse',
                    loadItems: () =>
                        context.read<WarehouseCubit>().loadWarehouses(),
                    items: state,
                    getLabel: (item) => item.name ?? "N/A",
                    getKey: (item) => item.id.toString(),
                    onChanged: (selectedId) {
                      print('Selected ID: $selectedId');
                    },
                    selectedValue: null,
                  );
                },
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: controllers['delivery_fee']!,
                labelText: 'Delivery Fee',
                hintText: 'Enter delivery fee',
              ),
              const FixedSizedBox(),
              // CustomTextField(
              //   controller: controllers['discount']!,
              //   labelText: 'Discount',
              //   hintText: 'Enter discount',
              // ),
              // const FixedSizedBox(),
              CustomTextField(
                controller: controllers['note']!,
                labelText: 'Note',
                hintText: 'Enter note',
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: controllers['additional_fee']!,
                labelText: 'Additional Fee',
                hintText: 'Enter additional fee',
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
                    labelText: 'Status', border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(value: 'draft', child: Text('Draft')),
                  DropdownMenuItem(value: 'ordered', child: Text('Ordered')),
                  DropdownMenuItem(value: 'received', child: Text('Received')),
                  DropdownMenuItem(
                      value: 'cancelled', child: Text('Cancelled')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                },
              ),
              const FixedSizedBox(),
              ..._lineItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return Column(
                  children: [
                    LineItemWidget(itemControllers: item),
                    IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () => _removeLineItem(index),
                    ),
                  ],
                );
              }).toList(),
              TextButton(
                onPressed: _addLineItem,
                child: const Text('Add Line Item'),
              ),
              const FixedSizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, TextEditingController> _initControllers() {
    return {
      'delivery_fee': TextEditingController(text: "0"),
      'discount': TextEditingController(text: "0"),
      'note': TextEditingController(),
      'expected_delivery_at': TextEditingController(
          text: DateFormat('yyyy-MM-dd').format(_expectedDeliveryAt!)),
      'additional_fee': TextEditingController(text: "0"),
      'ordered_at': TextEditingController(
          text: DateFormat('yyyy-MM-dd').format(_orderedAt!)),
      'vat': TextEditingController(text: "0"),
      'vendor_ref': TextEditingController(),
    };
  }

  void _addLineItem() {
    setState(() {
      _lineItems.add({
        'quantity': TextEditingController(text: "0"),
        'discount': TextEditingController(text: "0"),
        'unit_price': TextEditingController(text: "0"),
        'vat': TextEditingController(text: "0"),
        'product': TextEditingController(),
      });
    });
  }

  void _removeLineItem(int index) {
    setState(() {
      _lineItems.removeAt(index);
    });
  }

  void _onSavePressed(
      BuildContext context, Map<String, TextEditingController> controllers) {
    final errors = ValidationUtils.validateTextFields(
      [
        // {
        //   'controller': controllers['note']!,
        //   'errorMessage': 'Note is required'
        // },

        // {
        //   'controller': controllers['vendor_ref']!,
        //   'errorMessage': 'Vendor Reference is required'
        // },
      ],
    );

    // Validate line items to ensure there is at least one
    if (_lineItems.isEmpty) {
      errors.add('At least one line item is required');
    } else {
      // Validate each line item
      for (var item in _lineItems) {
        errors.addAll(ValidationUtils.validateTextFields([
          {
            'controller': item['quantity']!,
            'errorMessage': 'Quantity is required'
          },
          {
            'controller': item['unit_price']!,
            'errorMessage': 'Unit Price is required'
          },
          {
            'controller': item['product']!,
            'errorMessage': 'Product is required',
          },
        ]));
      }
    }

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
        'line_items': _lineItems
            .map((item) => {
                  'quantity': int.tryParse(item['quantity']!.text) ?? 0,
                  'discount': item['discount']!.text.trim(),
                  'unit_price': item['unit_price']!.text.trim(),
                  'vat': item['vat']!.text.trim(),
                  'product': int.tryParse(item['product']!.text) ?? 0,
                })
            .toList(),
      };

      print(purchaseData);

      final purchaseCubit = context.read<PurchaseCubit>();
      purchaseCubit.addPurchase(purchaseData).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Purchase added successfully!')),
        );
        Navigator.of(context).pop(true);
      }).catchError((error) {
        showErrorSnackbar(
          context: context,
          errors: [error.toString()],
        );
      });
    }
  }
}
