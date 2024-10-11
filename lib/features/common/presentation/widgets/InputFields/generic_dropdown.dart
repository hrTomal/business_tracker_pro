import 'package:flutter/material.dart';

class GenericDropdownButton<T> extends StatefulWidget {
  final List<T> items;
  final T value;
  final void Function(T?) onChanged;
  final double? width;
  final double? height;
  final String? hint;

  const GenericDropdownButton({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.width,
    this.height,
    this.hint,
  });

  @override
  State<GenericDropdownButton<T>> createState() =>
      _GenericDropdownButtonState<T>();
}

class _GenericDropdownButtonState<T> extends State<GenericDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     width: 2,
      //     color: theme.colorScheme.primary,
      //   ),
      //   borderRadius: BorderRadius.circular(5),
      // ),
      child: DropdownButton<T>(
        underline: Container(
          height: 2,
          color: theme.colorScheme.primary,
        ),
        value: widget.value,
        onChanged: widget.onChanged,
        hint: widget.hint != null ? Text(widget.hint!) : null,
        items: widget.items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString()),
          );
        }).toList(),
      ),
    );
  }
}
