import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/generic_dropdown.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  static const String routeName = 'addProduct';
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _titleController = TextEditingController();
  var _dropdownValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Product'),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _titleController,
              labelText: 'Title',
            ),
            const FixedSizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                  controller: _titleController,
                  labelText: 'Title',
                  width: dimensions.halfTextFieldWidth,
                  isNumberOnly: true,
                ),
                CustomTextField(
                  controller: _titleController,
                  labelText: 'Title',
                  width: dimensions.halfTextFieldWidth,
                ),
              ],
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: _titleController,
              labelText: 'Title',
            ),
            const FixedSizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                  controller: _titleController,
                  labelText: 'Title',
                  width: dimensions.halfTextFieldWidth,
                ),
                CustomTextField(
                  controller: _titleController,
                  labelText: 'Title',
                  width: dimensions.halfTextFieldWidth,
                ),
              ],
            ),
            GenericDropdownButton<String>(
              items: const ['Option 1', 'Option 2', 'Option 3'],
              value: _dropdownValue,
              onChanged: (value) {
                setState(() {
                  _dropdownValue = value!;
                });
              },
              hint: 'Select an option',
            ),
          ],
        ),
      ),
    );
  }
}
