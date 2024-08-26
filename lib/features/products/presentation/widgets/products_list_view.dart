import 'package:business_tracker/features/products/presentation/widgets/product_card_list_view.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ProductCardListView(
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Product ${index + 1}',
        );
      },
    );
  }
}
