import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/categories/presentation/pages/add_categories.dart';
import 'package:business_tracker/features/categories/presentation/widgets/category_list_card.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatelessWidget {
  static const String routeName = 'allCategoriesPage';
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    var itemCount = 10;

    var floatingActionButton = FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context).pushNamed(AddCategories.routeName);
      },
      label: const Text('Add Category'),
      icon: const Icon(Icons.add_circle_outlined),
    );

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Categories',
      ),
      floatingActionButton: itemCount != 0 ? floatingActionButton : null,
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: itemCount == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'There is no Categories added.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const FixedSizedBox(),
                    floatingActionButton,
                  ],
                ),
              )
            : ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return CategoryListCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Product ${index + 1}',
                  );
                },
              ),
      ),
    );
  }
}
