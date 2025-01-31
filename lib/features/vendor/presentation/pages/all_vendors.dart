import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/service_locator.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomCards/generic_name_delete_card.dart';
import 'package:business_tracker/features/vendor/data/repository/vendor_repository.dart';
import 'package:business_tracker/features/vendor/domain/entities/vendors_response.dart';
import 'package:business_tracker/features/vendor/presentation/blocs/vendors_cubit.dart';
import 'package:business_tracker/features/vendor/presentation/pages/add_vendors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllVendorsPage extends StatelessWidget {
  static const String routeName = 'allVendorsPage';
  const AllVendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    // var vendorCount = 0;

    var floatingActionButton = FloatingActionButton.extended(
      onPressed: () async {
        var result =
            await Navigator.of(context).pushNamed(AddVendorPage.routeName);
        if (result == true) {
          context.read<VendorCubit>().loadVendors();
        }
      },
      label: const Text('Add Vendor'),
      icon: const Icon(Icons.add_circle_outlined),
    );

    return BlocProvider(
      create: (_) => VendorCubit(getIt<VendorRepository>())..loadVendors(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'All Vendors',
        ),
        floatingActionButton: floatingActionButton,
        body: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: BlocBuilder<VendorCubit, List<Vendor>>(
              builder: (context, vendors) {
            if (vendors.isEmpty) {
              return const Center(
                child: Text(
                  'No vendors Available',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            return NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  context.read<VendorCubit>().loadVendors();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: vendors.length,
                itemBuilder: (context, index) {
                  final vendor = vendors[index];
                  return GenericNameDeleteCard(
                    name: vendor.name ?? 'Unknown',
                    onDelete: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Deleted ${vendor.name ?? 'Unknown'}'),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }),
        ),
      ),
    );

    // Scaffold(
    //   appBar: const CustomAppBar(
    //     title: 'All Vendors',
    //   ),
    //   floatingActionButton: vendorCount != 0 ? floatingActionButton : null,
    //   body: Padding(
    //     padding: dimensions.pagePaddingGlobal,
    //     child: vendorCount == 0
    //         ? Center(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 const Text(
    //                   'There is no Vendors added.',
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 const FixedSizedBox(),
    //                 floatingActionButton,
    //               ],
    //             ),
    //           )
    //         : ListView.builder(
    //             itemCount: vendorCount,
    //             itemBuilder: (context, index) {
    //               return VendorListViewCard(
    //                 imageUrl: 'https://via.placeholder.com/150',
    //                 title: 'Vendor ${index + 1}',
    //               );
    //             },
    //           ),
    //   ),
    // );
  }
}
