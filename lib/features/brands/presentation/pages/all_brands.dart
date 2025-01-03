import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/service_locator.dart';
import 'package:business_tracker/features/brands/domain/entities/Brand.dart';
import 'package:business_tracker/features/brands/domain/repositories/BrandRepository.dart';
import 'package:business_tracker/features/brands/presentation/blocs/brands_cubit.dart';
import 'package:business_tracker/features/brands/presentation/pages/add_brands.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomCards/generic_name_delete_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return BlocProvider(
      create: (_) => BrandsCubit(getIt<Brandrepository>())..loadBrands(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Brands',
        ),
        floatingActionButton: floatingActionButton,
        body: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: BlocBuilder<BrandsCubit, List<Brand>>(
            builder: (context, brands) {
              if (brands.isEmpty) {
                return const Center(
                  child: Text(
                    'No Brands Available',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }

              return NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    context.read<BrandsCubit>().loadBrands();
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    final brand = brands[index];
                    return GenericNameDeleteCard(
                      name: brand.name ?? 'Unknown',
                      onDelete: () {
                        // TODO: Add delete logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Deleted ${brand.name ?? 'Unknown'}'),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
