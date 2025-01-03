import 'package:flutter/material.dart';

class GenericNameDeleteCard extends StatelessWidget {
  final String name;
  final VoidCallback onDelete;

  const GenericNameDeleteCard({
    Key? key,
    required this.name,
    required this.onDelete,
  }) : super(key: key);

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Delete Confirmation'),
          content: Text('Are you sure you want to delete "$name"?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
                onDelete(); // Trigger the delete callback
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(
          name,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () => _showConfirmationDialog(context),
        ),
      ),
    );
  }
}
