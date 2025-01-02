import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/brands/presentation/pages/add_brands.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AllBrandsPage extends StatelessWidget {
  static const String routeName = 'allBrandsPage';
  const AllBrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);

    var floatingActionButton = FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context).pushNamed(AddBrandsPage.routeName);
      },
      label: const Text('Add Brand'),
      icon: const Icon(Icons.add_circle_outlined),
    );

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Brands',
      ),
      floatingActionButton: floatingActionButton,
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Brand ${index + 1}'),
            );
          },
        ),
      ),
    );
  }
}
