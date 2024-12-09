import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:business_tracker/features/products/domain/repositories/ProductRepository.dart';
import 'package:get_it/get_it.dart';

class AddProduct extends StatefulWidget {
  static const String routeName = 'addProduct';
  final ProductRepository productRepository = GetIt.I<ProductRepository>();

  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _retailPriceTextController =
      TextEditingController();
  final TextEditingController _wholesalePriceTextController =
      TextEditingController();
  final TextEditingController _additionalIdentifierTextController =
      TextEditingController();

  void _onSave() async {
    final product = {
      'name': _nameController.text,
      'description': _descriptionController.text,
      'retailPrice': _retailPriceTextController.text,
      'wholesalePrice': _wholesalePriceTextController.text,
      'additionalIdentifier': _additionalIdentifierTextController.text,
    };

    try {
      await widget.productRepository.createProduct(product);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product created successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to create product')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Product'),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: _onSave,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: _nameController, labelText: 'Name'),
            const FixedSizedBox(),
            CustomTextField(
                controller: _descriptionController, labelText: 'Description'),
            const FixedSizedBox(),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _wholesalePriceTextController,
                    labelText: 'Wholesale Price',
                    isNumberOnly: true,
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: CustomTextField(
                    controller: _retailPriceTextController,
                    labelText: 'Retail Price',
                    isNumberOnly: true,
                  ),
                ),
              ],
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: _additionalIdentifierTextController,
              labelText: 'Additional Identifier',
            ),
          ],
        ),
      ),
    );
  }
}
