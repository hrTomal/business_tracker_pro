import 'package:business_tracker/features/products/domain/entities/ProductsResponse.dart';
import 'package:business_tracker/features/products/presentation/widgets/product_card_list_view.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  final List<ProductInfo> products;

  const ProductListView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text('No products available'));
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCardListView(
          imageUrl: 'https://placehold.co/600x400/png',
          title: product.name ?? 'Unnamed Product',
        );
      },
    );
  }
}
