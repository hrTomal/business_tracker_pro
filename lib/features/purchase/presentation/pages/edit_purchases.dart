import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomDropdownFromCubit/custom_dropdown_from_cubit.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/custom_date_picker.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/purchase/domain/entities/purchase_response.dart';
import 'package:business_tracker/features/purchase/presentation/widgets/LineItemWidget.dart';
import 'package:business_tracker/features/vendor/domain/entities/vendors_response.dart';
import 'package:business_tracker/features/vendor/presentation/blocs/vendors_cubit.dart';
import 'package:business_tracker/features/warehouse/domain/entities/warehouse_response.dart';
import 'package:business_tracker/features/warehouse/presentation/blocs/warehouse_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditPurchasesPage extends StatefulWidget {
  static const String routeName = 'editPurchasesPage';
  final Purchase purchase; // Pass the existing purchase

  const EditPurchasesPage({super.key, required this.purchase});

  @override
  State<EditPurchasesPage> createState() => _EditPurchasesPageState();
}

class _EditPurchasesPageState extends State<EditPurchasesPage> {
  late String _selectedStatus;
  late DateTime _orderedAt;
  late DateTime _expectedDeliveryAt;
  late String _selectedVendorId;
  late String _selectedWarehouseId;
  late List<Map<String, TextEditingController>> _lineItems;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    _selectedStatus = widget.purchase.status!;

    // Check if the dates are in String format or already DateTime
    _orderedAt = widget.purchase.orderedAt is String
        ? DateTime.parse(widget.purchase.orderedAt!)
        : widget.purchase.orderedAt as DateTime;

    _expectedDeliveryAt = widget.purchase.expectedDeliveryAt is String
        ? DateTime.parse(widget.purchase.expectedDeliveryAt!)
        : widget.purchase.expectedDeliveryAt as DateTime;

    _selectedVendorId = widget.purchase.vendor.toString();
    _selectedWarehouseId = widget.purchase.warehouse.toString();

    _lineItems = widget.purchase.lineItems!
        .map((item) => {
              'quantity': TextEditingController(text: item.quantity.toString()),
              'unit_price':
                  TextEditingController(text: item.unitPrice.toString()),
              'vat': TextEditingController(text: item.vat.toString()),
              'discount': TextEditingController(text: item.discount.toString()),
              'product': TextEditingController(text: item.product.toString()),
            })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    final controllers = _initControllers();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Purchase'),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: () => _onSavePressed(context, controllers),
      ),
      body: SingleChildScrollView(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          children: [
            CustomDatePicker(
              controller: controllers['ordered_at']!,
              labelText: 'Ordered At',
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
              initialDate: _expectedDeliveryAt,
              onDateSelected: (pickedDate) {
                setState(() {
                  _expectedDeliveryAt = pickedDate;
                });
              },
            ),
            const FixedSizedBox(),
            _buildVendorDropdown(),
            const FixedSizedBox(),
            _buildWarehouseDropdown(),
            const FixedSizedBox(),
            _buildLineItems(),
            const FixedSizedBox(),
            _buildPurchaseFields(controllers),
          ],
        ),
      ),
    );
  }

  Widget _buildVendorDropdown() {
    return BlocBuilder<VendorCubit, List<Vendor>>(
      builder: (context, vendors) {
        return CustomDropdownFromCubit<Vendor>(
          label: 'Vendor *',
          loadItems: () => context.read<VendorCubit>().loadVendors(),
          items: vendors,
          selectedValue: _selectedVendorId,
          getLabel: (vendor) => vendor.name ?? 'Unknown',
          getKey: (vendor) => vendor.id.toString(),
          onChanged: (selectedId) =>
              setState(() => _selectedVendorId = selectedId!),
        );
      },
    );
  }

  Widget _buildWarehouseDropdown() {
    return BlocBuilder<WarehouseCubit, List<Warehouse>>(
      builder: (context, warehouses) {
        return CustomDropdownFromCubit<Warehouse>(
          label: 'Warehouse *',
          loadItems: () => context.read<WarehouseCubit>().loadWarehouses(),
          items: warehouses,
          selectedValue: _selectedWarehouseId,
          getLabel: (warehouse) => warehouse.name ?? "N/A",
          getKey: (warehouse) => warehouse.id.toString(),
          onChanged: (selectedId) =>
              setState(() => _selectedWarehouseId = selectedId!),
        );
      },
    );
  }

  Widget _buildLineItems() {
    return Column(
      children: _lineItems.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              LineItemWidget(itemControllers: item),
              IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () => _removeLineItem(index),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPurchaseFields(Map<String, TextEditingController> controllers) {
    return Column(
      children: [
        CustomTextField(
            controller: controllers['delivery_fee']!,
            labelText: 'Delivery Fee'),
        const FixedSizedBox(),
        CustomTextField(controller: controllers['note']!, labelText: 'Note'),
        const FixedSizedBox(),
        CustomTextField(
            controller: controllers['additional_fee']!,
            labelText: 'Additional Fee'),
        const FixedSizedBox(),
        CustomTextField(controller: controllers['vat']!, labelText: 'VAT'),
        const FixedSizedBox(),
        DropdownButtonFormField<String>(
          value: _selectedStatus,
          decoration: const InputDecoration(
              labelText: 'Status', border: OutlineInputBorder()),
          items: const [
            DropdownMenuItem(value: 'draft', child: Text('Draft')),
            DropdownMenuItem(value: 'ordered', child: Text('Ordered')),
            DropdownMenuItem(value: 'received', child: Text('Received')),
            DropdownMenuItem(value: 'cancelled', child: Text('Cancelled')),
          ],
          onChanged: (value) => setState(() => _selectedStatus = value!),
        ),
      ],
    );
  }

  Map<String, TextEditingController> _initControllers() {
    return {
      'delivery_fee':
          TextEditingController(text: widget.purchase.deliveryFee.toString()),
      'note': TextEditingController(text: widget.purchase.note ?? ""),
      'expected_delivery_at': TextEditingController(
          text: DateFormat('yyyy-MM-dd').format(_expectedDeliveryAt)),
      'additional_fee':
          TextEditingController(text: widget.purchase.additionalFee.toString()),
      'ordered_at': TextEditingController(
          text: DateFormat('yyyy-MM-dd').format(_orderedAt)),
      'vat': TextEditingController(text: widget.purchase.vat.toString()),
    };
  }

  void _removeLineItem(int index) {
    setState(() {
      _lineItems.removeAt(index);
    });
  }

  void _onSavePressed(
      BuildContext context, Map<String, TextEditingController> controllers) {
    // Implement update logic
  }
}
