import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_add_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/vendor/presentation/pages/add_vendors.dart';
import 'package:business_tracker/features/vendor/presentation/widgets/vendor_list_view_card.dart';
import 'package:flutter/material.dart';

class AllVendorsPage extends StatelessWidget {
  static const String routeName = 'allVendorsPage';
  const AllVendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    var _vendorCount = 0;

    var _floatingActionButton = FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context).pushNamed(AddVendorPage.routeName);
      },
      label: const Text('Add Vendor'),
      icon: const Icon(Icons.add_circle_outlined),
    );

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'All Vendors',
      ),
      floatingActionButton: _vendorCount != 0 ? _floatingActionButton : null,
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: _vendorCount == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'There is no Vendors added.',
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
                itemCount: _vendorCount,
                itemBuilder: (context, index) {
                  return VendorListViewCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Vendor ${index + 1}',
                  );
                },
              ),
      ),
    );
  }
}
