import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomDropdownFromCubit/custom_dropdown_from_cubit.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/products/domain/entities/ProductsResponse.dart';
import 'package:business_tracker/features/products/presentation/blocs/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LineItemWidget extends StatelessWidget {
  final Map<String, TextEditingController> itemControllers;

  const LineItemWidget({super.key, required this.itemControllers});

  @override
  Widget build(BuildContext context) {
    var dimension = AppDimensions(context);
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProductsCubit, List<ProductInfo>>(
              builder: (context, products) {
                if (products.isEmpty) {
                  context.read<ProductsCubit>().loadProducts();
                  return const CircularProgressIndicator();
                }

                return CustomDropdownFromCubit<ProductInfo>(
                  label: 'Product',
                  loadItems: context.read<ProductsCubit>().loadProducts,
                  items: products,
                  getLabel: (product) =>
                      product.name ??
                      'No Name', // Modify this as per your ProductInfo model
                  getKey: (product) => product.id
                      .toString(), // Assuming id is a string or can be converted to string
                  onChanged: (selectedProductId) {
                    if (selectedProductId != null) {
                      // Find the selected product based on the selected id
                      final selectedProduct = products.firstWhere(
                        (product) => product.id.toString() == selectedProductId,
                        orElse: () => products.first, // Fallback
                      );
                      itemControllers['product']?.text =
                          selectedProduct.id.toString();
                    }
                  },
                  selectedValue: itemControllers['product']?.text,
                );
              },
            ),
            const FixedSizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: itemControllers['quantity']!,
                  labelText: 'Quantity',
                  hintText: 'Enter quantity',
                  width: dimension.halfTextFieldWidth - 20,
                ),
                const VerticalDivider(),
                CustomTextField(
                  controller: itemControllers['unit_price']!,
                  labelText: 'Unit Price',
                  hintText: 'Enter unit price',
                  width: dimension.halfTextFieldWidth - 20,
                ),
              ],
            ),
            const FixedSizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: itemControllers['vat']!,
                  labelText: 'VAT',
                  hintText: 'Enter VAT',
                  width: dimension.halfTextFieldWidth - 20,
                ),
                const VerticalDivider(),
                CustomTextField(
                  controller: itemControllers['discount']!,
                  labelText: 'Discount',
                  hintText: 'Enter discount',
                  width: dimension.halfTextFieldWidth - 20,
                ),
              ],
            ),
            const FixedSizedBox(),
          ],
        ),
      ),
    );
  }
}
