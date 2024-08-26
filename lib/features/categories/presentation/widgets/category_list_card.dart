import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryListCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  String? description;

  CategoryListCard(
      {super.key, required this.imageUrl, required this.title, description});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: dimensions.screenWidth * .2,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
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
