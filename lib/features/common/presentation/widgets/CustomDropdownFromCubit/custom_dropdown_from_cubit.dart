import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownFromCubit<T> extends StatefulWidget {
  final String label;
  final Future<void> Function() loadItems;
  final List<T> items;
  final String Function(T) getLabel;
  final String Function(T) getKey;
  final Function(String?) onChanged;
  final String? selectedValue;

  const CustomDropdownFromCubit({
    super.key,
    required this.label,
    required this.loadItems,
    required this.items,
    required this.getLabel,
    required this.getKey,
    required this.onChanged,
    this.selectedValue,
  });

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdownFromCubit<T>> {
  @override
  void initState() {
    super.initState();
    widget.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(
        showSearchBox: true,
      ),
      items: widget.items.map(widget.getKey).toList(),
      selectedItem: widget.selectedValue,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
        ),
      ),
      onChanged: widget.onChanged,
      dropdownBuilder: (context, selectedItem) {
        final selected = widget.items.isNotEmpty
            ? widget.items.firstWhere(
                (item) => widget.getKey(item) == selectedItem,
                orElse: () => widget.items.first, // Ensure fallback exists
              )
            : null;

        return Text(
          selected != null ? widget.getLabel(selected) : "Select an option",
        );
      },
      itemAsString: (key) {
        if (widget.items.isEmpty) return "";
        final item = widget.items.firstWhere(
          (element) => widget.getKey(element) == key,
          orElse: () => widget.items.first, // Ensure a fallback
        );
        return widget.getLabel(item);
      },
    );
  }
}
