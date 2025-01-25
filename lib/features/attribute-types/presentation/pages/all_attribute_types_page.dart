import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/service_locator.dart';
import 'package:business_tracker/features/attribute-types/data/repository/AttributeTypeRepository.dart';
import 'package:business_tracker/features/attribute-types/domain/entities/AttributeTypeResponse.dart';
import 'package:business_tracker/features/attribute-types/presentation/blocs/AttributeTypeCubit.dart';
import 'package:business_tracker/features/attribute-types/presentation/pages/add_attribute_types_page.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomCards/generic_name_delete_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAttributeTypesPage extends StatelessWidget {
  static const String routeName = 'allAttributeTypesPage';

  const AllAttributeTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);

    var floatingActionButton = FloatingActionButton.extended(
      onPressed: () async {
        var result = await Navigator.of(context)
            .pushNamed(AddAttributeTypesPage.routeName);

        if (result == true) {
          context.read<Attributetypecubit>().loadAttributeTypes();
        }
      },
      label: const Text('Add Attribute Types'),
      icon: const Icon(Icons.add_circle_outlined),
    );

    return BlocProvider(
      create: (_) => Attributetypecubit(getIt<AttributeTypeRepository>())
        ..loadAttributeTypes(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Attribute Types',
        ),
        floatingActionButton: floatingActionButton,
        body: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: BlocBuilder<Attributetypecubit, List<AttributeType>>(
            builder: (context, types) {
              if (types.isEmpty) {
                return const Center(
                  child: Text(
                    'No Attribute types Available',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }

              return NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    context.read<Attributetypecubit>().loadAttributeTypes();
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount: types.length,
                  itemBuilder: (context, index) {
                    final brand = types[index];
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
