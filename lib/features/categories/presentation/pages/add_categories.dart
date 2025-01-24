import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/categories/presentation/blocs/category_state.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:business_tracker/features/categories/presentation/blocs/category_cubit.dart';

class AddCategories extends StatefulWidget {
  static const String routeName = 'addCategoriesPage';
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  String? selectedCompanyId;

  @override
  void initState() {
    super.initState();
    _loadSelectedCompanyId();
  }

  Future<void> _loadSelectedCompanyId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCompanyId = prefs.getString('selectedCompanyId');
    });
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    final controllers = _initControllers();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Categories',
      ),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: () => _onSavePressed(context, controllers),
      ),
      body: BlocListener<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategoryAdded) {
            // Show success snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Category saved successfully!')),
            );
            // Navigate back and reload
            Navigator.of(context).pop(true);
          } else if (state is CategoryError) {
            // Show error snackbar
            showErrorSnackbar(context: context, errors: [state.message]);
          }
        },
        child: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FixedSizedBox(),
              CustomTextField(
                controller: controllers['name']!,
                labelText: 'Name',
              ),
              const FixedSizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  // Initialize TextEditingControllers
  Map<String, TextEditingController> _initControllers() {
    return {
      'name': TextEditingController(),
    };
  }

  // Handle save button press
  void _onSavePressed(
      BuildContext context, Map<String, TextEditingController> controllers) {
    final errors = ValidationUtils.validateTextFields(
      [
        {
          'controller': controllers['name']!,
          'errorMessage': 'Name is required',
        },
      ],
    );

    if (errors.isNotEmpty) {
      showErrorSnackbar(context: context, errors: errors);
    } else {
      if (selectedCompanyId != null) {
        // Call the CategoryCubit to add a new category
        context.read<CategoryCubit>().addCategory(
              controllers['name']!.text,
              selectedCompanyId!,
            );
      } else {
        // Handle case where company ID is not selected
        showErrorSnackbar(context: context, errors: ['Company ID is required']);
      }
    }
  }
}
