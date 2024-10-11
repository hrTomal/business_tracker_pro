import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownSearch<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final String labelText;
  final String hintText;
  final String createNewText;
  final ValueChanged<T?>? onChanged;
  final String Function(T) itemAsString;
  final VoidCallback onCreateNew;

  const CustomDropdownSearch({
    super.key,
    required this.items,
    this.selectedItem,
    required this.labelText,
    this.hintText = 'Select or Create',
    this.createNewText = 'Create New',
    this.onChanged,
    required this.itemAsString,
    required this.onCreateNew,
  });

  @override
  _CustomDropdownSearchState<T> createState() =>
      _CustomDropdownSearchState<T>();
}

class _CustomDropdownSearchState<T> extends State<CustomDropdownSearch<T>> {
  late List<dynamic> _items; // Using dynamic to include the "Create New" option
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    // Adding a dummy item at the start of the list for the "Create New" option
    _items = ['__create_new__', ...widget.items];
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<dynamic>(
      items: _items,
      selectedItem: _selectedItem,
      dropdownBuilder: _customDropDown,
      popupProps: PopupProps.menu(
        itemBuilder: _customPopupItemBuilderWithCreateOption,
        showSearchBox: true,
      ),
      onChanged: (value) {
        if (value == '__create_new__') {
          widget.onCreateNew();
        } else {
          setState(() {
            _selectedItem = value as T?;
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          });
        }
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _customDropDown(BuildContext context, dynamic item) {
    if (item == '__create_new__') {
      return Text(widget.hintText);
    } else {
      return Text(
          item != null ? widget.itemAsString(item as T) : widget.hintText);
    }
  }

  Widget _customPopupItemBuilderWithCreateOption(
      BuildContext context, dynamic item, bool isSelected) {
    if (item == '__create_new__') {
      return ListTile(
        leading: const Icon(Icons.add),
        title: Text(widget.createNewText),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        onTap: () {
          Navigator.of(context).pop(); // Close the dropdown
          widget.onCreateNew(); // Trigger the navigation callback
        },
      );
    } else {
      return ListTile(
        title: Text(widget.itemAsString(item as T)),
      );
    }
  }
}
