import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/service_locator.dart';
import 'package:business_tracker/features/attributes/data/repository/attribute_repository.dart';
import 'package:business_tracker/features/attributes/domain/entities/attribute_response.dart';
import 'package:business_tracker/features/attributes/presentation/blocs/attribute_cubit.dart';
import 'package:business_tracker/features/attributes/presentation/pages/add_attributes_page.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomCards/generic_name_delete_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAttributesPage extends StatelessWidget {
  static const String routeName = 'allAttributesPage';

  const AllAttributesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);

    return BlocProvider(
      create: (_) =>
          AttributeCubit(getIt<AttributeRepository>())..loadAttributes(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Attributes',
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            var result = await Navigator.of(context)
                .pushNamed(AddAttributesPage.routeName);

            if (result == true) {
              context.read<AttributeCubit>().loadAttributes();
            }
          },
          label: const Text('Add Attribute'),
          icon: const Icon(Icons.add_circle_outlined),
        ),
        body: _AttributesList(dimensions: dimensions),
      ),
    );
  }
}

class _AttributesList extends StatelessWidget {
  final AppDimensions dimensions;

  const _AttributesList({required this.dimensions});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttributeCubit, List<Attribute>>(
      builder: (context, attributes) {
        if (attributes.isEmpty) {
          return const Center(
            child: Text('No attributes available.'),
          );
        }

        return Padding(
          padding: dimensions.pagePaddingGlobal,
          child: ListView.builder(
            itemCount: attributes.length,
            itemBuilder: (context, index) {
              final attribute = attributes[index];
              return GenericNameDeleteCard(
                name: attribute.name ?? "not set",
                onDelete: () {
                  // Implement delete logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Deleted ${attribute.name}'),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
