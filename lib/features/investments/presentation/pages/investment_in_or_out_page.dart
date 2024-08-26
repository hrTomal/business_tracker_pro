import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/categories/presentation/pages/add_categories.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomRadioButton/custom_radio_button_row.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/dropdown/custom_dropdown_search.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvestmentInOrOutPage extends StatefulWidget {
  static const String routeName = 'investmentInOutPage';
  const InvestmentInOrOutPage({super.key});

  @override
  State<InvestmentInOrOutPage> createState() => _InvestmentInOrOutPageState();
}

class _InvestmentInOrOutPageState extends State<InvestmentInOrOutPage> {
  var _investmentType = 'Withdraw';
  var _paymentMethod = 'Cash';
  DateTime _selectedDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final textFieldControllers = _initTextFieldControllers();

    var dimensions = AppDimensions(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Deposit or Withdraw investment',
      ),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: () => _onSavePressed(context, textFieldControllers),
      ),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      width: 1, color: Theme.of(context).colorScheme.primary),
                ),
                child: Column(
                  children: [
                    Text(
                      'Date & Time',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Divider(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          DateFormat('yyyy-MM-dd – hh:mm a')
                              .format(_selectedDateTime),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton.icon(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: _selectedDateTime,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(_selectedDateTime),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  _selectedDateTime = DateTime(
                                    pickedDate.year,
                                    pickedDate.month,
                                    pickedDate.day,
                                    pickedTime.hour,
                                    pickedTime.minute,
                                  );
                                });
                              }
                            }
                          },
                          label: const Text('Change'),
                          icon: Icon(Icons.date_range_outlined),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const FixedSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Investment Type ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomRadioButtonRow<String>(
                      options: const ['Withdraw', 'Deposit'],
                      groupValue: _investmentType,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          _investmentType = value!;
                        });
                      },
                      width: dimensions.screenWidth * .6,
                    ),
                  ),
                ],
              ),
              const FixedSizedBox(),
              CustomDropdownSearch(
                items: [
                  'Option 1',
                  'Option 2',
                  'Option 3',
                  'Option 4',
                  'Option 5',
                  'Option 6'
                ],
                labelText: 'Select Investor',
                createNewText: 'Create new Investor',
                onChanged: (value) {
                  print('Selected: $value');
                },
                itemAsString: (item) => item,
                onCreateNew: () {
                  Navigator.of(context).pushNamed(AddCategories.routeName);
                },
              ),
              const FixedSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Payment Method',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomRadioButtonRow<String>(
                      options: const ['Cash', 'Bank'],
                      groupValue: _paymentMethod,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          _paymentMethod = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: textFieldControllers['amount']!,
                labelText: 'Amount',
                isNumberOnly: true,
              ),
              const FixedSizedBox(),
              CustomTextField(
                controller: textFieldControllers['remarks']!,
                labelText: 'Remarks',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Initialize TextEditingControllers
  Map<String, TextEditingController> _initTextFieldControllers() {
    return {
      'amount': TextEditingController(),
      'remarks': TextEditingController(),
    };
  }

  void _onSavePressed(
      BuildContext context, Map<String, TextEditingController> controllers) {
    final errors = ValidationUtils.validateTextFields(
      [
        {
          'controller': controllers['amount']!,
          'errorMessage': 'Amount is required',
        },
      ],
    );

    if (errors.isNotEmpty) {
      showErrorSnackbar(context: context, errors: errors);
    } else {
      // Handle successful save logic here
    }
  }
}
