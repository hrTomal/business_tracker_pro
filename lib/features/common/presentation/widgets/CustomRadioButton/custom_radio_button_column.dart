import 'package:flutter/material.dart';

class CustomRadioButtonColumn<T> extends StatelessWidget {
  final List<T> options;
  final T groupValue;
  final void Function(T?) onChanged;
  final double? width;
  final double? height;

  const CustomRadioButtonColumn({
    super.key,
    required this.options,
    required this.groupValue,
    required this.onChanged,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Removes padding between items
        children: options.map((T option) {
          return RadioListTile<T>(
            title: FittedBox(
                child: Text(
              option.toString(),
            )),
            value: option,
            groupValue: groupValue,
            onChanged: onChanged,
            contentPadding:
                EdgeInsets.zero, // Removes padding around the title and button
            dense: true, // Makes the list tile compact
            visualDensity:
                VisualDensity.compact, // Further reduces space around the items
          );
        }).toList(),
      ),
    );
  }
}
