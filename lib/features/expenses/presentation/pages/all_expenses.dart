import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/expenses/presentation/pages/add_expense.dart';
import 'package:business_tracker/features/expenses/presentation/widgets/expense_list_view_card.dart';
import 'package:flutter/material.dart';

class AllExpenses extends StatelessWidget {
  static const String routeName = 'allExpensesPage';

  const AllExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    var _itemCount = 0;
    var _floatingActionButton = FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context).pushNamed(AddExpense.routeName);
      },
      label: const Text('Add Expense'),
      icon: const Icon(Icons.add_circle_outlined),
    );
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Expenses',
      ),
      floatingActionButton: _itemCount != 0 ? _floatingActionButton : null,
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: _itemCount == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'There is no Expenses added.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const FixedSizedBox(),
                    _floatingActionButton,
                  ],
                ),
              )
            : ListView.builder(
                itemCount: _itemCount,
                itemBuilder: (context, index) {
                  return ExpenseListViewCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Expenses ${index + 1}',
                  );
                },
              ),
      ),
    );
  }
}
