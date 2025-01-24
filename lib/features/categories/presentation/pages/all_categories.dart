import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/categories/domain/entities/CategoryResponse.dart';
import 'package:business_tracker/features/categories/domain/repositories/CategoryRepository.dart';
import 'package:business_tracker/features/categories/presentation/blocs/category_cubit.dart';
import 'package:business_tracker/features/categories/presentation/blocs/category_state.dart';
import 'package:business_tracker/features/categories/presentation/pages/add_categories.dart';
import 'package:business_tracker/features/categories/presentation/widgets/category_list_card.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart'; // Import GetIt

class AllCategories extends StatelessWidget {
  static const String routeName = 'allCategoriesPage';

  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);

    return BlocProvider(
      create: (context) => CategoryCubit(
        categoryRepository: GetIt.instance<
            CategoryRepository>(), // Use GetIt to get CategoryRepository
      )..fetchCategories(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Categories',
        ),
        floatingActionButton: _buildFloatingActionButton(context),
        body: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoaded && state.categories.isNotEmpty) {
          return FloatingActionButton.extended(
            onPressed: () async {
              // Navigate to AddCategories and wait for the result
              final result = await Navigator.of(context).pushNamed(
                AddCategories.routeName,
              );
              // Reload categories if a new one was added
              if (result == true) {
                context.read<CategoryCubit>().fetchCategories();
              }
            },
            label: const Text('Add Category'),
            icon: const Icon(Icons.add_circle_outlined),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildBody() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryLoaded) {
          return state.categories.isEmpty
              ? _buildEmptyCategoriesView(context)
              : _buildCategoryListView(state.categories);
        } else if (state is CategoryError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text('Unexpected state'));
      },
    );
  }

  Widget _buildEmptyCategoriesView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'There are no categories added.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const FixedSizedBox(),
          FloatingActionButton.extended(
            onPressed: () =>
                Navigator.of(context).pushNamed(AddCategories.routeName),
            label: const Text('Add Category'),
            icon: const Icon(Icons.add_circle_outlined),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryListView(List<CategoryInformation> categories) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryListCard(
          imageUrl: 'https://placehold.co/600x400',
          title: category.name ?? 'N/A',
        );
      },
    );
  }
}
