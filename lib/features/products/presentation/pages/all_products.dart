import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomRadioButton/custom_radio_button_row.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_add_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/products/presentation/pages/add_product.dart';
import 'package:business_tracker/features/products/presentation/widgets/filter_bottom_sheet.dart';
import 'package:business_tracker/features/products/presentation/widgets/products_grid_view.dart';
import 'package:business_tracker/features/products/presentation/widgets/products_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AllProducts extends StatefulWidget {
  static const String routeName = 'all_products_page';

  const AllProducts({super.key});

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  bool _isGridView = true;
  var radioValue = 'Product';

  void _showModalBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    var productCount = 10;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Products',
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      floatingActionButton: productCount < 1 ? null : const _addProductButton(),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          children: [
            // Row added below the AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showModalBottomSheet(context);
                  },
                  child: const Text('Filter'),
                ),
                const VerticalDivider(
                  thickness: 1,
                ),
                CustomRadioButtonRow<String>(
                  options: const ['Product', 'Service', 'Recipe'],
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      radioValue = value!;
                    });
                  },
                  width: dimensions.screenWidth * 0.60,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     // Action for the button
                //   },
                //   child: const Text('Button'),
                // ),
              ],
            ),
            const FixedSizedBox(),
            productCount > 0
                ? Expanded(
                    child: _isGridView
                        ? const ProductsGridView()
                        : const ProductListView(),
                  )
                : Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'No Products Found!',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const FixedSizedBox(),
                          const _addProductButton(),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class _addProductButton extends StatelessWidget {
  const _addProductButton();

  @override
  Widget build(BuildContext context) {
    return CustomAddFloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AddProduct.routeName);
      },
      title: 'Add Product',
    );
  }
}
