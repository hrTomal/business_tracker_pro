import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomRadioButtonRow<T> extends StatelessWidget {
  final List<T> options;
  final T groupValue;
  final void Function(T?) onChanged;
  final double? width;
  final double? height;

  const CustomRadioButtonRow({
    super.key,
    required this.options,
    required this.groupValue,
    required this.onChanged,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(
        10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.all(
          dimensions.globalCornerRadius,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: options.map((T option) {
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(option),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<T>(
                    value: option,
                    groupValue: groupValue,
                    onChanged: onChanged,
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Flexible(
                    child: FittedBox(
                      child: Text(option.toString()),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
