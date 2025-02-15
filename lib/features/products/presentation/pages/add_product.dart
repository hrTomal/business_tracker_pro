import 'package:business_tracker/features/attribute-types/domain/entities/AttributeTypeResponse.dart';
import 'package:business_tracker/features/attribute-types/presentation/blocs/AttributeTypeCubit.dart';
import 'package:business_tracker/features/categories/domain/entities/CategoryResponse.dart';
import 'package:business_tracker/features/categories/presentation/blocs/category_cubit.dart';
import 'package:business_tracker/features/categories/presentation/blocs/category_state.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomDropdownFromCubit/custom_dropdown_from_cubit.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/products/data/repository/ProductRepository.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProduct extends StatefulWidget {
  static const String routeName = 'addProduct';
  final Productrepository productRepository = GetIt.I<Productrepository>();

  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _retailPriceTextController =
      TextEditingController(text: '0');
  final TextEditingController _wholesalePriceTextController =
      TextEditingController(text: '0');
  final TextEditingController _costTextController =
      TextEditingController(text: '0');
  final TextEditingController _additionalIdentifierTextController =
      TextEditingController();
  final TextEditingController _skuTextController = TextEditingController();

  String? selectedCompanyId;

  @override
  void initState() {
    super.initState();
    _loadSelectedCompanyId();
  }

  Future<void> _loadSelectedCompanyId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCompanyId = prefs.getString('selectedCompanyId');
    });
  }

  void _onSave() async {
    final product = {
      'name': _nameController.text,
      'description': _descriptionController.text,
      'retailPrice': _retailPriceTextController.text,
      'wholesalePrice': _wholesalePriceTextController.text,
      'additionalIdentifier': _additionalIdentifierTextController.text,
      'companyId': selectedCompanyId,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Product'),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: _onSave,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Company ID: ${selectedCompanyId ?? 'Not Selected'}'),
              const FixedSizedBox(),
              CustomTextField(controller: _nameController, labelText: 'Name'),
              const FixedSizedBox(),
              CustomTextField(
                  controller: _descriptionController, labelText: 'Description'),
              const FixedSizedBox(),
              CustomTextField(
                controller: _costTextController,
                labelText: 'Cost',
                isNumberOnly: true,
              ),
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
                  const SizedBox(width: 16),
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
                controller: _skuTextController,
                labelText: 'SKU',
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: _additionalIdentifierTextController,
                labelText: 'Additional Identifier',
              ),
              const FixedSizedBox(),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  List<CategoryInformation> categories = [];
                  if (state is CategoryLoaded) {
                    categories = state.categories;
                  }
                  return CustomDropdownFromCubit<CategoryInformation>(
                    label: 'Category',
                    loadItems: () =>
                        context.read<CategoryCubit>().fetchCategories(),
                    items: categories,
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
              BlocBuilder<Attributetypecubit, List<AttributeType>>(
                builder: (context, state) {
                  return CustomDropdownFromCubit<AttributeType>(
                    label: 'Attribute Type',
                    loadItems: () =>
                        context.read<Attributetypecubit>().loadAttributeTypes(),
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
            ],
          ),
        ),
      ),
    );
  }
}
