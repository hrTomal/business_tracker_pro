import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FittedBox(
        child: Text(title),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      foregroundColor: Theme.of(context).colorScheme.inverseSurface,
      actions: actions,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32), // Adjust the radius to match your design
        ),
      ),
      elevation: 8,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
