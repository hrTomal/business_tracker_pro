import 'package:business_tracker/features/purchase/domain/entities/purchase_response.dart';
import 'package:business_tracker/features/purchase/presentation/pages/edit_purchases.dart';
import 'package:flutter/material.dart';

class PurchaseCard extends StatelessWidget {
  final Purchase purchase;

  const PurchaseCard({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditPurchasesPage(purchase: purchase),
          ),
        );
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order ID: ${purchase.id}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text('Vendor: ${purchase.vendorRef ?? "N/A"}'),
              Text('Status: ${purchase.status ?? "Unknown"}'),
              Text('Total Amount: ${purchase.finalAmount ?? "0.00"}'),
              Text('Ordered At: ${purchase.orderedAt ?? "N/A"}'),
            ],
          ),
        ),
      ),
    );
  }
}
