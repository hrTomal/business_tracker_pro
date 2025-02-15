import 'package:business_tracker/features/products/domain/entities/ProductsResponse.dart';
import 'package:business_tracker/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductInfo> products;

  const ProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(pageWidth),
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        childAspectRatio: 1.2,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          imageUrl: 'https://placehold.co/600x400/png',
          title: product.name ?? 'Unnamed Product',
        );
      },
    );
  }

  int _getCrossAxisCount(double width) {
    if (width > 1200) return 5;
    if (width > 800) return 4;
    if (width > 499) return 3;
    return 2;
  }
}
