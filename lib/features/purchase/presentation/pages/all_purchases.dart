import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/purchase/domain/entities/purchase_response.dart';
import 'package:business_tracker/features/purchase/presentation/blocs/purchase_cubit.dart';
import 'package:business_tracker/features/purchase/presentation/pages/add_purchases.dart';
import 'package:business_tracker/features/purchase/presentation/widgets/purchase_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPurchases extends StatelessWidget {
  static const String routeName = 'allPurchasesPage';

  const AllPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    // var dimensions = AppDimensions(context);

    var floatingActionButton = FloatingActionButton.extended(
      onPressed: () async {
        var result =
            await Navigator.of(context).pushNamed(AddPurchasesPage.routeName);

        if (result == true) {
          context.read<PurchaseCubit>().loadPurchases();
        }
      },
      label: const Text('Add Purschase Order'),
      icon: const Icon(Icons.add_circle_outlined),
    );

    return Scaffold(
      appBar: const CustomAppBar(title: 'All Purchases'),
      floatingActionButton: floatingActionButton,
      body: BlocBuilder<PurchaseCubit, List<Purchase>>(
        builder: (context, purchases) {
          if (purchases.isEmpty) {
            return const Center(child: Text('No purchases found'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: purchases.length,
            itemBuilder: (context, index) {
              return PurchaseCard(purchase: purchases[index]);
            },
          );
        },
      ),
    );
  }
}
