import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_add_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/products/domain/entities/ProductsResponse.dart';
import 'package:business_tracker/features/products/presentation/blocs/products_cubit.dart';
import 'package:business_tracker/features/products/presentation/pages/add_product.dart';
import 'package:business_tracker/features/products/presentation/widgets/products_grid_view.dart';
import 'package:business_tracker/features/products/presentation/widgets/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProducts extends StatefulWidget {
  static const String routeName = 'all_products_page';

  const AllProducts({super.key});

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  bool _isGridView = true;

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);

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
      floatingActionButton: const _AddProductButton(),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          children: [
            const FixedSizedBox(),
            Expanded(
              child: BlocBuilder<ProductsCubit, List<ProductInfo>>(
                builder: (context, products) {
                  if (products.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No Products Found!',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const FixedSizedBox(),
                          const _AddProductButton(),
                        ],
                      ),
                    );
                  }

                  return _isGridView
                      ? ProductsGridView(products: products)
                      : ProductListView(products: products);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddProductButton extends StatelessWidget {
  const _AddProductButton();

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
