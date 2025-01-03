import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/attribute-types/presentation/pages/add_attribute_types_page.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomCards/generic_name_delete_card.dart';
import 'package:flutter/material.dart';

class AllAttributeTypesPage extends StatelessWidget {
  static const String routeName = 'allAttributeTypesPage';

  const AllAttributeTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);

    var floatingActionButton = FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context).pushNamed(AddAttributeTypesPage.routeName);
      },
      label: const Text('Add Brand'),
      icon: const Icon(Icons.add_circle_outlined),
    );
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Attribute Types',
      ),
      floatingActionButton: floatingActionButton,
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GenericNameDeleteCard(
              name: 'Attribute Type ${index + 1}',
              onDelete: () {
                // Add your delete logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Deleted Attribute Type ${index + 1}')),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
