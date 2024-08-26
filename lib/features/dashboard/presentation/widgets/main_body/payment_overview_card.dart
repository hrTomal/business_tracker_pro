import 'package:business_tracker/features/dashboard/presentation/widgets/main_body/generic_dashboard_card.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/main_body/inner_generic_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaymentOverviewCard extends StatelessWidget {
  PaymentOverviewCard({
    super.key,
  });
  String dValue = 'all';

  @override
  Widget build(BuildContext context) {
    return GenericDashboardCard(
      title: 'Payment Overview',
      dropdown: DropdownButton<String>(
        items: const [
          DropdownMenuItem(
            value: 'all',
            child: Text('All record'),
          ),
          DropdownMenuItem(
            value: 'last_month',
            child: Text('Last month'),
          ),
        ],
        iconEnabledColor: Theme.of(context).colorScheme.primary,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        underline: const SizedBox.shrink(),
        value: dValue,
        onChanged: (value) {},
      ),
      gridItems: const [
        InnerGenericCard(
          label: 'Total Received',
          value: '0.00',
          icon: Icons.arrow_downward,
        ),
        InnerGenericCard(
          label: 'Paid',
          value: '0.00',
          icon: Icons.home,
        ),
        InnerGenericCard(
          label: 'Net Paid',
          value: '0.00',
          icon: Icons.arrow_upward,
        ),
        InnerGenericCard(
          label: 'Another Metric',
          value: '0.00',
          icon: Icons.add,
        ),
      ],
    );
  }
}
