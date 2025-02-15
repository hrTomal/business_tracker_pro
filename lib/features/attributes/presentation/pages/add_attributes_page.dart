import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/attribute-types/presentation/blocs/AttributeTypeCubit.dart';
import 'package:business_tracker/features/attribute-types/presentation/pages/add_attribute_types_page.dart';
import 'package:business_tracker/features/attributes/presentation/blocs/attribute_cubit.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:business_tracker/features/attribute-types/domain/entities/AttributeTypeResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAttributesPage extends StatefulWidget {
  static const String routeName = 'addAttributesPage';

  const AddAttributesPage({super.key});

  @override
  State<AddAttributesPage> createState() => _AddAttributesPageState();
}

class _AddAttributesPageState extends State<AddAttributesPage> {
  AttributeType? selectedAttributeType;

  @override
  void initState() {
    super.initState();
    context.read<Attributetypecubit>().loadAttributeTypes();
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    final controllers = _initControllers();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add Attribute',
      ),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: BlocBuilder<Attributetypecubit, List<AttributeType>>(
          builder: (context, attributeTypes) {
            if (attributeTypes.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'There are no attribute types added. Please add some first.',
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AddAttributeTypesPage.routeName);
                    },
                    child: const Text('Go to Attribute Type Page'),
                  ),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Attribute Type',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                DropdownButton<AttributeType>(
                  isExpanded: true,
                  value: selectedAttributeType,
                  hint: const Text('Choose an Attribute Type'),
                  onChanged: (AttributeType? value) {
                    setState(() {
                      selectedAttributeType = value;
                    });
                  },
                  items: attributeTypes
                      .map((type) => DropdownMenuItem<AttributeType>(
                            value: type,
                            child: Text(type.name ?? 'N/A'),
                          ))
                      .toList(),
                ),
                const FixedSizedBox(),
                CustomTextField(
                  controller: controllers['name']!,
                  labelText: 'Name',
                ),
                const FixedSizedBox(),
              ],
            );
          },
        ),
      ),
      floatingActionButton:
          BlocBuilder<Attributetypecubit, List<AttributeType>>(
        builder: (context, attributeTypes) {
          if (attributeTypes.isEmpty) {
            return const SizedBox.shrink();
          }
          return CustomSaveFloatingActionButton(
            onPressed: () => _onSavePressed(context, controllers),
          );
        },
      ),
    );
  }

  Map<String, TextEditingController> _initControllers() {
    return {
      'name': TextEditingController(),
    };
  }

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

    if (selectedAttributeType == null) {
      errors.add('Attribute Type is required.');
    }

    if (errors.isNotEmpty) {
      showErrorSnackbar(context: context, errors: errors);
    } else {
      final name = controllers['name']!.text;
      final attributeCubit = context.read<AttributeCubit>();

      attributeCubit
          .addAttribute(name, selectedAttributeType?.id.toString() ?? '0')
          .then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Attribute added successfully!')),
        );
        Navigator.of(context).pop(true);
      }).catchError((error) {
        showErrorSnackbar(
          context: context,
          errors: [error.toString()],
        );
      });
    }
  }
}
