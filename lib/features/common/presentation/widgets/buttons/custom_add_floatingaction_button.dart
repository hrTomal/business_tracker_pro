import 'package:flutter/material.dart';

class CustomAddFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomAddFloatingActionButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      icon: const Icon(
        Icons.add,
        //color: Theme.of(context).colorScheme.inverseSurface,
      ),
      label: Text(
        title,
        style: const TextStyle(
          //color: Theme.of(context).colorScheme.inverseSurface,
          fontWeight: FontWeight.bold,
          // fontSize: 18,
        ),
      ),
      //backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
    );
  }
}
