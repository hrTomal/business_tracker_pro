import 'package:flutter/material.dart';

class CustomButtonPrimary extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final VoidCallback onPressed;

  const CustomButtonPrimary({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
    );
  }
}
