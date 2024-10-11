import 'package:flutter/material.dart';

class CustomSaveFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomSaveFloatingActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      icon: const Icon(
        Icons.save,
        //color: Theme.of(context).colorScheme.inverseSurface,
      ),
      label: const Text(
        'Save',
        style: TextStyle(
          //color: Theme.of(context).colorScheme.inverseSurface,
          fontWeight: FontWeight.bold,
          // fontSize: 18,
        ),
      ),
      //backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
    );
  }
}
