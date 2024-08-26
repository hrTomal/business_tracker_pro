import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  String? sku;
  String? srp;
  String? wsp;
  String? purchasePrice;
  String? availableQuantity;
  String? sold;

  ProductCard({
    required this.imageUrl,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: dimensions.screenWidth * .3,
              child: AspectRatio(
                aspectRatio: 1.1,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // const SizedBox(height: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      title,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      title,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      title,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      title,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
