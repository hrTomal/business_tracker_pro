import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ExpenseTypes extends StatelessWidget {
  static const String routeName = 'expenseTypesPage';
  const ExpenseTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Expense Types',
      ),
    );
  }
}
