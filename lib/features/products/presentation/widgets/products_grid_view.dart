import 'package:business_tracker/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var _itemCount = 10;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(pageWidth),
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        childAspectRatio: 0.64,
      ),
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        return ProductCard(
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Product ${index + 1}',
        );
      },
    );
  }

  // Determine the number of columns based on the screen width
  int _getCrossAxisCount(double width) {
    if (width > 1200) {
      return 5; // Large screen
    } else if (width > 800) {
      return 4; // Medium screen
    } else if (width > 499) {
      return 3; // Small screen
    } else {
      return 2; // Very small screen
    }
  }
}
