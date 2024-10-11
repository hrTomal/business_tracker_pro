import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AddSale extends StatefulWidget {
  static const String routeName = 'addSalePage';
  const AddSale({super.key});

  @override
  State<AddSale> createState() => _AddSaleState();
}

class _AddSaleState extends State<AddSale> {
  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Sale'),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownSearch<int>(
                    items: const [1, 2, 3, 4, 5, 6, 7],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Expanded(
                  child: DropdownSearch<int>.multiSelection(
                    clearButtonProps: const ClearButtonProps(isVisible: true),
                    items: const [1, 2, 3, 4, 5, 6, 7],
                  ),
                )
              ],
            ),
            const FixedSizedBox(),
            DropdownSearch<String>(
              popupProps: const PopupProps.menu(
                showSearchBox: true,
              ),
              items: const [
                "Brazil",
                "Italia",
                "Tunisia",
                "Canada",
                "India",
                "Bangladesh",
              ],
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Country",
                  hintText: "Select a country",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onChanged: (value) {
                // Handle the change here
                print("Selected: $value");
              },
              selectedItem: "India",
            ),
          ],
        ),
      ),
    );
  }
}
