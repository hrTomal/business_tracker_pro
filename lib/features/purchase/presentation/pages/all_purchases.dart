import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/purchase/presentation/pages/add_purchases.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllPurchases extends StatelessWidget {
  static const String routeName = 'allPurchasesPage';

  const AllPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);

    var floatingActionButton = FloatingActionButton.extended(
      onPressed: () async {
        await Navigator.of(context).pushNamed(AddPurchasesPage.routeName);

        // if (result == true) {
        //   context.read<Attributetypecubit>().loadAttributeTypes();
        // }
      },
      label: const Text('Add Purschase Order'),
      icon: const Icon(Icons.add_circle_outlined),
    );

    return Scaffold(
      appBar: const CustomAppBar(title: 'All Purchases'),
      floatingActionButton: floatingActionButton,
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: const Center(
          child: Text('Purchases'),
        ),
      ),
    );
  }
}
